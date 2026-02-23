" Vim autoload file for editing Ansible vault encrypted files.
" These functions are used by the ansible_vault plugin

" Open the file with ansible-vault
function ansible_vault#read()
    if getline(1) !~ '^\$ANSIBLE_VAULT'
        return
    endif

    let l:fname = expand('%:p')
    let l:plaintext = system('ansible-vault view ' . shellescape(l:fname))

    if v:shell_error != 0 || empty(l:plaintext)
        echoerr "Vault Decryption Failed (Exit Code " . v:shell_error . ")"
        return
    endif

    let l:save_undo = &undolevels
    set undolevels=-1

    silent %delete _
    call setline(1, split(l:plaintext, "\n"))

    let &undolevels = l:save_undo
    setlocal ft=yaml.ansible nomodified
    redraw!
    echo "Vault decrypted."
endfunction

" Write the file with ansible-vault. Do not overwrite the file with a new
" ciphertext if the content has not changed.
function ansible_vault#write()
    let l:fname = expand('%:p')

    " Get plaintext
    let l:buffer_plaintext = join(getline(1, '$'), "\n")
    let l:disk_plaintext = system('ansible-vault view ' . shellescape(l:fname))

    " Hash content
    let l:disk_hash = sha256(substitute(l:disk_plaintext, '\n\+$', '', ''))
    let l:buffer_hash = sha256(substitute(l:buffer_plaintext, '\n\+$', '', ''))

    if l:disk_hash == l:buffer_hash
        setlocal nomodified
        echo "Content unchanged. Nothing was written to disk."
        return
    endif

    " Encrypt
    let l:res = system('ansible-vault encrypt --output ' . shellescape(l:fname) . ' /dev/stdin', l:buffer_plaintext . "\n")

    if v:shell_error != 0
        echoerr "Encryption failed: " . l:res
        return
    endif

    setlocal nomodified
    echo "Vault encrypted."
endfunction
