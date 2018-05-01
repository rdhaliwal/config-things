#!/bin/sh 

# Git post-commit hook to make a dumb dad jokes after you do a commit
#
# Installation
#
#   ln -s ~/workspace/git-things/hooks/post-commit /path/to/project/.git/hooks/post-commit
#

echo "====================="
curl 'https://icanhazdadjoke.com/'
echo ""
echo "====================="
