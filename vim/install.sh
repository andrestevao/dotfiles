#!/bin/bash

#install .vimrc to home directory

eval userhome=~$(whoami)

#this is meant to be executed with the installAllDotfiles.sh script on the folder 1 level behind
ln -s $PWD"/vim/.vimrc" $userhome"/.vimrc"
ln -s $PWD"/vim/.vim" $userhome"/.vim"
