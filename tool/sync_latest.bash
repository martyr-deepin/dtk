#!/bin/bash

# sync all projects to the latest tags.

# set -x

function sync_project() {
    local latest_tag
    local project=$1
    local script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
    local project_dir="$(dirname $script_dir)/$project"
    local git_dir="$project_dir/.git"

    git --git-dir=$git_dir pull origin master --tags > /dev/null
    latest_tag=$(git --git-dir=$git_dir tag | tail -n1)

    echo "checking project $project to version $latest_tag" 

    git --git-dir=$git_dir checkout $latest_tag > /dev/null
}

project_list=( \
dtkcore \
dtkwidget \
dtkwm \
)

for project in "${project_list[@]}";
do
    sync_project $project
done
