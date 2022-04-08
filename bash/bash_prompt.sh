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
  git rev-parse --git-dir &> /dev/null
  git_status="$(git status 2> /dev/null)"
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
  git status 2> /dev/null | grep -c : | awk '{if ($1 > 0) print "⚡"}'
}

function prompt_func() {
  local exit_code="$?"
  previous_return_value=$?;
    # \w is the full current working directory
    # \W is just the trailing part of the current working directory
    prompt="${TITLEBAR}${BLUE}[${LIGHT_GRAY}\w${GREEN}$(parse_git_branch)${BLUE}]${COLOR_NONE}"

    if test $exit_code -eq 0
    then
        PS1="${prompt}> "
    else
        PS1="${prompt}${RED} [${exit_code}] >${COLOR_NONE} "
    fi
}

PROMPT_COMMAND=prompt_func
