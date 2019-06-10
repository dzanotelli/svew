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
