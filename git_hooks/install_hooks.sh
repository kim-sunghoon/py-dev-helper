#!/usr/bin/env bash

echo "Installing hooks..."
GIT_DIR=$(git rev-parse --git-dir)
echo $GIT_DIR
cd $GIT_DIR/hooks
current_dir=`pwd`
echo $current_dir
# create symlink to our pre-commit and pre-push scripts
ln -s ../../git_hooks/pre_commit.sh pre-commit
# make the symlinks executable
chmod a+rwx ${GIT_DIR}/hooks/pre-commit
echo "Done!"
