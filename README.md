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

The best way to install svew stuff is to copy the functions under its third
party directory:

```
cp fish/functions/* /usr/share/fish/vendor_functions.d/
cp fish/completions/* /usr/share/fish/vendor_completions.d/
```

This will make svew available for all the users on the system. Alternatively,
you can choose to copy svew files under `~/.config/fish/functions` and
`~/.config/fish/completions` for each user you want to make svew available for.
