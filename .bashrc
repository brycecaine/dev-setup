[ -z "$PS1" ] && return
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# ----------------------------------------------------------------------------
# Prompt
function parse_git_dirty {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "*"
}

function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/(\1$(parse_git_dirty))/"
}

build_prompt () {
    PS1='\[\e[0;33m\]\A \[\e[0;35m\]\u\[\e[1;34m\]@\h\[\e[0m\]:\w'
    git_info=$(parse_git_branch)
    if [[ $git_info ]]; then
        PS1+=" \[\[\e[0;32m\]$git_info$"
    fi
    PS1+="\[\e[0m\] $ "
}
PROMPT_COMMAND=build_prompt

# ----------------------------------------------------------------------------
# Aliases
alias l='ls'
alias ls='ls -Fh'
alias ll='ls -lah'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias cdlc='cd storage/shared'

# ----------------------------------------------------------------------------
# Sets
set -o vi
set show-mode-in-prompt on

# ----------------------------------------------------------------------------
# Exports
export BASHRC_RAN=true; export BASHRC_RAN
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
export EDITOR='vim -f'

# ----------------------------------------------------------------------------
# Commands
cal

if [ -d /data/data/com.termux/files/home/.termux ]; then
    # Command history tweaks:
    # - Append history instead of overwriting
    #   when shell exits.
    # - When using history substitution, do not
    #   exec command immediately.
    # - Do not save to history commands starting
    #   with space.
    # - Do not save duplicated commands.
    shopt -s histappend
    shopt -s histverify
    export HISTCONTROL=ignoreboth

    # Default command line prompt.
    PROMPT_DIRTRIM=2
    PS1='\[\e[0;32m\]\w\[\e[0m\] \[\e[0;97m\]\$\[\e[0m\] '

    # Handles nonexistent commands.
    # If user has entered command which invokes non-available
    # utility, command-not-found will give a package suggestions.
    if [ -x /data/data/com.termux/files/usr/libexec/termux/command-not-found ]; then
        command_not_found_handle() {
            /data/data/com.termux/files/usr/libexec/termux/command-not-found "$1"
        }
    fi

    # Bryce add
    export FLASK_APP='/data/data/com.termux/files/home/.termux/tasker/app.py'
    # flask run &
    termux-wake-lock
    sshd
    nohup flask run > app.log 2>&1 &
    termux-notification -c '.bashrc has been run'
fi

