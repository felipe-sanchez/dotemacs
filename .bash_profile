function parse_git_dirty {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit, working directory clean" ]] && echo "*"
}
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1$(parse_git_dirty)]/"
}

function emacs_open {
    open -a Emacs && emacsclient -n $1 
}

# MacPorts Installer addition on 2012-10-01_at_17:56:59: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.


# added by Anaconda 1.6.1 installer
export PATH="$HOME/local/emsdk_portable:$HOME/local/emsdk_portable/emscripten/incoming:$PATH"
export PATH="/usr/texbin/:$PATH"
export C_INCLUDE_PATH="/opt/local/include"
alias emacs=emacs_open
alias git_status="pushd $HOME/Projects/dotemacs/utils; lua git_global_status.lua --no-daemon; popd"
alias java6="/usr/libexec/java_home -v 1.6 --exec java"
alias java7="/usr/libexec/java_home -v 1.7 --exec java"
alias java8="/usr/libexec/java_home -v 1.8 --exec java"

alias lonestar="ssh lonestar.tacc.utexas.edu"

export PS1='`cat ~/.git_global_stats` \u \[\033[1;33m\]\w\[\033[0m\]$(parse_git_branch)$ '

export LUA_PATH="?.lua;lua/?.lua"

# Adds git completions
  if [ -f /opt/local/etc/profile.d/bash_completion.sh ]; then
      . /opt/local/etc/profile.d/bash_completion.sh
  fi

. ~/Projects/dotemacs/.git-completion.bash
. ~/Projects/dotemacs/git-flow-completion.bash
. ~/Projects/dotemacs/z.sh

##
# Your previous /Users/sm52286/.bash_profile file was backed up as /Users/sm52286/.bash_profile.macports-saved_2014-07-06_at_14:30:18
##

# MacPorts Installer addition on 2014-07-06_at_14:30:18: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.
export PATH="$HOME/anaconda/bin:$PATH"
