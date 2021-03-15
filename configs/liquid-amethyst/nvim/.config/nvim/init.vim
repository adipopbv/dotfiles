"===============================================================
"
"
"   ██╗  ██╗███████╗ █████╗ ██╗  ██╗██╗██╗  ██╗
"   ███╗ ██║██╔════╝██╔══██╗██║  ██║╚═╝███╗███║
"   ███████║█████╗  ██║  ██║╚██╗██╔╝██╗███████║
"   ██╔═███║██╔══╝  ██║  ██║ █████║ ██║██╔█╔██║
"   ██║ ╚██║███████╗╚█████╔╝ ╚███╔╝ ██║██║╚╝██║
"   ╚═╝  ╚═╝╚══════╝ ╚════╝   ╚══╝  ╚═╝╚═╝  ╚═╝
"
"
"   neovim configuration by adipopbv (adi.pop.bv@gmail.com).
"   ~/.config/nvim/init.vim - neovim main configuration file.
"   Go to https://neovim.io/doc/ for more info.
"
"
"===============================================================

" Config sources
" 	Enable sourcing of multiple files for config
filetype plugin on
" 	Plugins
source $HOME/.config/nvim/plugins.vim
" 	IDE settings
source $HOME/.config/nvim/ide.vim

" Copy to system clipboard
set clipboard=unnamed,unnamedplus

" Line numbers
"	Set relative line numbers and normal for the current one
set rnu nu

" Indentation
"	Set tab and indent size to 4
set tabstop=4 softtabstop=0 noexpandtab shiftwidth=4

" Syntax highlighting
" 	conf files
autocmd BufNewFile,BufRead *.conf setf conf
" 	ini files
autocmd BufNewFile,BufRead config setf dosini
" 	rofi config files
autocmd BufNewFile,BufRead *.rasi setf css

" Hex/rgb/rgba colors highlighting
autocmd BufNewFile,BufRead * :ColorHighlight!

" Highlight
" 	Make double <Esc> clear search highlights
nnoremap <silent> <Esc><Esc> <Esc>:nohlsearch<CR><Esc>

" Split
"	Focus pane keyboard shortcuts remaping
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
"	Split pane resize
noremap <silent> <C-Up> :vertical resize +5<CR>
noremap <silent> <C-Down> :vertical resize -5<CR>

" Tabs
" 	Change tab
nnoremap <A-h> :tabprevious<CR>
nnoremap <A-l> :tabnext<CR>
" 	Move tab
nnoremap <silent> <A-S-h> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <A-S-l> :execute 'silent! tabmove ' . (tabpagenr()+1)<CR>

