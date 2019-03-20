" @Author: Ryan Foo <rfoo@outlook.com>
" @Date: 2019-03-20 08:03:33
" @Last Modified by: Ryan Foo <rfoo@outlook.com>
" @Last Modified time: 2019-03-20 08:03:39

" Vundle Plugin
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" Vundle
Plugin 'VundleVim/Vundle.vim'
" Utility Functions
Plugin 'L9'
" Git Wrapper
Plugin 'tpope/vim-fugitive'
" File Explorer
Plugin 'scrooloose/nerdtree'
" Quoting/paranthesizing made simple
Plugin 'tpope/vim-surround'
" Syntax checking hacks for vim
Plugin 'scrooloose/syntastic'
" Nerd commenter
Plugin 'scrooloose/nerdcommenter'
" Auto-Completion for quotes, parens, brackets
Plugin 'raimondi/delimitmate'
" C++ highlighting (11/14)
Plugin 'octol/vim-cpp-enhanced-highlight'
" Youcompleteme
Plugin 'valloric/youcompleteme'
" Multiple Cursors
Plugin 'terryma/vim-multiple-cursors'
" File Header
Plugin 'ahonn/vim-fileheader'
" Javascript
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'mattn/emmet-vim'
" JSX syntax chcking
Plugin 'w0rp/ale'
" Javascript pretty highlighting
Plugin 'maxmellon/vim-jsx-pretty'
" Syntax for Javascript libraries
Plugin 'othree/javascript-libraries-syntax.vim'
" Bootstrap4
Plugin 'jvanja/vim-bootstrap4-snippets'
" Run shell commands in the background (for ESLint reformatting)
Plugin 'skywind3000/asyncrun.vim'
" sparkup (HTML fast write)
Plugin 'rstacruz/sparkup'
" CSS Color preview
Plugin 'ap/vim-css-color'
call vundle#end()
filetype plugin indent on
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal

" Enables highlight syntax
syntax enable
set nofoldenable
 
" Sweet colorscheme
" colorscheme codeschool
set background=dark
 
" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf-8
 
"" Display line numbers on the left
set number
 
"" Use mouse (only for resizing!)
set mouse=a
 
" Set the focus to the correct screen (ok, no more mouse thingies)
set mousefocus
 
" No more annoying sounds
set visualbell
 
" Do not scroll sideways unless we reach the end of the screen
set sidescrolloff=0
 
" highlight the status bar when in insert mode
if version >= 700
    if has("gui_running")
        au InsertEnter * hi StatusLine guifg=black guibg=green
        au InsertLeave * hi StatusLine guibg=black guifg=grey
    else
        au InsertEnter * hi StatusLine ctermfg=235 ctermbg=2
        au InsertLeave * hi StatusLine ctermbg=240 ctermfg=12
    endif
endif
 
" Infere the case-sensitivity
set infercase
 
" Need to set this flag on in order to have many cool features on
set nocompatible

" Switch between files in buffer
nnoremap <C-Tab> :bn<CR>
nnoremap <C-S-Tab> :bp<CR>
 
" Change default fontsize to fit MacBook Pro 13'
set guifont=Monaco:h11
 
" Don't select first Omni-completion option
set completeopt=longest,menuone
"set completeopt=menuone,longest,preview
 
set tabstop=4     " a tab is four spaces
set backspace=indent,eol,start
                  " allow backspacing over everything in insert mode
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set shiftwidth=4  " number of spaces to use for autoindenting
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set incsearch     " show search matches as you type
set expandtab
set shiftwidth=4
set softtabstop=4
 
" Always set the current file directory as the local current directory
autocmd BufEnter * silent! lcd %:p:h
 
" Enable folding
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf
 
set history=1000         " remember more commands and search history
set undolevels=1000      " use many levels of undo
 
" Tabs in command line mode behave like bash
set wildmode=longest,list,full
set wildmenu
 
" Highlight the entire word when searching for it
set hlsearch
 
" Move line by line even when the line is wrapped
map j gj
map k gk
 
" Persistent undo
set undofile                " Save undo's after file closes
set undodir=$HOME/.vim/undo " where to save undo histories
set undolevels=1000         " How many undos
set undoreload=10000        " number of lines to save for undo

" NERDTree
" Open automatically when vim is opened
autocmd vimenter * NERDTree

" C++ 11/14 Highlighting
" Class scope highlighting
let g:cpp_class_scope_highlight = 1
" Member variables highlighting
let g:cpp_member_variable_highlight = 1
" Class name highlighting
let g:cpp_class_decl_highlight = 1
" Library concept highlight
let g:cpp_concepts_highlight = 1

" File header
let g:fileheader_auto_add = 1

" Nerd Commenter

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Javascript
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1

" Emmet for easier JSX; expand css selectors into HTML (or JSX) on the fly
" goto-> https://drivy.engineering/setting-up-vim-for-react/
let g:user_emmet_leader_key='<Tab>'
let g:user_emmet_settings = {
  \  'javascript.jsx' : {
    \      'extends' : 'jsx',
    \  },
  \}

" ESLint
let g:ale_sign_error = '●' " Less aggressive than the default '>>'
let g:ale_sign_warning = '.'
let g:ale_lint_on_enter = 0 " Less distracting when opening a new file

" For Automatic JSX reformatting
autocmd BufWritePost *.js AsyncRun -post=checktime ./node_modules/.bin/eslint --fix %

