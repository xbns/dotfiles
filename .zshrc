
# path
PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/usr/bin/sudo:/snap/bin:/usr/sbin/go:/home/don/.local/bin"

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"


# Start Docker daemon automatically when loggin in if not running

# RUNNING=`ps aux | grep dockerd | grep -v grep`
# if [[ -z "$RUNNING"]]; then
#   sudo dockerd > /dev/null 2>&1 &
#   disown
# fi



#use a history file in here
HISTFILE=$HOME/.zsh_history
# make it huge, really huge.
export SAVEHIST=1000000000
export HISTSIZE=1000000000
export HISTFILESIZE=1000000000
export HISTTIMEFORMAT="[%F %T] "

# there is for sure still some redundancy, but ...
# setopt BANG_HIST                 # Treat the '!' character specially during expansion.
# setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
#setopt HIST_VERIFY               # Don't execute immediately upon history expansion.
#setopt HIST_BEEP                 # Beep when accessing nonexistent history.

## Git alias
alias 'gb=git branch'
alias 'gp=git push'
alias 'gp=git push origin'
alias 'gtd=git tag --delete'
alias 'gpl=git pull'
alias 'gplo=git pull origin'
alias 'gc=git commit -m'
alias 'gst=git status'
alias 'gd=git diff'
alias 'ga=git add'
alias 'gaa=git add --all'
alias 'gco=git checkout'
alias 'gsb=git switch --branch'
alias 'gm=git merge'
alias 'gl=git log'
alias 'gr=git remote'
alias 'grs=git remote show'
alias 'glo=git log --pretty=oneline'
alias 'glol=git log --graph  --pretty=oneline --decorate'

# sga = show git alias - press 'q' to quit
alias 'gsa=git config --get-regexp alias'

# use antigen

source $HOME/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle lein
antigen bundle pip
antigen bundle command-not-found
antigen bundle jump
antigen bundle history
antigen bundle github
antigen bundle common-aliases
antigen bundle compleat
antigen bundle colorize
antigen bundle git-extras
antigen bundle npm
antigen bundle z
antigen bundle sudo
antigen bundle web-search
antigen bundle docker
antigen bundle jsontools
antigen bundle vscode
antigen bundle taskwarrior
antigen bundle tig
antigen bundle dirhistory
antigen bundle copyfile
antigen bundle emoji
antigen bundle rsync
antigen bundle adb
antigen bundle golang
antigen bundle helm
antigen bundle themes

antigen theme romkatv/powerlevel10k

# Syntax autocompletition
antigen bundle zsh-users/zsh-completions

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions

antigen apply

typeset -g POWERLEVEL9K_INSTANT_PROMPT=off

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)
typeset -gA ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[cursor]='bold'

ZSH_HIGHLIGHT_STYLES[alias]='fg=green,bold'
ZSH_HIGHLIGHT_STYLES[suffix-alias]='fg=green,bold'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=green,bold'
ZSH_HIGHLIGHT_STYLES[function]='fg=green,bold'
ZSH_HIGHLIGHT_STYLES[command]='fg=green,bold'
ZSH_HIGHLIGHT_STYLES[precommand]='fg=green,bold'
ZSH_HIGHLIGHT_STYLES[hashed-command]='fg=green,bold'


export ZSH_THEME="powerlevel10k/powerlevel10k"

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nano'
else
  export EDITOR='code'
fi

# Path to your oh-my-zsh installation.

export ZSH="$HOME/.oh-my-zsh"
export ZSH_CUSTOM="$ZSH/custom"


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Auto Detect .nvmrc files
# https://github.com/creationix/nvm#zsh
# place this after nvm initialization!
autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc


source $ZSH/oh-my-zsh.sh



# Use ghoscript to merge PDFs on terminal
function pdfmerge() {
  if [[ $# -lt 2 ]]; then
    echo "usage: $0 <out.pdf> <in1.pdf> <in2.pdf> ... <inn.pdf>" >&2
    return 1
  fi
  gs -dBATCH -dNOPAUSE -q -sDEVICE=pdfwrite -dPDFSETTINGS=/prepress -sOutputFile=$@ ; 
}

# Comment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

ZSH_CACHE_DIR=$HOME/.cache/oh-my-zsh
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
