# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

BASE_DIR=`dirname $BASH_SOURCE`
# User specific aliases and functions
source $BASE_DIR/git-prompt.sh
source $BASE_DIR/git-completion.bash
GIT_PS1_SHOWDIRTYSTATE=true

if [ $UID -eq 0 ]; then
	export PS1='\[\033[31m\]\h:\[\033[37m\]\w\[\033[31m\]$(__git_ps1)\[\033[0m\]\$ '
else
	export PS1='\[\033[36m\]\h:\[\033[37m\]\w\[\033[31m\]$(__git_ps1)\[\033[0m\]\$ '
fi
# "-F":ディレクトリに"/"を表示 / "-G"でディレクトリを色表示
alias ls='ls -FG'
alias ll='ls -alFG'

#set -o vi
#bind 'set show-mode-in-prompt on'
#bind 'set vi-ins-mode-string \1\e[6 q\2'
#bind 'set vi-cmd-mode-string \1\e[2 q\2'
PATH="~/Library/Python/3.7/bin:$PATH"
PATH="/usr/local/opt/icu4c/bin:$PATH"
PATH="/usr/local/opt/icu4c/sbin:$PATH"
PATH="/Applications/CMake.app/Contents/bin:$PATH"
PATH="$HOME/.nodebrew/current/bin:$PATH"
PATH="/usr/local/opt/go@1.11/bin:$PATH"

export LDFLAGS="-L/usr/local/opt/icu4c/lib"
export CPPFLAGS="-I/usr/local/opt/icu4c/include"
export PKG_CONFIG_PATH="/usr/local/opt/icu4c/lib/pkgconfig"
export CPATH="/usr/local/include:$CPATH"
export LIBRARY_PATH="/usr/local/include:$LIBRARY_PATH"
export GOPATH="$HOME/go"

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
