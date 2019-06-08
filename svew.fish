#!/usr/bin/env fish

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


####
# Activate the virtualenv in the current tree, recursively searching for
# `bin/activate' script in this and parents directory.  Recursion stops if
# current dir is $HOME.
#
function tree_activate_virtualenv
    # keep track of current dir in order to cd back
    set STARTING_DIR (pwd)
    set FOUND false

    # recursively search for bin/activate.fish
    while true
        if test -d "bin" -a -f "bin/activate.fish"
            source bin/activate.fish
            set FOUND true
            break
        end

        cd ..

        set HERE (pwd)
        if test $HERE = $HOME -o $HERE = "/home" -o $HERE = "/"
           break
        end

    end

    # nothing found
    if test $FOUND = false
        echo "Virtual env not found."
    end

    # cd back to starting directory
    cd $STARTING_DIR

end


# aliases
alias ave activate_virtualenv
alias tave tree_activate_virtualenv
