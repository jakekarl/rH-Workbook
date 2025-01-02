#!/bin/bash

# Create Scratch Org
## STOP SCRIPT EXECUTION ON ERROR
set -euo pipefail

##  ECHO COLORS
ORANGE='\033[38;5;214m'
BRed='\033[1;31m' 
RED='\033[0;31m'
BLUE='\033[1;34m'
DEFAULT='\033[m' # No Color

## STORE LAST FUNCTION NAME
LAST_ARG=''

## CALL THIS ON ERROR
notify() {
    echo -e "${BRed}${LAST_ARG} Error ${RED}$(caller): ${BASH_COMMAND}"
    echo -e "$DEFAULT"
}
trap notify ERR

function echo_block() {
    echo -e "${BLUE}**************************************************";
    echo -e "${ORANGE} $1 $2 ${BLUE} $(date)" 
    echo -e "**************************************************${DEFAULT}";
}

function echo_wrapper() {
    if [[ ! -z $LAST_ARG ]]; then
        echo_block "${LAST_ARG}" "Complete"
        echo ""
    fi

    echo_block "$1" "Starting"
    LAST_ARG=$1
}

## CREATE SCRATCH ORG
project="rh-sobjectbuilder"
branch=$(git branch | sed -n -e 's/^\* \(.*\)/\1/p')
scratchOrgName="$project-$branch"

echo_wrapper "Install Latest NPM Packages"
npm ci

# echo_wrapper "Install SF Plugin"
# printf 'y\n' | sf plugins install texei-sfdx-plugin

# echo_wrapper "Create Scratch Org From Snapshot" 
# sf org create scratch -f ./config/project-snapshot-def.json -a "$scratchOrgName" --name "$scratchOrgName" -y 14 -w 60 -d

echo_wrapper "Create Fresh Scratch Org & Install WFD Package"
sf org create scratch -f ./config/project-scratch-def.json -a "$scratchOrgName" --name "$scratchOrgName" -y 14 -w 60 -d

echo_wrapper "Deploy Package Metadata"
sf project deploy start -d force-app -o "$scratchOrgName" --ignore-conflicts

# echo_wrapper "Assign Permission Sets to Admin User" 
# sf apex run -f ./scripts/apex/AssignAdminPermissionSet.apex

echo_wrapper "Reset Project Tracking"
sf project reset tracking -p

echo_wrapper "Open Scratch Org"
sf org open