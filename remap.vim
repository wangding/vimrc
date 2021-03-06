" vim: set sw=2 ts=2 sts=2 et tw=78 foldmarker={{,}} foldmethod=marker:

" basic {{
  xnoremap J :m '>+1<CR>gv=gv
  xnoremap K :m '<-2<CR>gv=gv
  nmap <leader>w :w!<CR>
  nmap ]a :w<CR>:next<CR>
  nmap [a :w<CR>:prev<CR>
  nmap ]<space> o<ESC>k
  nmap [<space> O<ESC>j

  " F3 快速插入明天的日期和星期几
  nmap <F2> :r!date +"\%Y年\%m月\%d日 \%A"<cr>
  nmap <F3> :r!date -d "+1 day" +"\%Y年\%m月\%d日 \%A"<cr>
  nmap <F5> :exec '!clear && node %'<cr>

  " 在块选模式下，把选中的 HTML 代码变成模板字符串
  vmap <silent> ;m :s?^\(\s*\)+'\([^']\+\)',*\s*$?\1\2?g<CR>
  vmap <silent> ;p :s?^\(\s*\)\(.*\)\s*$? \1 + '\2'?<CR>
  vmap <silent> ;s :s?^\(.*\)$?- \1?<CR>:noh<CR>

  nnoremap Q <Nop>
  xnoremap < <gv
  xnoremap > >gv
  inoremap <C-v> <C-o>"+]p
  xnoremap <C-c> "+y
  nnoremap <expr> n  'Nn'[v:searchforward]
  nnoremap <expr> N  'nN'[v:searchforward]
  nnoremap <expr> k (v:count > 1 ? "m'" . v:count : '') . 'k'
  nnoremap <expr> j (v:count > 1 ? "m'" . v:count : '') . 'j'
  " yank to end
  nnoremap Y y$
  " no overwrite paste
  xnoremap p "_dP
  " clear highlight update diff
  nnoremap <silent> <A-u> :let @/=''<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR>
  " some shortcut for git
  nnoremap gca :Gcommit -a -v<CR>
  nnoremap gcc :Gcommit -v -- <C-R>=expand('%')<CR><CR>
  nnoremap gp :call <SID>gpush()<CR>
" }}

" insert keymap like emacs {{
  inoremap <C-w> <C-[>diwa
  inoremap <C-h> <BS>
  inoremap <C-d> <Del>
  inoremap <C-u> <C-G>u<C-U>
  inoremap <C-b> <Left>
  inoremap <C-f> <Right>
  inoremap <C-a> <Home>
  inoremap <expr><C-e> pumvisible() ? "\<C-e>" : "\<End>"

" window navigate {{
  nnoremap <C-l> <c-w>l
  nnoremap <C-h> <c-w>h
  nnoremap <C-j> <c-w>j
  nnoremap <C-k> <c-w>k
" }}

" command line alias {{
  cnoremap w!! w !sudo tee % >/dev/null
  cnoremap <C-p> <Up>
  cnoremap <C-n> <Down>
  cnoremap <C-j> <Left>
  cnoremap <C-k> <Right>
  cnoremap <C-b> <S-Left>
  cnoremap <C-f> <S-Right>
  cnoremap <C-a> <Home>
  cnoremap <C-e> <End>
  cnoremap <C-d> <Del>
  cnoremap <C-h> <BS>
  cnoremap <C-t> <C-R>=expand("%:p:h") . "/" <CR>
" }}

" meta keys {{
  vnoremap <M-c> "+y
  inoremap <M-v> <C-o>"+]p
  nnoremap <M-q> :qa!<cr>
  nnoremap <M-s> :wa<cr>
  inoremap <M-s> <C-o>:w<cr>
  nnoremap <M-1> 1gt
  nnoremap <M-2> 2gt
  nnoremap <M-3> 3gt
  nnoremap <M-4> 4gt
  nnoremap <M-5> 5gt
  inoremap <M-1> <C-o>1gt
  inoremap <M-2> <C-o>2gt
  inoremap <M-3> <C-o>3gt
  inoremap <M-4> <C-o>4gt
  inoremap <M-5> <C-o>5gt
" }}

" plugins {{
  " buftabline
  nmap <leader>1 1gt
  nmap <leader>2 2gt
  nmap <leader>3 3gt
  nmap <leader>4 4gt
  nmap <leader>5 5gt
  nmap <leader>6 6gt
  nmap <leader>7 7gt
  nmap <leader>8 8gt

  " vim-exchange
  xmap x <Plug>(Exchange)

  " coc.nvim
  nmap <silent> <C-c> <Plug>(coc-cursors-position)
  nmap <silent> <C-d> <Plug>(coc-cursors-word)
  xmap <silent> <C-d> <Plug>(coc-cursors-range)
  nmap <silent> <C-s> <Plug>(coc-range-select)
  xmap <silent> <C-s> <Plug>(coc-range-select)
  xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)
  xmap <silent> <TAB> <Plug>(coc-repl-sendtext)
  nmap s <Plug>(coc-smartf-forward)
  nmap S <Plug>(coc-smartf-backward)
  nmap [g <Plug>(coc-git-prevchunk)
  nmap ]g <Plug>(coc-git-nextchunk)
  nmap gs <Plug>(coc-git-chunkinfo)
  nmap gb <Plug>(coc-git-commit)
  imap <C-l> <Plug>(coc-snippets-expand)
  imap <C-j> <Plug>(coc-snippets-expand)
  xmap <C-j> <Plug>(coc-snippets-select)
  nmap <silent> [c <Plug>(coc-diagnostic-prev)
  nmap <silent> ]c <Plug>(coc-diagnostic-next)
  nmap <silent> gd <Plug>(coc-definition)
  nmap <silent> gy <Plug>(coc-type-definition)
  nmap <silent> gi <Plug>(coc-implementation)
  nmap <silent> gr <Plug>(coc-references)
  nnoremap <silent> K :call <SID>show_documentation()<CR>
  " remap for complete to use tab and <cr>
  inoremap <silent><expr> <TAB>
        \ pumvisible() ? "\<C-n>" :
        \ <SID>check_back_space() ? "\<TAB>" :
        \ coc#refresh()
  inoremap <silent><expr> <c-space> coc#refresh()
  inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
  inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" }}

