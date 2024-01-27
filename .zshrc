
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

# Startup GPG Agent

# This check to make sure the GPG Agent is running and if not, starts it
if [[ -f "~/.gnupg/.gpg-agent-info" && -n "$(pgrep gpg-agent)" ]]; then    
  source ~/.gnupg/.gpg-agent-info
  export GPG_AGENT_INFO
else
  eval $(eval $(gpg-agent --daemon --options ~/.gnupg/gpg-agent.conf))
fi

# Setup nvm

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

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

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/terraform terraform

# Setup a global pnpm store for Rush
export RUSH_PNPM_STORE_PATH=/Users/calebshafer/dev/github/pnpm-store
export PATH="/usr/local/opt/python@3.10/bin:$PATH"

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/calebshafer/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)