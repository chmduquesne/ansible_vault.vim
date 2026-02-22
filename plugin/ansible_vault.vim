if exists('g:loaded_ansible_vault_auto') | finish | endif
let g:loaded_ansible_vault_auto = 1

" --- Configuration ---
" Override this if you want to this plugin to handle different patterns, e.g.
" let g:ansible_vault_pattern = 'secrets.yml,*_vault.yml'
if !exists('g:ansible_vault_pattern')
    let g:ansible_vault_pattern = '*vault.yml'
endif

augroup AnsibleVault
    autocmd!
    " No swap file to avoid leaking secrets to the disk
    execute 'autocmd BufReadPre ' . g:ansible_vault_pattern . ' setlocal noswapfile bin'
    execute 'autocmd BufReadPost ' . g:ansible_vault_pattern . ' autocmd SafeState <buffer> ++once call ansible_vault#read()'
    execute 'autocmd BufWriteCmd ' . g:ansible_vault_pattern . ' call ansible_vault#write()'
augroup END
