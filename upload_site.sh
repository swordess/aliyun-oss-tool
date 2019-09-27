#!/bin/bash

source $1

function required_arg() {
    arg_name=$1
    if [[ -z ${!arg_name+x} ]]; then
      echo "${arg_name} is unset"
    else
      echo "${arg_name}:" ${!arg_name}
    fi
}

required_arg GIT_REPO_PATH
required_arg OSS_CONFIG
required_arg OSS_BUCKET_PATH

cd ${GIT_REPO_PATH} \
  && git pull \
  && npm install && npm run build:prod \
  && ossutilmac64 -c ${OSS_CONFIG} cp -rf ${GIT_REPO_PATH}/dist/ ${OSS_BUCKET_PATH} \
  && echo 'Done!'
