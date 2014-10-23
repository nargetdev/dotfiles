alias edb="ed ~/.bashrc"

alias gs="git status"

alias sql='mysql -u group45 -p'

alias vB="vim ~/.bashrc"

alias ff='pwd && ls'
# cd to my directory
alias cdm='cd /var/www/html/group45'
# re-source this file
alias BB='source ~/.bashrc'

function git-branch-name {
		echo $(git symbolic-ref HEAD 2>/dev/null | awk -F/ {'print $NF'})
}

function git-dirty {
    st=$(git status 2>/dev/null | tail -n 1)
    if [[ $st != "nothing to commit, working directory clean" ]]
    then
				echo "*"
    fi
}

function git-unpushed {
    brinfo=$(git branch -v | grep `git-branch-name`)
    if [[ $brinfo =~ ("[ahead "([[:digit:]]*)]) ]]
    then
        echo "(${BASH_REMATCH[2]})"
    fi
}

function gitify {
    status=$(git status 2>/dev/null | head -n 1)
    if [[ $status == "" ]]
    then
        echo ""
    else
        echo $(git-branch-name)$(git-dirty)" "$(git-unpushed)
    fi
}

# now make the prompt
#PS1="\[\033[0;35m\]MOTHERSHIP:\[\033[0;33m\]\[\033[0;36m\]\w\[\033[m\]\[\033[0;33m\]\$git_branch\$git_dirt\[$txtrst\]\[\033[0;29m\] $(gitify)\n\$ "

function make-prompt
{
    local RED="\[\033[0;31m\]"
    local GREEN="\[\033[0;32m\]"
    local YELLOW="\[\033[0;33m\]"
    local BLUE="\[\033[0;34m\]"
		local MAGENTA="\[\033[0;35m\]"
    local CYAN="\[\033[0;36m\]"
    local LIGHT_GRAY="\[\033[0;37m\]"
 
    PS1="${MAGENTA}\h\
:${CYAN}\w\
${YELLOW} \$(gitify)\
\n${LIGHT_GRAY}$ "
}
make-prompt

# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
alias cdm='cd /var/www/html/group45/admin/pa1/php/html'
rc() {
	echo "$1" >> ~/.bashrc
	cat ~/.bashrc
}

alias cdm="cd /var/www/html/group45/admin"
alias gs='git status'
alias cdm='cd /var/www/html/group45/admin/pa2'
