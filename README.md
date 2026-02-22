# ansible-vault.vim

Edit ansible-vault files with vim transparently.

## Features

This plugin allows you to edit ansible-vault files with vim. It works by
installing autocommands to intercept reading and writing ansible-vault
files. It essentially works similarly to the gzip plugin, except with
ansible-vault commands instead of gzip to load/save the files.

## Installation

Use your favourite vim package manager to download this repo.

    'chmduquesne/ansible-vault.vim'

## Configuration

| Variable                | Default        | Meaning                                 |
| :---                    | :---           | :---                                    |
| g:ansible_vault_pattern | `'*vault.yml'` | Files identified as ansible-vault files |
