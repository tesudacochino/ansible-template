"set list
"set listchars=tab:>_
set paste

" Disable bells
set noerrorbells visualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif

nnoremap <Tab> >>_
nnoremap <S-Tab> <<_
inoremap <S-Tab> <C-D>
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

vnoremap <Tab> >
vnoremap <S-Tab> <

vnoremap <Tab> >gV
vnoremap <S-Tab> <gV

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

syntax on
set hlsearch
set tabstop=8

function SortLine1()
  call setline('.', join(sort(split(getline('.'), ' ')), " "))
endfunction

command SortLine call SortLine1()

