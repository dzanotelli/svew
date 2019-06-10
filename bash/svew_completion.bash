#!/bin/bash
#
# (C) 2017 - Daniele Zanotelli
# dazano@gmail.com
# Written on 2017-02-13 09:34
#
# Simple Virtual Env Wrapper
# Bash completion

# init
if [ -z "$WORKON_HOME" ] ; then
    WORKON_HOME="$HOME/Envs"
fi

##
# Return "true" if <dir>/source/activate is found
#
_svew_is_virtualenv() {
    if [ -d "$1" ] ; then
        if [ -f "$1/bin/activate" ]; then
            return 0;
        fi
    fi
    return 1;
}

_svew_get_env_list() {
    # init var
    _SVEW_ENVLIST=""
    _SVEW_DIR_IS_VE=1
    if [ -d "$WORKON_HOME" ] ; then
        for _DIR in $(ls "$WORKON_HOME"); do
            $(_svew_is_virtualenv "$WORKON_HOME/$_DIR")
            _SVEW_DIR_IS_VE=$?
            if [ $_SVEW_DIR_IS_VE -eq 0 ] ; then
                _SVEW_ENVLIST="$_SVEW_ENVLIST $_DIR"
            fi
        done
    fi

    # return the trimmed list
    echo "$_SVEW_ENVLIST" | xargs
}

_svew_activate_virtualenv_completion() {
    local cur=${COMP_WORDS[COMP_CWORD]}
    local options=$(_svew_get_env_list)
    COMPREPLY=( $(compgen -W "$options" -- $cur) )
}


# activate_virtualenv
complete -F _svew_activate_virtualenv_completion activate_virtualenv
complete -F _svew_activate_virtualenv_completion ave
