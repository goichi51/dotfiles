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

function challenge() {
	g++ -std=c++14 ~/cpp-challenge/test/a$1.cpp ~/cpp-challenge/mine/q$1.cpp && ./a.out
	rm ./a.out
}
#set -o vi
#bind 'set show-mode-in-prompt on'
#bind 'set vi-ins-mode-string \1\e[6 q\2'
#bind 'set vi-cmd-mode-string \1\e[2 q\2'
PATH="~/Library/Python/3.7/bin:$PATH"
PATH="/usr/local/opt/icu4c/bin:$PATH"
PATH="/usr/local/opt/icu4c/sbin:$PATH"
PATH="/Applications/CMake.app/Contents/bin:$PATH"
PATH="$HOME/.nodebrew/current/bin:$PATH"
PATH="/usr/local/go/bin:$PATH"

export LDFLAGS="-L/usr/local/opt/icu4c/lib"
export CPPFLAGS="-I/usr/local/opt/icu4c/include"
export PKG_CONFIG_PATH="/usr/local/opt/icu4c/lib/pkgconfig"
export CPATH="/usr/local/include:$CPATH"
export LIBRARY_PATH="/usr/local/include:$LIBRARY_PATH"
export GOPATH="$HOME/go"
export ATHENZ_SECRET=`cat ~/conf/.athenz_secret`

function search() {
	if [ $# = 2 ]; then
		find $1 -type f -print | xargs grep $2
	else
		echo 'usage: search FILE_PATH SEARCH_STRING' 
	fi
}
function proc() {
	ps aux | grep $1 
}
