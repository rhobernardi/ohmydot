#!/usr/bin/env zsh

# Functions
pyenv() {
    local env=$HOME/.venvs
    local cmd=$1
    local projectname=$2
    local loc=$(pwd)

    if [[ ! -d "$env" ]]; then
        mkdir $env
    fi

    case $cmd in
        '-c' | '--create')
            python3 -m venv $env/$projectname
            touch $env/$projectname/$projectname.py
            ;;
        '-l' | '--list')
            ls $env
            ;;
        '-a' | '--activate')
            source $env/$projectname/bin/activate
            ;;
        '-d' | '--delete')
            rm -rvf $env/$projectname
            ;;
        '-r' | '--run')
            cd $env/$projectname
            python3 $projectname.py
            cd $loc
            ;;
        '-f' | '--folder')
            cd $env/$projectname
            ;;
        '-o' | '--open')
            code $env/$projectname
            ;;
        *)
            echo "$0 --create <name>    -   Create an env"
            echo "$0 --list <name>      -   List envs"
            echo "$0 --activate <name>  -   Choose an env"
            echo "$0 --delete <name>    -   Delete an env"
            echo "$0 --run <name>       -   Run an env"
            ;;
    esac
}

github() {
    local userid=${1:-"rhobernardi"}
    local repo=${2:-""}
    local url="https://github.com/$userid/$repo"
    explorer $url
}
