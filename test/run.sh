#!/bin/bash
set -e

if [ ! -d test/vader.vim ]; then
  git clone https://github.com/junegunn/vader.vim test/vader.vim
fi

export ANSIBLE_VAULT_PASSWORD_FILE=./test/vault_pass.txt

vim -Nu NONE -n \
  -c "set rtp+=./test/vader.vim" \
  -c "set rtp+=." \
  -c "runtime! plugin/*.vim" \
  -c "Vader! test/test_vault.vader"
