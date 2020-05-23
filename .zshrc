
# Basic Setup

## Enable auto-completion
autoload -Uz compinit
compinit

zstyle ':completion:*' menu select
setopt COMPLETE_ALIASES

# Load Git completion
zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
fpath=(~/.zsh $fpath)

autoload -Uz compinit && compinit

# Easier navigation: .., ..., ...., ....., ~ and -
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ~="cd ~" # `cd` is probably faster to type though
alias -- -="cd -"

# View Http traffic
alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump="sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\\: .*|GET \\/.*\""

# untar
alias untar='tar xvf'

# Aliases

## Open applications
alias code='open -a Visual\ Studio\ Code'
alias sonos='open -a Sonos'

alias ll="ls -al" # List all files in current directory in long list format
alias ip="curl icanhazip.com" # Your public IP address

alias bb=python\ /Users/calebshafer/dev/imodel02/src/'BentleyBuild/BentleyBuild.py'
