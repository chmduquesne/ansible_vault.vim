# ansible-vault.vim

Edit ansible-vault files with vim transparently

## Features

This plugin allows you to edit ansible-vault files with vim. It works by
installing autocommands to intercept reading and writing ansible-vault
files. It mimics the behavior of the standard gzip plugin, except with
encryption instead of compression.

## Installation

Use your favourite vim package manager.

With Vundle:

    Plugin 'chmduquesne/ansible-vault.vim'

With Vim-Plug:

    Plug 'chmduquesne/ansible-vault.vim'

With Packer.nvim:

    use 'chmduquesne/ansible-vault.vim'

Or old school: just copy the file
[plugin/ansible-vault.vim](plugin/ansible-vault.vim) in your
`~/.vim/plugin` directory.

## Configuration

| Variable                | Default        | Meaning                                 |
| :---                    | :---           | :---                                    |
| g:ansible_vault_pattern | `'*vault.yml'` | Files identified as ansible-vault files |
