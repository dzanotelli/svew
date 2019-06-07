#!/usr/bin/fish

## fish implementation

function activate_virtualenv
    set -g DEFAULT_WORKON_HOME ~/Envs

    # set the base directory for the virtualenvs using $WORKON_HOME if set
    if test -z $WORKON_HOME
        set -g WORKON_HOME $DEFAULT_WORKON_HOME
    end

    if not test -d $WORKON_HOME
        echo "Bad virtualenv basedir: '$WORKON_HOME'. Abort."
        exit 1
    end

    # arg check
    if not count $argv > /dev/null
       echo "Missing virtualenv name."
       exit 1
    end

    # build the whole path
    set FULL_ENV_PATH $WORKON_HOME/$argv[1]

    if not test -d $FULL_ENV_PATH
       echo "Virtualenv '$FULL_ENV_PATH' does not exist. Abort."
       exit 1
    end

    # check there is an activate script
    set ACTIVATE_PATH $FULL_ENV_PATH/bin/activate.fish
    if not test -f $ACTIVATE_PATH
       echo "Missing script '$ACTIVATE_PATH'. Is virtualenv correctely inited?"
       exit 1
    end

    source $ACTIVATE_PATH

end

alias ave activate_virtualenv
