function parse_git_dirty {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit, working directory clean" ]] && echo "*"
}
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1$(parse_git_dirty)]/"
}


alias aquamacs='open -b org.gnu.Aquamacs'
# MacPorts Installer addition on 2012-10-01_at_17:56:59: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

# Launches git global daemon, if needed
ps aux | grep git_global_status.lua | grep -v grep >/dev/null
if [ $? -eq 1 ]; then
    echo "Launching git_global_status daemon"
    cd ~/Projects/dotemacs/utils; /usr/bin/nohup >/dev/null 2>&1 lua ~/Projects/dotemacs/utils/git_global_status.lua &
    cd ~
fi

# added by Anaconda 1.6.1 installer
export PATH="$HOME/anaconda/bin:$PATH"
export PATH="$HOME/local/emsdk_portable:$HOME/local/emsdk_portable/emscripten/incoming:$PATH"
export PATH="/usr/texbin/:$PATH"
export C_INCLUDE_PATH="/opt/local/include"
alias emacs="emacsclient -n "
alias git_status="cat ~/.git_global_report"

export PS1='`cat ~/.git_global_stats` \u \[\033[1;33m\]\w\[\033[0m\]$(parse_git_branch)$ '

export XGRID_CONTROLLER_HOSTNAME="xgrid.as.utexas.edu"
export XGRID_CONTROLLER_PASSWORD="ast_xgrid"
export LUA_PATH="?.lua;lua/?.lua"

