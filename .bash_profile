function parse_git_dirty {
    [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit, working directory clean" ]] && echo "*"
}
function parse_git_branch {
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1$(parse_git_dirty)]/"
}

export PS1='\[$(tput bold)\]\[$(tput setaf 1)\]\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 3)\]\h \[$(tput setaf 2)\]\w\[$(tput setaf 1)\]\[$(tput setaf 7)\]$(parse_git_branch) \[$(tput setaf 1)\]▶\[$(tput sgr0)\] '


function phpserve {
    num=25555
    sleep 2 && open http://localhost:$num &
    php -S localhost:$num
}

alias phpserve=phpserve

alias emacsclient=/Applications/Emacs.app/Contents/MacOS/bin/emacsclient
# Opens emacs GUI if not already running
function emacs_open {
    open -a Emacs
    
    while [ `emacsclient -n $1 2>&1 | grep socket | wc -l` -gt 0 ]; do
        sleep 1
    done
}
export EDITOR=emacs_open
alias emacs=emacs_open


function emacs_wait {
    open -a Emacs
    
    while [ `emacsclient $1 2>&1 | grep socket | wc -l` -gt 0 ]; do
        sleep 1
    done
}



# MacPorts Installer addition on 2012-10-01_at_17:56:59: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.


export PATH="$HOME/local/emsdk_portable:$HOME/local/emsdk_portable/emscripten/incoming:$PATH"
export PATH="/usr/texbin/:$PATH"
export C_INCLUDE_PATH="/opt/local/include"
alias git_status="pushd $HOME/Projects/dotemacs/utils; lua git_global_status.lua --no-daemon; popd"
alias java6="/usr/libexec/java_home -v 1.6 --exec java"
alias java7="/usr/libexec/java_home -v 1.7 --exec java"
alias java8="/usr/libexec/java_home -v 1.8 --exec java"

alias lonestar="ssh lonestar.tacc.utexas.edu"


export LUA_PATH="?.lua;lua/?.lua"

# Adds git completions
if [ -f /opt/local/etc/profile.d/bash_completion.sh ]; then
    . /opt/local/etc/profile.d/bash_completion.sh
fi

. ~/Projects/dotemacs/.git-completion.bash
. ~/Projects/dotemacs/git-flow-completion.bash
. ~/Projects/dotemacs/z.sh

export DATABASE_URL="postgres://$(whoami)@localhost:5432/$(whoami)"
export PATH="/Applications/Postgres.app/Contents/Versions/9.3/bin/:$PATH"

##
# Your previous /Users/sm52286/.bash_profile file was backed up as /Users/sm52286/.bash_profile.macports-saved_2014-07-06_at_14:30:18
##

# MacPorts Installer addition on 2014-07-06_at_14:30:18: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.
export PATH="$HOME/anaconda/bin:$PATH"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

##
# Your previous /Users/stefano/.bash_profile file was backed up as /Users/stefano/.bash_profile.macports-saved_2014-08-14_at_10:50:28
##

# MacPorts Installer addition on 2014-08-14_at_10:50:28: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.

. ~/.bash_profile_local
