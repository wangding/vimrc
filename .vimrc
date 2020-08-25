let g:local = expand('~/vim-dev')
set runtimepath^=~/vim-dev/plug.nvim
call plug#begin()
Plug 'neoclide/coc.nvim', {'dir': g:local, 'frozen': 1}
Plug 'neoclide/coc-imselect', {'dir': g:local, 'frozen': 1}
Plug 'neoclide/mycomment.vim', {'dir': g:local, 'frozen': 1}
Plug 'chemzqm/vim-run', {'dir': g:local, 'frozen': 1}
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-markdown'
Plug 'dhruvasagar/vim-zoom'
Plug 'tpope/vim-rhubarb'
Plug 'romainl/vim-cool' " search improve
Plug 'mbbill/undotree'
Plug 'whiteinge/diffconflicts'
Plug 'vimcn/vimcdoc'
Plug 'tommcdo/vim-exchange'
Plug 'dag/vim-fish'
Plug 'heavenshell/vim-jsdoc'
Plug 'othree/xml.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'tommcdo/vim-lion'
Plug 'Yggdroot/indentLine'
Plug 'mzlogin/vim-markdown-toc'
Plug 'morhetz/gruvbox'
Plug 'tweekmonster/helpful.vim'
Plug 'lervag/vimtex'
Plug 'simnalamburt/vim-mundo'
Plug 'AndrewRadev/splitjoin.vim'
call plug#end()
filetype plugin on
syntax on
" vimrc files
for s:path in split(glob('~/.vim/vimrc/*.vim'), "\n")
  exe 'source ' . s:path
endfor
