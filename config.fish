alias emacsclient /Applications/Emacs.app/Contents/MacOS/bin/emacsclient
# Opens emacs GUI if not already running
function emacs_open 
    open -a Emacs
    
    while test (emacsclient -n $argv 2>&1 | grep socket | wc -l) -gt 0; 
        sleep 1;
    end
end
set -x EDITOR emacs_open
alias emacs emacs_open
set -x PATH /opt/local/bin:/opt/local/sbin:$PATH
set -x PATH "$HOME/local/emsdk_portable:$HOME/local/emsdk_portable/emscripten/incoming:$PATH"
set -x PATH "/usr/texbin/:$PATH"

set -x DATABASE_URL "postgres://(whoami)@localhost:5432/(whoami)"
set -x PATH "/Applications/Postgres.app/Contents/Versions/9.3/bin/:$PATH"
set -x PATH "/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.
set -x PATH "$HOME/anaconda/bin:$PATH"

### Added by the Heroku Toolbelt
set -x PATH "/usr/local/heroku/bin:$PATH"
