# ansible_vault.vim

[![Vim Tests][ci-badge]][ci-link]

Edit ansible vault files with vim transparently

## Features

This plugin lets you edit ansible vault files transparently in vim. It
installs autocommands to intercept reads and writes, decrypting on open
and re-encrypting on save. It mimics the behavior of the built-in gzip
plugin, except with encryption instead of compression.

### No plaintext ever touches disk

Vim has several ways to silently write buffer contents to disk (swap
files, backup files, viminfo). For vault files, the plugin disables all
of them:

- **`noswapfile`**: no `.swp` file is created from the decrypted buffer
- **`nobackup` / `nowritebackup`**: no backup copy is written before or
  during a save
- **`viminfo=`**: the viminfo file is not updated, so decrypted content
  cannot leak into command history, registers, or marks

Additionally, plaintext is never written to a temporary file during
encryption or decryption: `ansible-vault view` streams the decrypted
content directly to stdout, and `ansible-vault encrypt` reads the
plaintext from stdin via `/dev/stdin`. The only copy of the plaintext
that ever exists is the in-memory Vim buffer.

The [official Ansible recommendations][ansible-vault-vim-docs] also
suggest disabling the clipboard, but this plugin does not implement that:
clipboard is a global option in Vim and cannot be set per buffer, so
changing it would affect all your open buffers unexpectedly.


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

[ci-badge]: https://github.com/chmduquesne/ansible_vault.vim/actions/workflows/test.yml/badge.svg
[ci-link]: https://github.com/chmduquesne/ansible_vault.vim/actions/workflows/test.yml
[ansible-vault-vim-docs]: https://docs.ansible.com/projects/ansible/latest/vault_guide/vault_encrypting_content.html#vim