" visual search {{
  "  In visual mode when you press * or # to search for the current selection
  xnoremap    <silent> * :call <SID>visualSearch('f')<CR>
  xnoremap    <silent> # :call <SID>visualSearch('b')<CR>
" }}

" functions {{

function!   s:visualSearch(direction)
  let       l:saved_reg = @"
  execute   'normal! vgvy'
  let       l:pattern = escape(@", '\\/.*$^~[]')
  let       l:pattern = substitute(l:pattern, "\n$", '', '')
  if        a:direction ==# 'b'
    execute 'normal! ?' . l:pattern . "\<cr>"
  elseif    a:direction ==# 'f'
    execute 'normal! /' . l:pattern . '^M'
  endif
  let       @/ = l:pattern
  let       @" = l:saved_reg
endfunction

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

function! s:gpush()
  if empty(get(b:, 'git_dir', '')) | return | endif
  let branch = system('git --git-dir='.b:git_dir.' rev-parse --abbrev-ref HEAD')
  if !v:shell_error && !empty(branch)
    let old_cwd = getcwd()
    execute 'lcd ' . fnamemodify(b:git_dir, ':h')
    execute 'Nrun git push origin '.substitute(branch, "\n$", '', ''). ' --force-with-lease'
  endif
endfunction

function! s:show_documentation()
  if &filetype ==# 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
" }}

" list {{
  nnoremap <silent> \r  :<C-u>CocList -N mru -A<cr>
  nnoremap <silent> <space>h  :<C-u>CocList helptags<cr>
  nnoremap <silent> <space>g  :<C-u>CocList gstatus<CR>
  nnoremap <silent> <space>t  :<C-u>CocList buffers<cr>
  nnoremap <silent> <space>y  :<C-u>CocList yank<cr>
  nnoremap <silent> <space>u  :<C-u>CocList snippets<cr>
  nnoremap <silent> <space>w  :exe 'CocList -A -I --normal --input='.expand('<cword>').' words -w'<CR>
  nnoremap <silent> <space>l  :<C-u>CocList locationlist<CR>
  nnoremap <silent> <space>q  :<C-u>CocList quickfix<CR>
  nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
  nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
  nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
  nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
  nnoremap <silent> <space>s  :<C-u>CocList symbols<cr>
  nnoremap <silent> <space>r  :<C-u>CocList mru<cr>
  nnoremap <silent> <space>f  :<C-u>CocList files<cr>
  nnoremap <silent> <space>j  :<C-u>CocNext<CR>
  nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
  nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

  function! GetDeleteAction(context)
    let name = a:context['name']
    if name ==# 'mru'
      return 'delete'
    elseif name ==# 'buffers'
      return 'delete'
    elseif name ==# 'sessions'
      return 'delete'
    elseif name ==# 'gstatus'
      return 'preview'
    elseif name ==# 'bcommits' || name ==# 'commits'
      return 'diff'
    endif
    return ''
  endfunction
" }}
