" Enviroment before plugin add {
    " Basics {

        set nocompatible
        filetype off

        "set textwidth=80
        "set colorcolumn=+1
    " }

    " Setup Plugin Support START{
    " The next two lines ensure that the ~/.vim/bundle/ system works
        set rtp+=~/.vim/bundle/Vundle.vim
        call vundle#begin()
    " }
" }

" Bundles {
    " Dependencies
        Plugin 'gmarik/Vundle.vim'
        Plugin 'MarcWeber/vim-addon-mw-utils'
        Plugin 'tomtom/tlib_vim'

    " General
        Plugin 'Lokaltog/vim-easymotion'
        Plugin 'bling/vim-airline' " Status line
        Plugin 'scrooloose/syntastic'	" Show erros
        Plugin 'kien/ctrlp.vim'
        Plugin 'JazzCore/ctrlp-cmatcher'
        Plugin 'tpope/vim-surround'
        Plugin 'scrooloose/nerdcommenter'
        if executable('ag')
            let g:ackprg="ag -U --vimgrep"
            Plugin 'mileszs/ack.vim'
        elseif executable('ack')
            Plugin 'mileszs/ack.vim'
        endif
        Plugin 'tpope/vim-fugitive'
        Plugin 'jeetsukumaran/vim-buffergator'
        Plugin 'nathanaelkane/vim-indent-guides'

    " Snippets
        Plugin 'SirVer/ultisnips'
        Plugin 'honza/vim-snippets'

    " Python
        Plugin 'Valloric/YouCompleteMe'
        Plugin 'jmcantrell/vim-virtualenv'
        Plugin 'majutsushi/tagbar'
        Plugin 'tell-k/vim-autopep8'
        Plugin 'vim-scripts/indentpython.vim--nianyang'
        Plugin 'wsantos/vim-python-test-runner'

    " Cores
        Plugin 'spf13/vim-colors'
        Plugin 'flazz/vim-colorschemes'
        Plugin 'shinzui/vim-idleFingers'
        Plugin 'altercation/vim-colors-solarized'
        Plugin 'nanotech/jellybeans.vim'

    " Syntax
        Plugin 'tpope/vim-git'
        Plugin 'solarnz/python.vim'
        Plugin 'lepture/vim-jinja'
        Plugin 'wavded/vim-stylus'
        Plugin 'kchmck/vim-coffee-script'
" }

" Enviroment before plugin add {
    " Setup Plugin Support end{
    " All of your Plugins must be added before the following line
        call vundle#end()            " required
        filetype plugin indent on    " required
    " }
" }

" General {
    set background=dark         " Assume a dark background
    syntax on                   " syntax highlighting
    "set mouse=a                 " automatically enable mouse usage
    scriptencoding utf-8
    set fileencodings=utf-8
    highlight ColorColumn ctermbg=green guibg=#303030
" }

" Language specific {
    " Python {
        autocmd FileType python set textwidth=79
        autocmd FileType python set colorcolumn=+1
    " }

    " html {
        autocmd FileType html set matchpairs+=<:> " match, to be used with %
    " }
" }

" Vim UI {
    set hidden
    color jellybeans
    if has('cmdline_info')
        set ruler                   " show the ruler
        set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " a ruler on steroids
        set showcmd                 " show partial commands in status line and
                                    " selected characters/lines in visual mode
    endif

    if has('statusline')
        set laststatus=2

        " Broken down into easily includeable segments
        set statusline=%<%f\    " Filename
        set statusline+=%w%h%m%r " Options
        set statusline+=%{fugitive#statusline()} "  Git Hotness
        set statusline+=\ [%{&ff}/%Y]            " filetype
        set statusline+=\ [%{getcwd()}]          " current dir
        set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
    endif

    " Setting up the directories {
        set backup                      " backups are nice ...
        set backupdir=~/.vim/backup//
        set directory=~/.vim/swp//
        set undodir=~/.vim/undodir//
        if has('persistent_undo')
            set undofile                "so is persistent undo ...
            set undolevels=1000         "maximum number of changes that can be undone
            set undoreload=10000        "maximum number lines to save for undo on a buffer reload
        endif
        " Could use * rather than *.*, but I prefer to leave .files unsaved
        au BufWinLeave *.* silent! mkview  "make vim save view (state) (folds, cursor, etc)
        au BufWinEnter *.* silent! loadview "make vim load view (state) (folds, cursor, etc)
    " }

    set nu                          " Line numbers on
    set showmatch                   " show matching brackets/parenthesis
    set incsearch                   " find as you type search
    set hlsearch                    " highlight search terms

    set list
    set listchars=tab:,.,trail:.,extends:#,nbsp:. " Highlight problematic whitespace

    set completeopt-=preview

" }

" Formatting {
    set nowrap                      " wrap long lines
    set autoindent                  " indent at the same level of the previous line
    set shiftwidth=4                " use indents of 4 spaces
    set expandtab                   " tabs are spaces, not tabs
    set tabstop=4                   " an indentation every four columns
    set softtabstop=4               " let backspace delete indent
    set pastetoggle=<F2>           " pastetoggle (sane indentation on pastes)

    " Remove trailing whitespaces and ^M chars
    autocmd FileType c,cpp,java,php,js,python,twig,xml,yml autocmd BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))
