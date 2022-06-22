call plug#begin('~/.config/nvim/autoload/plugged')
" IDE STUFF File Explorer
Plug 'scrooloose/NERDtree'
Plug 'junegunn/fzf', { 'do' : { -> fzf#install() } }
" Auto pairs for '(' '[' '{'
Plug 'jiangmiao/auto-pairs'
" Autocompletition
Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdcommenter'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dense-analysis/ale'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'Chiel92/vim-autoformat'
Plug 'Yggdroot/indentLine'
" Track the engine.
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'"
" Zen Mode
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
" Git Plugin
Plug 'tpope/vim-fugitive'
" Appearence
" Set icons
Plug 'ryanoasis/vim-devicons'
Plug 'drewtempelmeyer/palenight.vim'
"Plug 'joshdick/onedark.vim'
" Plug 'dracula/vim', { 'as': 'dracula' }
" LightLine
Plug 'itchyny/lightline.vim'
" Better Syntax Support
Plug 'sheerun/vim-polyglot'
" Rainbow Parenthesis
Plug 'luochen1990/rainbow'
" Smooth Scrool
Plug 'psliwka/vim-smoothie'
" Show indentation with spaces
" Yggdroot/indentLine
" MARKUP LANGUAGES
Plug 'plasticboy/vim-markdown'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'alvan/vim-closetag'
Plug 'lervag/vimtex'
" PROGRAMMING LANGUAGES
Plug 'alx741/vim-stylishask'
Plug 'evanleck/vim-svelte', {'branch': 'main'}
Plug 'rust-lang/rust.vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'ARM9/arm-syntax-vim'
Plug 'pappasam/coc-jedi', { 'do': 'yarn install --frozen-lockfile && yarn build',
			\ 'branch': 'main' }
Plug 'dag/vim-fish'
" Plug 'kdheepak/JuliaFormatter.vim'
call plug#end()

" Go to Documentation in preview window
nnoremap <silent>K :call <SID>show_documentation()<CR>

function! s:show_documentation()
	if (index(['vim','help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	elseif (coc#rpc#ready())
		call CocActionAsync('doHover')
	else
		execute '!' . &keywordprg . " " . expand('<cword>')
	endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')
let g:indentLine_setColors = 1
let g:indentLine_char = '|'

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
	nnoremap <silent><nowait><expr> <A-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
	nnoremap <silent><nowait><expr> <A-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
	inoremap <silent><nowait><expr> <A-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
	inoremap <silent><nowait><expr> <A-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
	vnoremap <silent><nowait><expr> <A-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
	vnoremap <silent><nowait><expr> <A-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Autoformat config
let g:syntastic_disabled_filetypes=['bash']
au BufWrite * :Autoformat
autocmd FileType vim,tex let b:autoformat_autoindent=0
autocmd FileType markdown let b:autoformat_enabled=0
let g:vim_json_syntax_conceal = 0
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0

" If no file, open NERDTree
autocmd VimEnter * if !argc() | NERDTree | endif

" Font
set guifont=Iosevka

let g:rainbow_active = 1
colorscheme palenight
let g:lightline = { 'colorscheme': 'palenight' } "'palenight' }
let g:palenight_terminal_italics=1
let g:stylishask_on_save = 1

" Zen Mode
nnoremap <C-g> :Goyo<CR>
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" Markdown
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_math = 1
let g:vim_markdown_follow_anchor = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_toml_frontmatter = 1
let g:vim_markdown_json_frontmatter = 1

" Ultisnips
" let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsExpandTrigger="<c-s>"

" Syntastic options
let g:syntastic_mode_map = { 'passive_filetypes': ['python'] }
"let g:syntastic_python_checkers=['python3', 'flake8
			"\ --ignore=E225,E501,E302,E261,E262,E701,E241,E126,E127,E128,W801']
"let g:syntastic_python_flake8_exec = ['/home/dany98/miniconda3/bin/flake8']
"let g:syntastic_python_pylint_exec = '/home/dany98/.local/bin/pylint'
" g:syntastic_asm_checkers = ['nasm']

" Ale Linterns
let g:ale_linterns = {
			\ 'go': ['gopls'],
			\ 'haskell': ['hlint'],
			\ 'python': ['pep8'],
			\ 'sh': ['language_server'],
			\ 'rust': ['analyzer']
			\ }
let g:ale_lint_on_enter=1
let g:ale_cursor_detail=1
let g:ale_python_auto_pipenv = 1
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_lint_on_text_changed = 'never'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
"let pipenv_venv_path = system('pipenv --venv')

" Golang settings
let g:go_fmt_command = "goimports"
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1
