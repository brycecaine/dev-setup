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
alias ls='ls -Fh'
alias ll='ls -lah'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# ----------------------------------------------------------------------------
# Sets
set -o vi
set show-mode-in-prompt on

# ----------------------------------------------------------------------------
# Exports
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
export EDITOR='vim -f'

