function activate_virtualenv
    # set the base directory for the virtualenvs using $WORKON_HOME if set
    if test -z $WORKON_HOME
        set -g WORKON_HOME ~/Envs
    end

    if not test -d $WORKON_HOME
        echo "Bad virtualenv basedir: '$WORKON_HOME'. Abort."
        return
    end

    # arg check
    if not count $argv > /dev/null
       echo "Missing virtualenv name."
       return
    end

    # build the whole path
    set FULL_ENV_PATH $WORKON_HOME/$argv[1]

    if not test -d $FULL_ENV_PATH
       echo "Virtualenv '$FULL_ENV_PATH' does not exist. Abort."
       return
    end

    # check there is an activate script
    set ACTIVATE_PATH $FULL_ENV_PATH/bin/activate.fish
    if not test -f $ACTIVATE_PATH
       echo "Missing script '$ACTIVATE_PATH'. Is virtualenv correctely inited?"
       exit 1
    end

    source $ACTIVATE_PATH
end
