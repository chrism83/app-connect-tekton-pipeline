#!/bin/bash

# exit when any command fails
set -e

function print_bold {
    echo -e "\033[1m> ---------------------------------------------------------------\033[0m"
    echo -e "\033[1m> $1\033[0m"
    echo -e "\033[1m> ---------------------------------------------------------------\033[0m"
}


print_bold "removing deploy pipeline resources"
oc delete -n pipeline-ace -l tekton.dev/pipeline=pipeline-ace-integration-server pipelineruns
oc delete -n pipeline-ace --ignore-not-found=true -f ./tekton/pipeline.yaml
oc delete -n pipeline-ace --ignore-not-found=true -f ./tekton/tasks
oc delete -n pipeline-ace --ignore-not-found=true -f ./tekton/permissions


print_bold "pipeline removed"
