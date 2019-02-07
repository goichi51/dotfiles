# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi
# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
source /usr/local/etc/bash_completion.d/git-prompt.sh
source /usr/local/etc/bash_completion.d/git-completion.bash
GIT_PS1_SHOWDIRTYSTATE=true

if [ $UID -eq 0 ]; then
	export PS1='\[\033[31m\]\u:\[\033[37m\]\w\[\033[31m\]$(__git_ps1)\[\033[0m\]\$ '
else
	export PS1='\[\033[36m\]\u:\[\033[37m\]\w\[\033[31m\]$(__git_ps1)\[\033[0m\]\$ '
fi
# "-F":ディレクトリに"/"を表示 / "-G"でディレクトリを色表示
alias ls='ls -FG'
alias ll='ls -alFG'

set -o vi
bind 'set show-mode-in-prompt on'
bind 'set vi-ins-mode-string \1\e[6 q\2'
bind 'set vi-cmd-mode-string \1\e[2 q\2'

