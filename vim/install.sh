#!/bin/bash

#install .vimrc to home directory

eval userhome=~$(whoami)

ln -s $PWD"/.vimrc" $userhome"/.vimrc"
