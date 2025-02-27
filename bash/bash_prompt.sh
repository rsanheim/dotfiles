#!/bin/bash

########################################################################
# Git Bash Prompt
# Credit to Matthew Mccullough
########################################################################
RED="\[\033[0;31m\]"
YELLOW="\[\033[0;33m\]"
GREEN="\[\033[0;32m\]"
BLUE="\[\033[0;34m\]"
LIGHT_RED="\[\033[1;31m\]"
LIGHT_GREEN="\[\033[1;32m\]"
WHITE="\[\033[1;37m\]"
LIGHT_GRAY="\[\033[1;34m\]"
COLOR_NONE="\[\e[0m\]"

function parse_git_branch {
  git rev-parse --git-dir &>/dev/null
  git_status="$(git status 2>/dev/null)"
  branch_pattern="On branch ([^${IFS}]*)"
  remote_pattern="Your branch is (.*) '"
  diverge_pattern="Your branch and (.*) have diverged"

  if [[ ! ${git_status}} =~ "working tree clean" ]]; then
    state="${LIGHT_RED}⚡"
  fi
  # add an else if or two here if you want to get more specific
  if [[ ${git_status} =~ ${remote_pattern} ]]; then
    if [[ ${BASH_REMATCH[1]} == "ahead of" ]]; then
      remote="${YELLOW}↑"
    fi
    if [[ ${BASH_REMATCH[1]} == "behind" ]]; then
      remote="${YELLOW}↓"
    fi
  fi
  if [[ ${git_status} =~ ${diverge_pattern} ]]; then
    remote="${YELLOW}↕"
  fi
  if [[ ${git_status} =~ ${branch_pattern} ]]; then
    branch=${BASH_REMATCH[1]}
    echo " (${branch})${remote}${state}"
  fi
}

function git_dirty_flag {
  git status 2>/dev/null | grep -c : | awk '{if ($1 > 0) print "⚡"}'
}

# function timer_stop {
#   timer_show=$(($SECONDS - $timer))
#   unset timer
# }

# requires coreutils on Mac
function timer_now {
  /opt/homebrew/opt/coreutils/libexec/gnubin/date +%s%N
}

function timer_start {
  timer_start=${timer_start:-$(timer_now)}
}

# from https://stackoverflow.com/a/34812608
function timer_stop {
  local delta_us=$((($(timer_now) - $timer_start) / 1000))
  local us=$((delta_us % 1000))
  local ms=$(((delta_us / 1000) % 1000))
  local s=$(((delta_us / 1000000) % 60))
  local m=$(((delta_us / 60000000) % 60))
  local h=$((delta_us / 3600000000))
  # Goal: always show around 3 digits of accuracy
  if ((h > 0)); then
    timer_show=${h}h${m}m
  elif ((m > 0)); then
    timer_show=${m}m${s}s
  elif ((s >= 10)); then
    timer_show=${s}.$((ms / 100))s
  elif ((s > 0)); then
    timer_show=${s}.$(printf %03d $ms)s
  elif ((ms >= 100)); then
    timer_show=${ms}ms
  elif ((ms > 0)); then
    timer_show=${ms}.$((us / 100))ms
  else
    timer_show=${us}us
  fi
  unset timer_start
}

function prompt_func_without_timer {
  prompt="${TITLEBAR}${BLUE}[${LIGHT_GRAY}\w${GREEN}$(parse_git_branch)${BLUE}]${COLOR_NONE}"
  PS1="${prompt} > "
}

function prompt_func() {
  local exit_code="$?"
  timer_stop
  # \w is the full current working directory
  # \W is just the trailing part of the current working directory
  prompt="${TITLEBAR}${BLUE}[${LIGHT_GRAY}\w${GREEN}$(parse_git_branch)${BLUE}]${COLOR_NONE}"

  local elasped_time="(${timer_show})"
  if test $exit_code -eq 0; then
    PS1="${prompt} ${elasped_time} > "
  else
    PS1="${prompt}${RED} [${exit_code}] ${elasped_time} >${COLOR_NONE} "
  fi
}
trap 'timer_start' DEBUG

PROMPT_COMMAND=prompt_func_without_timer
