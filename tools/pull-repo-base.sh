#! /usr/bin/env bash

REMOTE_REPO=$1
LOCAL_WORKSPACE=$2


if [ -z $REMOTE_REPO -o -z $LOCAL_WORKSPACE ]; then
    echo "invalid call pull-repo.sh '$REMOTE_REPO' '$LOCAL_WORKSPACE'"
elif [ ! -d $LOCAL_WORKSPACE ]; then
    proxychains4 git clone $REMOTE_REPO $LOCAL_WORKSPACE
else
    cd $LOCAL_WORKSPACE
    proxychains4 git fetch --all --tags
    cd -
fi
