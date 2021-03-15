"================================================================
"
"
"   neovim configuration by adipopbv (adi.pop.bv@gmail.com).
"   ~/.config/nvim/plugins.vim - neovim plugin configurations.
"
"
"================================================================

" Plugins managed by vim-plug
call plug#begin('~/.vim/plugged')
	" List of plugins.
	"	Vim theme
	Plug 'dracula/vim', {'as': 'dracula'}
	"	Universal set of defaults
	Plug 'tpope/vim-sensible'
	"	Intellisense engine
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	"	Project tree explorer
	Plug 'preservim/nerdtree'
	"	Git status for nerdtree
	Plug 'Xuyuanp/nerdtree-git-plugin'
	" 	Git branch in statusbar
	Plug 'itchyny/vim-gitbranch'
	"	Markdown live preview
	Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
	" 	Hex/rgb/rgba colors preview
	Plug 'chrisbra/Colorizer'
	" 	Indent line
	Plug 'Yggdroot/indentLine'
	"	File tags explorer
	Plug 'majutsushi/tagbar'
	"	Status bar
	Plug 'itchyny/lightline.vim'
	" 	Doxygen utility
	Plug 'vim-scripts/DoxygenToolkit.vim'
	" 	Git gutter
	Plug 'airblade/vim-gitgutter'
call plug#end()

" Theme
" 	Enable italic comments
let g:monochrome_italic_comments = 1
" 	Enable snazzy transparency
"let g:SnazzyTransparent = 1
let g:dracula_colorterm = 0
" 	Enable theme
colorscheme dracula

" coc.nvim config
" ! coc.nvim config is in the ide.vim config file !

" nerdtree config
" 	Open when entering nvim
autocmd vimenter * NERDTree
autocmd vimenter * wincmd p
" 	NERDTree toggle
map <silent> <C-E> :NERDTreeToggle<CR>
map <silent> <C-F> :NERDTreeFind<CR>
" 	Automatically delete the buffer of the file just deleted with NerdTree
let NERDTreeAutoDeleteBuffer = 1
" 	Close NERDTree if it's the only one left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" 	Size
let NERDTreeWinSize = 25
" 	Minimal ui
let NERDTreeMinimalUI = 1
" 	Show dir arrows
let NERDTreeDirArrows = 1
" 	Highlight current line
let NERDTreeHighlightCursorline = 1
" 	Line numbers
let NERDTreeShowLineNumbers = -1
" 	Clear buffer when needed
let NERDTreeAutoDeleteBuffer = 1

" vim-instant-markdown config
"	Turn on
filetype plugin on
"	Default browser
let g:instant_markdown_browser = "firefox"

" TagBar config
" 	Size
let tagbar_width = 30
" 	Sort by order
let tagbar_sort = 0
" 	Compact display
let tagbar_compact = 1
" 	Line numbers
let tagbar_show_linenumbers = -1
" 	Toggle
nmap <silent> <C-T> :TagbarToggle<CR>

" indentLine
let g:indentLine_char_list = ['|', '¦', '┆', '┊']

" Colorizer
let g:colorizer_colornames = 0
let g:colorizer_auto_color = 1
let g:colorizer_use_virtual_text = 0

" lightline config
" 	coc.nvim for lightline
function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction
" 	Status bar settings
let g:lightline = {
\	'colorscheme': 'dracula',
\   'active': {
\		'left':[
\			[ 'mode', 'paste' ],
\			[ 'cocstatus', 'coccurrentfunction', 'gitbranch', 'readonly', 'filename', 'modified' ]
\		]
\	},
\	'component': { 'lineinfo': '%3l:%-2v%<' },
\	'component_function': {
\ 		'cocstatus': 'coc#status',
\ 		'coccurrentfunction': 'CocCurrentFunction',
\ 		'gitbranch': 'gitbranch#name'
\ 	},
\}
" 	Setting separators
let g:lightline.separator = { 'left': '', 'right': '' }
" 	Setting subseparators
let g:lightline.subseparator = { 'left': '', 'right': '' }
"	Hide default mode indicator
set noshowmode

