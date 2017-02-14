#!/bin/bash
#
# (C) 2017 - Daniele Zanotelli
# dazano@gmail.com
# Written on 2017-02-02 10:25
#
# Simple Virtual Env Wrapper
#
# Small script to activate the python wirtualenv even kept in $WORKON_HOME
# without using virtualenv warpper

##
# NOTE:
# In order to use this, you need to source this script. Eg, provide a
# `source /path/to/activate_ve.bash' line in your .bashrc file

####
# Activate a virtualenv kept in $WORKON_HOME (compatibility with virtualenv
# wrapper)
#
# param $1: the name of the virtualenv to activate
#
function activate_virtualenv() {
    DEFAULT_WORKON_HOME=~/Envs

    # set the base directory for the virtualenvs using $WORKON_HOME if set
    if [ -z "$WORKON_HOME" ]
    then
        WORKON_HOME="$DEFAULT_WORKON_HOME"
    fi
    if ! ([ -d $WORKON_HOME ])
    then
        echo "Bad virtualenv basedir: '$WORKON_HOME'. Abort."
        return
    fi

    # arg check
    if [ -z "$1" ]
    then
        echo "Missing virtualenv name."
        return
    fi

    # build the whole path
    FULL_ENV_PATH="$WORKON_HOME/$1"
    if ! ([ -d "$FULL_ENV_PATH" ])
    then
        echo "Virtualenv '$FULL_ENV_PATH' does not exist. Abort."
        return
    fi

    # check there is an activate script
    ACTIVATE_PATH="$FULL_ENV_PATH/bin/activate"
    if ! ([ -f "$ACTIVATE_PATH" ])
    then
        echo "Missing script '$ACTIVATE_PATH'. Is virtualenv correctely inited?"
        return
    fi

    source "$ACTIVATE_PATH"
}

####
# Activate the virtualenv in the current tree, recursively searching for
# `bin/activate' script in this and parents directory.  Recursion stops if
# current dir is $HOME.
#
function tree_activate_virtualenv {
    # keep track of current dir in order to cd back
    STARTING_DIR=$(pwd)
    FOUND=0

    # recurively search for `bin/activate'
    while [ $(pwd) != $HOME ] && [ $(pwd) != '/home' ] && [ $(pwd) != '/' ] ;
    do
        if [ -d "bin" ] && [ -f "bin/activate" ] ; then
            source bin/activate
            FOUND=1
            break
        fi
        cd ..
    done

    # nothing found
    if [ $FOUND == 0 ] ; then
        echo "Virtual env not found."
    fi

    # cd back to stargin directory
    cd $STARTING_DIR
}

## aliases
alias ave=activate_virtualenv
alias tave=tree_activate_virtualenv
