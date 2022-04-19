
" -------------------------------------------------------- 
" Atalhos
" --------------------------------------------------------

" Vim
colorscheme delek

" Salvar arquivo
nnoremap <F5> :w<Enter>
nnoremap <c-s> :w<Enter>

" Executar ultimo comando
nnoremap <F9> :!!<Enter>

" Coc
" Navega pelas sugestoes usando <Tab>
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

" FZF
" Acessa o FZF
nnoremap <C-f> :FZF<Enter>

" -------------------------------------------------------



" ------------------------------------------------------
" Configurações vim
" ------------------------------------------------------

" Numeros na lateral
set number
set relativenumber


" Comentarios automaticos com <Enter> pressionado
"set formatoptions+=r


" Identacao
"set smartindent
"set autoindent

" tab >> spaces
set noexpandtab
set shiftwidth=4


" ------------------------------------------------------


" ------------------------------------------------------
" Plugins
" ------------------------------------------------------

" Instala o plug automaticamente se não estiver instalado
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


call plug#begin()

Plug 'junegunn/fzf',{'do' : { -> fzf#install() }}
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-dispatch'
Plug 'stsewd/fzf-checkout.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

" ------------------------------------------------------




" ------------------------------------------------------
" Configurações plugins
" ------------------------------------------------------

" CoC

" Funcao que auxilia na navegacao por <Tab>
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Funcao que mostra a documentacao da funcao que o cursor esta em cima em um
" popup
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

colorscheme delek

