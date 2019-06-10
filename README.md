# Simple VirtualEnv Wrapper #

(C) 2017-2019 Daniele Zanotelli
    dazano@gmail.com

A simple tool to activate python virtualenvs. Compatible with virtualenvwrapper
(using the same environment variables).


## Configuration sample ##

### bash

Add the following lines into your .bashrc file

```
# SVEW

SVEW="/path/to/svew/svew.bash"
SVEW_COMPLETION="/path/to/svew/svew_completion.bash"
if [ -f "$SVEW" ] ; then
    . "$SVEW"
else
    echo "Simple VirtualEnv Wrapper: '$SVEW' file not found."
fi
if [ -f "$SVEW_COMPLETION" ] ; then
    . "$SVEW_COMPLETION"
fi
```



### fish

Just copy `svew.fish` under your local user functions:

```
cp svew.fish ~/.config/fish/functions/
```

and the completion file under your completions:

```
cp svew_completion.fish ~/.config/fish/completions
```

*For system installation please check the official fish shell docs.*
