call plug#begin('~/.vim/plugged')
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-endwise'
Plug 'scrooloose/nerdtree'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }

Plug 'vim-ruby/vim-ruby', {'for': 'ruby'}
Plug 'rust-lang/rust.vim'
Plug 'elixir-lang/vim-elixir', {'for': ['elixir', 'eelixir']}
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'

call plug#end()

let mapleader=","

set number
set hidden

set shell=/bin/sh
set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab
set cmdheight=2
set winwidth=79
set backspace=2
set clipboard=unnamed
set laststatus=2
set noshowmode
set statusline=%f%m%=%r%y
set noswapfile
set nohlsearch
set nobackup
set nowritebackup
set updatetime=300
set shortmess+=c
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

set lazyredraw

let g:deoplete#enable_at_startup = 1

"nerdtree ignore
let NERDTreeIgnore = ['_build', 'build', 'deps', 'node_modules', '__pycache__', '*.pyc', 'target', 'mnesiadb']
" toggle nerdtree
map <c-n> :NERDTreeToggle <cr>

" If a file is changed outside of vim, automatically reload it without asking
set autoread

if has('nvim')
   nmap <BS> <C-W>h
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" COLOR
"" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
:color my_color

set wildmode=list:longest
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=target
set wildignore+=dist
set wildignore+=bower_components
set wildignore+=*.png,*.jpg,*.gif
set wildignore+=**/node_modules/**
set wildignore+=**priv/static/**
set wildignore+=deps

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"KEYMAPS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap ; :
ino jj <esc>
cno jj <c-c>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MULTIPURPOSE TAB KEY
" From CoC
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nnoremap <silent> K :call <SID>show_documentation()<CR>

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

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

" RUNNING TESTS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <cr> :call RunTestFile()<cr>

function! RunTestFile(...)
    if expand("%") != ""
      :w
    end

    let in_test_file = match(expand("%"), '\([sS]pec\|[tT]est\)') != -1

    if in_test_file
      let t:test_file=@%
    elseif !exists("t:test_file")
      let t:test_file=""
    endif

    let in_ruby_file = match(expand("%"), '\(.rb\)$') != -1
    let in_elixir_file = match(expand("%"), '\(.ex\|.exs\)$') != -1
    let in_rust_file = match(expand("%"), '\(.rs\)$') != -1
    let in_js_file = match(expand("%"), '\(.js\)$') != -1

    if filereadable("script/test")
      exec('!script/test ' . t:test_file)
    elseif in_ruby_file
      call RunRubyTests(t:test_file)
    elseif in_elixir_file
      call RunElixirTests(t:test_file)
    elseif in_rust_file
      call RunRustTests(t:test_file)
    elseif in_js_file
      call RunJSTests(t:test_file)
    end
endfunction

function! RunRubyTests(filename)
    if filereadable("Gemfile")
        exec('!bundle exec rspec ' . a:filename)
    else
        exec('!rspec ' . a:filename)
    end
endfunction

function! RunElixirTests(filename)
  exec('!mix test ' . a:filename)
endfunction

function! RunRustTests(filename)
  exec('!cargo test')
endfunction

function! RunJSTests(filename)
  exec('!npm run test')
endfunction

autocmd filetype crontab setlocal

function! SpecFileFor(file)
  let in_ruby_file = match(a:file, '\(.rb\)$') != -1
  let in_elixir_file = match(a:file, '\(.ex\)$') != -1

  if in_ruby_file
    return substitute(a:file, '\vlib/(.+).rb', 'spec/\1_spec.rb', '')
  elseif in_elixir_file
    return substitute(a:file, '\vweb/(.+).ex', 'test/\1_test.exs', '')
  endif
endfunction

function! JumpToSpec()
  let currentFile = expand("%")
  let specFile    = SpecFileFor(currentFile)
  echo specFile
  if filereadable(specFile)
    " Jump to spec window if it's already open
    let windowNr = bufwinnr(specFile)
    if windowNr != -1
      execute windowNr . "wincmd w"
    " Window is not already open, split it
    else
      execute "vsp" specFile
    endif
  else
    if confirm("Spec file doesn't exist. Create " . specFile . "?", "yes\nno") == 1
      execute "vsp" specFile
    endif
  endif
endfunction

nnoremap <Leader>s :call JumpToSpec()<CR>

" Trailing whitespace
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd BufRead,InsertLeave * match ExtraWhitespace /\s\+$/
highlight ExtraWhitespace ctermbg=red guibg=red
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red

function! <SID>StripTrailingWhitespaces()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfun

autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()
set clipboard+=unnamedplus

""" Map FZF to ctrl-p
map <c-p> :execute 'FZF'<CR>
let $FZF_DEFAULT_COMMAND = 'ag -g ""'

highlight TermCursor ctermfg=red guifg=red
set splitbelow
set splitright

" Terminal settings
tnoremap <Leader><ESC> <C-\><C-n>

" Window navigation function
" Make ctrl-h/j/k/l move between windows and auto-insert in terminals
func! s:mapMoveToWindowInDirection(direction)
    func! s:maybeInsertMode(direction)
        stopinsert
        execute "wincmd" a:direction

        if &buftype == 'terminal'
            startinsert!
        endif
    endfunc

    execute "tnoremap" "<silent>" "<C-" . a:direction . ">"
                \ "<C-\\><C-n>"
                \ ":call <SID>maybeInsertMode(\"" . a:direction . "\")<CR>"
    execute "nnoremap" "<silent>" "<C-" . a:direction . ">"
                \ ":call <SID>maybeInsertMode(\"" . a:direction . "\")<CR>"
endfunc
for dir in ["h", "j", "l", "k"]
    call s:mapMoveToWindowInDirection(dir)
endfor

" COC stuff

