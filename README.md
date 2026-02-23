# ansible_vault.vim

Edit ansible vault files with vim transparently

## Features

This plugin allows you to edit ansible vault files with vim. It works by
installing autocommands to intercept reading and writing ansible vault
files. It mimics the behavior of the standard gzip plugin, except with
encryption instead of compression.

## Demo

https://github.com/user-attachments/assets/636441f2-4d72-46ea-987d-14895ca154ad

## Installation

Use your favourite vim package manager.

With Vundle:

    Plugin 'chmduquesne/ansible_vault.vim'

With Vim-Plug:

    Plug 'chmduquesne/ansible_vault.vim'

With Packer.nvim:

    use 'chmduquesne/ansible_vault.vim'

Old school style: copy
[plugin/ansible_vault.vim](plugin/ansible_vault.vim) in `~/.vim/plugin`,
and [autoload/ansible_vault.vim](autoload/ansible_vault.vim) in
`.vim/autoload`

## Configuration

| Variable                | Default        | Meaning                                 |
| :---                    | :---           | :---                                    |
| g:ansible_vault_pattern | `'*vault.yml'` | Files identified as ansible vault files |
