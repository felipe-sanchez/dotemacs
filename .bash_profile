

# Load RVM, if you are using it
[[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm

# Add rvm gems and nginx to the path
export PATH=$PATH:~/.gem/ruby/1.8/bin:/opt/nginx/sbin

# Path to the bash it configuration
export BASH_IT=$HOME/.bash_it

# Lock and Load a custom theme file
# location /.bash_it/themes/
export BASH_IT_THEME='clean'

# Your place for hosting Git repos. I use this for private repos.
export GIT_HOSTING='git@git.domain.com'

# Set my editor and git editor
export EDITOR="emacsclient -c "
export GIT_EDITOR='emacsclient -c '

# Set the path nginx
export NGINX_PATH='/opt/nginx'

# Don't check mail when opening terminal.
unset MAILCHECK

# Change this to your console based IRC client of choice.

export IRC_CLIENT='irssi'

# Set this to the command you use for todo.txt-cli

export TODO="t"

# Set vcprompt executable path for scm advance info in prompt (demula theme)
# https://github.com/xvzf/vcprompt
#export VCPROMPT_EXECUTABLE=~/.vcprompt/bin/vcprompt

# Load Bash It
source $BASH_IT/bash_it.sh

alias aquamacs='open -b org.gnu.Aquamacs'
# MacPorts Installer addition on 2012-10-01_at_17:56:59: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.


# added by Anaconda 1.6.1 installer
export PATH="/Users/sm52286/anaconda/bin:$PATH"
export PATH="/Users/sm52286/local/emsdk_portable:/Users/sm52286/local/emsdk_portable/emscripten/incoming:$PATH"
export PATH="/usr/texbin/:$PATH"
export C_INCLUDE_PATH="/opt/local/include"
alias emacs="emacsclient -c "
