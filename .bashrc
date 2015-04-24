[ -z "$PS1" ] && return

function parse_git_dirty {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "*"
}

function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/(\1$(parse_git_dirty))/"
}

export CLICOLOR=1
export EDITOR='vim -f'

export PS1="\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;36m\]\w\[\033[00m\]\$(parse_git_branch)\$ "

alias ls='ls --color=auto'
alias ll='ls -la'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias r='python manage.py runserver 0.0.0.0:3000'

# path for local python packages
export PATH=$PATH:$HOME/.local/bin
# path for google appengine
export PATH=$PATH:$HOME/.google_appengine
# django project setups (Bryce)
alias setup_ml='. ~/dev-setup/.setup_mapmylegacy.sh'
alias setup_sc='. ~/dev-setup/.setup_scoutcharter.sh'
alias setup_gf='. ~/dev-setup/.setup_giftively.sh'
alias setup_bm='. ~/dev-setup/.setup_budgetmain.sh'

export SC_EMAIL_HOST='smtp.gmail.com'
export SC_EMAIL_HOST_PASSWORD=''
export SC_EMAIL_HOST_USER='scoutcharter.com@gmail.com'
export SC_EMAIL_PORT=587
export SC_EMAIL_USE_TLS=True
