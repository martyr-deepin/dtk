#!/bin/bash

set -x

function print_help() {
    echo "auto_release.bash tag"
}

function tag_project() {
    #TODO: check tag
    #TODO: supoort force tag
    git checkout master
    git clean -fdx
    git pull -f -t

    clog --setversion ${new_tag} -C CHANGELOG.md
    git commit -m "Release ${new_tag}" -a
    git tag -a -m "Release ${new_tag}" ${new_tag}
    # git push --tags
    # push_tag_project
}

function push_tag_project() {
    git push
    git push --tags
}

new_tag=$1

if [ -z "${new_tag}" ]; then
    print_help
    exit -1
fi

project_list=( \
dtkcore \
dtkwidget \
dtkwm \
)

for project in "${project_list[@]}";
do
    echo ${project}
    cd ${project}
    tag_project
    cd ..
    git add ${project}
done

clog --setversion ${new_tag} -C CHANGELOG.md
git commit -m "feat: Release ${new_tag}" -a
git tag -a -m "Release ${new_tag}" ${new_tag}
