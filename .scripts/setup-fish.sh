#!/bin/bash

STRING="exec fish"

# Check if the string exists in .bashrc
if ! grep -Fxq "$STRING" ~/.bashrc; then
    # If the string does not exist, append it to .bashrc
    echo "$STRING" >> ~/.bashrc
    echo "Added 'exec fish' to ~/.bashrc"
else
    echo "'exec fish' already exists in ~/.bashrc"
fi

source $HOME/.bashrc
