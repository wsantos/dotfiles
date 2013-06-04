"Set to auto read when a file is changed from the outside
set autoread

"Fast saving
nmap <leader>w :w!<cr>

"Nerd Tree commands and options
map <Leader>, :NERDTreeToggle<cr>

"fix label name
set guitablabel="%t%m"   " :h statusline

" http://vim.wikia.com/wiki/Hide_toolbar/scrollbar_and_toggle_menu
set guioptions-=T   " No more toolbar 
set guioptions-=r   " No more right scrollbar
set guioptions-=l   " No more left scrollbar
set guioptions-=L  
set guioptions-=b   " No more bottom scrollbar
"set guioptions-=e   " default to text tab bar


"Tab maps
map <D-1> :tabn 1<CR>
map <D-2> :tabn 2<CR>
map <D-3> :tabn 3<CR>
map <D-4> :tabn 4<CR>
map <D-5> :tabn 5<CR>
map <D-6> :tabn 6<CR>
map <D-7> :tabn 7<CR>
map <D-8> :tabn 8<CR>
map <D-9> :tabn 9<CR>

map! <D-1> <C-O>:tabn 1<CR>
map! <D-2> <C-O>:tabn 2<CR>
map! <D-3> <C-O>:tabn 3<CR>
map! <D-4> <C-O>:tabn 4<CR>
map! <D-5> <C-O>:tabn 5<CR>
map! <D-6> <C-O>:tabn 6<CR>
map! <D-7> <C-O>:tabn 7<CR>
map! <D-8> <C-O>:tabn 8<CR>
map! <D-9> <C-O>:tabn 9<CR>

set visualbell

set background=dark
"let g:solarized_termtrans=1
"let g:solarized_termcolors=256
"let g:solarized_contrast="high"
"let g:solarized_visibility="high"
"colorscheme idleFingers
"let g:zenburn_force_dark_Background=1
" set guifont=ProggyCleanTTSZ:h16
set guifont=Inconsolata:h14
set background=dark
"set noantialias




