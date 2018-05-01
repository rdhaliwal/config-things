#!/bin/sh 

# Git pre-commit hook to check all staged Ruby (*.rb/js/coffee/cjsx) files 
# for binding.pry, debugger or console.log references
#
# Installation
#
#   ln -s ~/workspace/git-things/pre-commit.sh /path/to/project/.git/hooks/pre-commit
#
# Based on 
#
#   http://codeinthehole.com/writing/tips-for-using-a-git-pre-commit-hook/
#   http://mark-story.com/posts/view/using-git-commit-hooks-to-prevent-stupid-mistakes
#   https://gist.github.com/3266940
#   https://gist.github.com/alexbevi/3436040
#

FILES='(js|rb|coffee)'
FORBIDDEN='(binding\.pry|console\.log|debugger|\.only)'
GREP_COLOR='4;5;37;41'

if [[ $(git diff --cached --name-only | grep -E $FILES) ]]; then
  git diff --cached --name-only | grep -E $FILES | \
  xargs grep --color --with-filename -n -E $FORBIDDEN && \
  echo "" && \
  echo "You've got a binding.pry, console.log, .only or a debugger in your commit." && \
  echo "You better checkity-check yourself before you wriggedy-wreck yourself." && \
  echo "Or just run 'git commit --no-verify' to skip this check." && \
  echo "" && \
  echo "" && \
  echo "You savage." && \
  exit 1
fi

exit 0
