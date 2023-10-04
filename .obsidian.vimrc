"" Source your .vimrc
"source ~/.vimrc

"" -- Suggested options --
" Show a few lines of context around the cursor. Note that this makes the
" text scroll if you mouse-click near the start or end of the window.
set scrolloff=5

" Do incremental searching.
set incsearch

" Don't use Ex mode, use Q for formatting.
map Q gq


"" -- Map IDE actions to IdeaVim -- https://jb.gg/abva4t
"" Map \r to the Reformat Code action
"map \r <Action>(ReformatCode)

"" Map <leader>d to start debug
"map <leader>d <Action>(Debug)

"" Map \b to toggle the breakpoint on the current line
"map \b <Action>(ToggleLineBreakpoint)


" Find more examples here: https://jb.gg/share-ideavimrc
syntax on
set number
"set relativenumber
set cursorline
set wrap
set showcmd
set wildmenu
set hlsearch
exec "nohlsearch"
set incsearch
set surround
set ideajoin

imap jk <Esc>
nnoremap ,s <Esc>:source<Space>~/.ideavimrc<CR>
"nnoremap ,h H
"nnoremap ,l L
nnoremap ,p o<ESC>p
nnoremap <Space> :action<Space>RunClass<CR>
nnoremap co A<Tab>//
nnoremap ' f)i,<Space>"
nnoremap + $F)i<Space>+

map 10= 10i=<ESC>
map 10# 10i#<ESC>
nmap H ^
nmap L $
" Quickly remove search highlights
nmap <F9> :nohl

" Yank to system clipboard
set clipboard=unnamed
