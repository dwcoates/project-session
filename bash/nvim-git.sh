#!/usr/bin/env bash

if [[ -z ${NVIM_GIT_BIN} ]]; then
  NVIM_GIT_BIN=nvim
fi

if git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
    ${NVIM_GIT_BIN} -S "$(git rev-parse --show-toplevel)/.nvim-session.vim" "$@" 
else
    ${NVIM_GIT_BIN} "$@"
fi
