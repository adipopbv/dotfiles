"===================================================================
"
"
"   neovim configuration by adipopbv (adi.pop.bv@gmail.com).
"   ~/.config/nvim/ide.vim - neovim config for an IDE experience.
"
"
"===================================================================

" Coding language specific commands
"	c:
"		Building
autocmd Filetype c map <F4> :!gcc -fprofile-arcs -ftest-coverage -Wall -ggdb `find . -type f -name \*.c` -o app<return>
"		Debugging
autocmd Filetype c map <F5> :!$TERMINAL -e gdb ./app & <return>
"		Running
autocmd Filetype c map <F8> :!$TERMINAL -e ./app & <return>
"	c++:
"		Code improvements
autocmd Filetype cpp map <F2> :!$TERMINAL -e tidy-cpp-proj --app & <return>
"		Coverage
autocmd Filetype cpp map <F3> :!cov-cpp-proj --all & <return>
"		Building
autocmd Filetype cpp map <F4> :!$TERMINAL -e build-cpp-proj --all & <return>
"		Debugging app
autocmd Filetype cpp map <F5> :!$TERMINAL -e dbg-cpp-proj --app & <return>
"		Debugging tests
autocmd Filetype cpp map <F6> :!$TERMINAL -e dbg-cpp-proj --tests & <return>
"		Leakage for app
autocmd Filetype cpp map <F7> :!$TERMINAL -e memleak-cpp-proj --app & <return>
"		Leakage for tests
autocmd Filetype cpp map <F8> :!$TERMINAL -e memleak-cpp-proj --tests & <return>
"		Running app
autocmd Filetype cpp map <F9> :!$TERMINAL -e run-cpp-proj --app & <return>
"		Running tests
autocmd Filetype cpp map <F10> :!$TERMINAL -e run-cpp-proj --tests & <return>
" 	python:
"		Running
autocmd Filetype python map <F6> :!$TERMINAL -e python3 %<return>

" Coc.Nvim c/c++ development environment setup
" 	Hide buffers instead of closing them
" 		! if hidden is not set, TextEdit might fail !
set hidden
" 	Some servers have issues with backup files, see #649
set nobackup
set nowritebackup
" 	Better display for messages
set cmdheight=2
" 	You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300
" 	Don't give |ins-completion-menu| messages.
set shortmess+=c
" 	always show signcolumns
set signcolumn=yes
" 	Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
\ pumvisible() ? "\<C-n>" :
\ <SID>check_back_space() ? "\<TAB>" :
\ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
let col = col('.') - 1
return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" 	Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
" 	Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" 		Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" 	Remap for rename current word
nmap <leader> rn <Plug>(coc-rename)
" 	Use `[c` and `]c` to navigate diagnostics
" 		Previous
nmap <silent> [c <Plug>(coc-diagnostic-prev)
" 		Next
nmap <silent> ]c <Plug>(coc-diagnostic-next)
" 	Remap keys for gotos
" 		Goto definition
nmap <silent> gd <Plug>(coc-definition)
" 		Goto type definition
nmap <silent> gy <Plug>(coc-type-definition)
" 		Goto implementation
nmap <silent> gi <Plug>(coc-implementation)
" 		Goto references
nmap <silent> gr <Plug>(coc-references)
" 	Show documentation
nnoremap <silent> ? :call <SID>show_documentation()<CR>
function! s:show_documentation()
if (index(['vim','help'], &filetype) >= 0)
execute 'h '.expand('<cword>')
else
call CocAction('doHover')
endif
endfunction
" 	Highlight symbol under cursor
autocmd CursorHold * silent call CocActionAsync('highlight')
" 	Format selected
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
augroup mygroup
autocmd!
" 	Setup formatexpr specified filetype(s).
autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
" 	Update signature help on jump placeholder
autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end
" 	Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)
" 	Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" 	Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)
" 	Use <tab> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)
" 	Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')
" 	Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)
" 	Use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
" 	Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
" 	Using CocList
" 		Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" 		Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" 		Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" 		Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" 		Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" 		Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" 		Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" 		Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

