tap "homebrew/bundle"
tap "homebrew/services"
tap "heroku/brew"

# Get some essentials installed first
brew "asdf"
brew "bash"
brew "bash-completion"
brew "git"
cask "iterm2"
cask "1password"
cask "maestral" # a better, lighter weight Dropbox client - https://maestral.app
cask "rectangle" # simple, open source Mac OS window management - https://rectangleapp.com
cask "visual-studio-code" # duh
cask "firefox"
cask "zoom"

brew "ag"
brew "fd"
brew "findutils"
brew "heroku"
brew "hyperfine" # super cool shell benchmarking
brew "iperf"
brew "gh"
brew "jq"
brew "mas"
brew "postgresql@12", start_service: true
brew "redis", start_service: true
brew "ruby-build"
brew "shellcheck"
brew "sloccount"
brew "sqlite"
brew "tree"

# Needed for Ruby 3.0.2 (sigh)
brew "openssl@1.1"

# Needed For Ruby 3.1 and above, see https://github.com/rbenv/ruby-build/wiki
brew "openssl@3" 
brew "readline" 
brew "libyaml" 
brew "gmp"

# Cask based apps here...
cask "dash"
cask "fantastical"
cask "istat-menus"
cask "netnewswire"
cask "notion"
cask "roon"
cask "telegram-desktop"
cask "todoist"
cask "the-unarchiver"
cask "vlc"

# Mac App Store apps here
mas "AdGuard for Safari", id: 1440147259
mas "Amphetamine", id: 937984704
mas "Bear", id: 1091189122
mas "Dayone", id: 1055511498
mas "Slack", id: 803453959
mas "Speedtest", id: 1153157709

# Lower priority brew's are last - these are slow and/or not as important as the ones above
brew "flac"
brew "ffmpeg"
brew "graphviz"
brew "lame"
brew "shared-mime-info"
brew "wget"
brew "youtube-dl"
cask "google-chrome" # a necessary evil