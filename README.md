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

## Usage

Open a new vault file with vim

    $ vim vault.yml # Matches the pattern of g:ansible_vault_pattern

Edit the content, save and exit

    ---
    myvariable: myvalue

Upon saving the file, vim invokes ansible-vault. Now vault.yml is encrypted

    $ cat vault.yml
    $ANSIBLE_VAULT;1.1;AES256
    32653732386138643030356132666335653232393663336334626636623638613137393035636166
    6431353436653063643633336661373735633838343363360a363234653331633330633932633363
    36343765633336623636326637393037323639316436646333616366373135326464326137363231
    3332353166336635310a366365353635653530636164343432643363643065343830353838666635
    36393362313266376665333433363436613831396161303462383263636661363430

If you open the same vault file with vim again, you see the decrypted content

    ---
    myvariable: myvalue

You can make changes, save them, and vim will encrypt your changes
transparently. You can also open existing files into a buffer using
`:edit`.
