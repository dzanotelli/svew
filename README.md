= Simple VirtualEnv Wrapper =

(C) 2017 Daniele Zanotelli
    dazano@gmail.com

A simple tool to manage python virtualenvs. Compatible with virtualenvwrapper
(using the same environment variables).

== Configuration sample ==

Add the following lines into your .bashrc file

"""
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
"""