" }

" Key (re)Mappings {

    "The default leader is '\', but many people prefer ',' as it's in a standard
    "location
    let mapleader = ','

    " Making it so ; works like : for commands. Saves typing and eliminates :W style typos due to lazy holding shift.
    nnoremap ; :

    " Easier moving in tabs and windows
    map <C-J> <C-W>j<C-W>_
    map <C-K> <C-W>k<C-W>_
    map <C-L> <C-W>l<C-W>_
    map <C-H> <C-W>h<C-W>_

    " Wrapped lines goes down/up to next row, rather than next line in file.
    nnoremap j gj
    nnoremap k gk

    " The following two lines conflict with moving to top and bottom of the
    " screen
    " If you prefer that functionality, comment them out.
    map <S-H> gT
    map <S-L> gt

    " Stupid shift key fixes
    cmap W w
    cmap WQ wq
    cmap wQ wq
    cmap Q q
    cmap Tabe tabe

    " Yank from the cursor to the end of the line, to be consistent with C and D.
    nnoremap Y y$

    """ Code folding options
    nmap <leader>f0 :set foldlevel=0<CR>
    nmap <leader>f1 :set foldlevel=1<CR>
    nmap <leader>f2 :set foldlevel=2<CR>
    nmap <leader>f3 :set foldlevel=3<CR>
    nmap <leader>f4 :set foldlevel=4<CR>
    nmap <leader>f5 :set foldlevel=5<CR>
    nmap <leader>f6 :set foldlevel=6<CR>
    nmap <leader>f7 :set foldlevel=7<CR>
    nmap <leader>f8 :set foldlevel=8<CR>
    nmap <leader>f9 :set foldlevel=9<CR>

    "clearing highlighted search
    nmap <silent> <leader>/ :nohlsearch<CR>

    " Shortcuts
    " Change Working Directory to that of the current file
    cmap cwd lcd %:p:h
    cmap cd. lcd %:p:h

    " visual shifting (does not exit Visual mode)
    vnoremap < <gv
    vnoremap > >gv

    " Fix home and end keybindings for screen, particularly on mac
    " - for some reason this fixes the arrow keys too. huh.
    map [F $
    imap [F $
    map [H g0
    imap [H g0

    " For when you forget to sudo.. Really Write the file.
    cmap w!! w !sudo tee % >/dev/null

    " Some helpers to edit mode
    " http://vimcasts.org/e/14
    cnoremap %% <C-R>=expand('%:h').'/'<cr>
    map <leader>ew :e %%
    map <leader>es :sp %%
    map <leader>ev :vsp %%
    map <leader>et :tabe %%

    " Adjust viewports to the same size
    map <Leader>= <C-w>=
" }

" Plugins {
    " YouCompleteMe {
        let g:ycm_add_preview_to_completeopt = 0
        let g:ycm_autoclose_preview_window_after_insertion = 1 
        let g:ycm_key_list_select_completion = []
        let g:ycm_key_list_previous_completion=[]

        let g:ycm_collect_identifiers_from_tags_files = 1 " Let YCM read tags from Ctags file
        let g:ycm_use_ultisnips_completer = 1 " Default 1, just ensure
        let g:ycm_seed_identifiers_with_syntax = 1 " Completion for programming language's keyword
        let g:ycm_complete_in_comments = 1 " Completion in comments
        let g:ycm_complete_in_strings = 1 " Completion in string
        nnoremap <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>
    " }

    " ctrlp {
        set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.*~,*.pyc
        set wildignore+=*/coverage/*
        set wildignore+=*/node_modules/*
        "let g:ctrlp_regexp = 1
        if executable('ag')
            set grepprg=ag\ --nogroup\ --nocolor
            let g:ctrlp_user_command = 'ag -U %s -l --nocolor -g ""  |grep -Ev "\.(pyc|png|jpg|jpeg|gif)$"|grep -Ev "[\/]ckeditor"|grep -Ev "[\/]tiny_mce"'
        endif
        let g:ctrlp_match_func = {'match' : 'matcher#cmatch' }
        let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'


        " Setup some default ignores
        let g:ctrlp_custom_ignore = {
          \ 'dir':  '\v[\/](\.(git|hg|svn)|\_site)$',
          \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
        \}

        " Use the nearest .git directory as the cwd
        " This makes a lot of sense if you are working on a project that is in version
        " control. It also supports works with .svn, .hg, .bzr.
        let g:ctrlp_working_path_mode = 'r'

        " Use a leader instead of the actual named binding
        nmap <leader>p :CtrlP<cr>

        " Easy bindings for its various modes
        nmap <leader>bb :CtrlPBuffer<cr>
        nmap <leader>bm :CtrlPMixed<cr>
        nmap <leader>bs :CtrlPMRU<cr>
    " }

    " buffgator {
        " Use the right side of the screen
        let g:buffergator_viewport_split_policy = 'R'

        " I want my own keymappings...
        let g:buffergator_suppress_keymaps = 1

        " Looper buffers
        "let g:buffergator_mru_cycle_loop = 1

        " Go to the previous buffer open
        nmap <leader>jj :BuffergatorMruCyclePrev<cr>

        " Go to the next buffer open
        nmap <leader>kk :BuffergatorMruCycleNext<cr>

        " View the entire list of buffers open
        nmap <leader>bl :BuffergatorOpen<cr>

        " Shared bindings from Solution #1 from earlier
        nmap <leader>T :enew<cr>
        nmap <leader>bq :bp <BAR> bd #<cr>
    " }

    " airline {
        let g:airline#extensions#tabline#enabled = 1
        let g:airline#extensions#tagbar#enabled = 0
        let g:airline_powerline_fonts = 0
        let g:airline_left_sep = '▶'
        let g:airline_right_sep = '◀'
        let g:airline_theme='luna'
        let g:airline#extensions#branch#displayed_head_limit = 8
    " }

    " syntastic {
        let g:syntastic_error_symbol = "✗"
        let g:syntastic_warning_symbol = "⚠"
    " }
    
    " vim-python-test-runner {
        nnoremap<Leader>da :DjangoTestApp<CR>
        nnoremap<Leader>df :DjangoTestFile<CR>
        nnoremap<Leader>dc :DjangoTestClass<CR>
        nnoremap<Leader>dm :DjangoTestMethod<CR>
        nnoremap<Leader>nf :NosetestFile<CR>
        nnoremap<Leader>nc :NosetestClass<CR>
        nnoremap<Leader>nm :NosetestMethod<CR>
        nnoremap<Leader>nb :NosetestBaseMethod<CR>
        nnoremap<Leader>rr :RerunLastTests<CR>
    " }


" }

if &term =~ "xterm"
  " 256 colors
  let &t_Co = 256
  " restore screen after quitting
  let &t_ti = "\<Esc>7\<Esc>[r\<Esc>[?47h"
  let &t_te = "\<Esc>[?47l\<Esc>8"
  if has("terminfo")
    let &t_Sf = "\<Esc>[3%p1%dm"
    let &t_Sb = "\<Esc>[4%p1%dm"
  else
    let &t_Sf = "\<Esc>[3%dm"
    let &t_Sb = "\<Esc>[4%dm"
  endif
endif

" Add the virtualenv's site-packages to vim path
if has('python')
py << EOF
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF
endif
