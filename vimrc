" { # Setup dein.vin
    if &compatible
      set nocompatible               " Be iMproved
    endif

    " Required:
    set runtimepath+=/Users/wsantos/.vim/dein/repos/github.com/Shougo/dein.vim

    " Required:
    call dein#begin('/Users/wsantos/.vim/dein')

    " Let dein manage dein
    " Required:
    call dein#add('Shougo/dein.vim')

    " Add or remove your plugins here:
    call dein#add('Shougo/neosnippet.vim')
    call dein#add('Shougo/neosnippet-snippets')

    call dein#add('ctrlpvim/ctrlp.vim')
    call dein#add('nixprime/cpsm', {'build': './install.sh'})

    " Git plugins
    call dein#add('tpope/vim-fugitive')

    " Languages
    call dein#add('fatih/vim-go')

    " Auto complete
    call dein#add('Valloric/YouCompleteMe', {'build': './install.py --clang-completer --gocode-completer'})

    " You can specify revision/branch/tag.
    " call dein#add('Shougo/vimshell', { 'rev': '3787e5' })

    " Colors
    call dein#add('dunckr/vim-monokai-soda')

    " General
    call dein#add('bling/vim-airline')
    call dein#add('vim-airline/vim-airline-themes')
    call dein#add('terryma/vim-multiple-cursors')
    call dein#add('vim-syntastic/syntastic')
    call dein#add('wesQ3/vim-windowswap')
    call dein#add('scrooloose/nerdcommenter')


    " Snippets
    call dein#add('SirVer/ultisnips')
    call dein#add('honza/vim-snippets')

    " Required:
    call dein#end()

    " Required:
    filetype plugin indent on
    syntax enable

" }

" Vim UI {
    set hidden
    color monokai-soda

    set nu                          " Line numbers on
    set showmatch                   " show matching brackets/parenthesis
    set incsearch                   " find as you type search
    set hlsearch                    " highlight search terms

    set list
    set listchars=tab:,.,trail:.,extends:#,nbsp:. " Highlight problematic whitespace

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

    if has('gui_running')
        set guifont=Fantasque\ Sans\ Mono\ Regular:h13
        " set noantialias
        set guioptions-=T   " No more toolbar 
        set guioptions-=r   " No more right scrollbar
        set guioptions-=l   " No more left scrollbar
        set guioptions-=L  
        set guioptions-=b   " No more bottom scrollbar
        "set guioptions-=e   " default to text tab bar
    endif
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
"
    "The default leader is '\', but many people prefer ',' as it's in a standard
    "location
    let mapleader = ','

    " Making it so ; works like : for commands. Saves typing and eliminates :W style typos due to lazy holding shift.
    nnoremap ; :

    " visual shifting (does not exit Visual mode)
    vnoremap < <gv
    vnoremap > >gv

    " Adjust viewports to the same size
    map <Leader>= <C-w>=
"
" }

" General {
"
    set autoread
    set backupdir=~/.vim/backup//
    set directory=~/.vim/swp//

    " Quickly edit/reload the vimrc file
    nmap <silent> <leader>ev :e $MYVIMRC<CR>
    nmap <silent> <leader>sv :so $MYVIMRC<CR>
"
" }

" Plugins {
    "
    " Ultisnips {
    "
        let g:UltiSnipsListSnippets        = "<c-k>" "List possible snippets based on current file
    "
    " }
    "
    " YouCompleteMe {
        let g:ycm_add_preview_to_completeopt = 1
        let g:ycm_autoclose_preview_window_after_insertion = 1 
        let g:ycm_key_list_select_completion = []
        let g:ycm_key_list_previous_completion = []

        let g:ycm_collect_identifiers_from_tags_files = 1 " Let YCM read tags from Ctags file
        let g:ycm_use_ultisnips_completer = 1 " Default 1, just ensure
        let g:ycm_seed_identifiers_with_syntax = 1 " Completion for programming language's keyword
        let g:ycm_complete_in_comments = 1 " Completion in comments
        let g:ycm_complete_in_strings = 1 " Completion in string
        nnoremap <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>

        " Called once right before you start selecting multiple cursors
        function! Multiple_cursors_before()
            call youcompleteme#DisableCursorMovedAutocommands()
        endfunction

        " Called once only when the multiple selection is canceled (default <Esc>)
        function! Multiple_cursors_after()
            call youcompleteme#EnableCursorMovedAutocommands()
        endfunction

    " }
    "
    " syntastic {
        let g:syntastic_error_symbol = "✗"
        let g:syntastic_warning_symbol = "⚠"
    " }
    " ctrlp {
        nmap <leader>p :CtrlP<cr>
        nmap <leader>bb :CtrlPBuffer<cr>
        nmap <leader>bm :CtrlPMixed<cr>
        nmap <leader>bs :CtrlPMRU<cr>

        let g:ctrlp_match_func = {'match': 'cpsm#CtrlPMatch'}
    " }
    "
    " vim-go {
        let g:go_highlight_functions = 1
        let g:go_highlight_methods = 1
        let g:go_highlight_structs = 1
        let g:go_highlight_operators = 1
        let g:go_highlight_build_constraints = 1    
    " } 
    "
    " airline {
        let g:airline#extensions#tabline#enabled = 1
        let g:airline#extensions#tagbar#enabled = 0
        let g:airline_powerline_fonts = 0
        let g:airline_left_sep = '▶'
        let g:airline_right_sep = '◀'
        let g:airline_theme='luna'
        let g:airline#extensions#branch#displayed_head_limit = 8
    " }
" }



