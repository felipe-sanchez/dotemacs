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

function condalist -d 'List conda environments.'
  for dir in (ls $HOME/anaconda/envs)
    echo $dir
  end
end
 
function condactivate -d 'Activate a conda environment' -a cenv
  if test -z $cenv
    echo 'Usage: condactivate <env name>'
    return 1
  end
 
  # condabin will be the path to the bin directory
  # in the specified conda environment
  set condabin $HOME/anaconda/envs/$cenv/bin
 
  # check whether the condabin directory actually exists and
  # exit the function with an error status if it does not
  if not test -d $condabin
    echo 'Environment not found.'
    return 1
  end
 
  # deactivate an existing conda environment if there is one
  if set -q __CONDA_ENV_ACTIVE
    deactivate
  end
 
  # save the current path
  set -xg DEFAULT_PATH $PATH
 
  # put the condabin directory at the front of the PATH
  set -xg PATH $condabin $PATH
 
  # this is an undocumented environmental variable that influences
  # how conda behaves when you don't specify an environment for it.
  # https://github.com/conda/conda/issues/473
  set -xg CONDA_DEFAULT_ENV $cenv
 
  # set up the prompt so it has the env name in it
  functions -e __original_fish_prompt
  functions -c fish_prompt __original_fish_prompt
  function fish_prompt
    set_color blue
    echo -n '('$CONDA_DEFAULT_ENV') '
    set_color normal
    __original_fish_prompt
  end
 
  # flag for whether a conda environment has been set
  set -xg __CONDA_ENV_ACTIVE 'true'
end
 
function deactivate -d 'Deactivate a conda environment'
  if set -q __CONDA_ENV_ACTIVE
    # set PATH back to its default before activating the conda env
    set -xg PATH $DEFAULT_PATH
    set -e DEFAULT_PATH
 
    # unset this so that conda behaves according to its default behavior
    set -e CONDA_DEFAULT_ENV
 
    # reset to the original prompt
    functions -e fish_prompt
    functions -e __original_fish_prompt
    set -e __CONDA_ENV_ACTIVE
  end
end
 
 
# aliases so condactivate and deactivate can have shorter names
function ca -d 'Activate a conda environment'
  condactivate $argv
end
 
function cda -d 'Deactivate a conda environment'
  deactivate $argv
end
 
 
# complete conda environment names when activating
complete -c condactivate -xA -a "(condalist)"
complete -c ca -xA -a "(condalist)"

set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate 'yes'
set __fish_git_prompt_showuntrackedfiles 'yes'
set __fish_git_prompt_showupstream 'yes'
set __fish_git_prompt_color_branch yellow
set __fish_git_prompt_color_upstream_ahead green
set __fish_git_prompt_color_upstream_behind red

# Status Chars
set __fish_git_prompt_char_dirtystate '*'
set __fish_git_prompt_char_stagedstate '>'
set __fish_git_prompt_char_untrackedfiles 'U'
set __fish_git_prompt_char_stashstate 'S'
set __fish_git_prompt_char_upstream_ahead '+'
set __fish_git_prompt_char_upstream_behind '-'

function fish_prompt --description 'Write out the prompt'
	
	set -l last_status $status

	if not set -q __fish_prompt_normal
		set -g __fish_prompt_normal (set_color normal)
	end

	# PWD
	set_color $fish_color_cwd
	echo -n (prompt_pwd)
	set_color normal

	printf '%s ' (__fish_git_prompt)

	if not test $last_status -eq 0
	set_color $fish_color_error
	end

	echo -n '▶ '

end
