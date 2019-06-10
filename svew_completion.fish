#!/bin/bash
#
# (C) 2019 - Daniele Zanotelli
# dazano@gmail.com
# Written on 2019-06-10 12:42
#
# Simple Virtual Env Wrapper
# Fish completion

# init
if test -z $WORKON_HOME
    set -g WORKON_HOME $HOME/Envs
end

function _svew_is_virtualenv
    if test -d $argv[1] -a -f $argv[1]/bin/activate.fish
       return 0
    else
       return 1
    end
end

function _svew_get_env_list
    # init vars
    set _SVEW_ENVLIST

   if not test -d $WORKON_HOME
       return
   end

   for _DIR in (ls $WORKON_HOME)
       set _IS_VENV (_svew_is_virtualenv $WORKON_HOME/$_DIR)
       if test _IS_VENV

           set _SVEV_ENVLIST $_SVEV_ENVLIST $_DIR
       end
   end

   echo $_SVEV_ENVLIST
end

complete -c activate_virtualenv -d "virtualenv name" -xa "(_svew_get_env_list | tr ' ' \n)"
