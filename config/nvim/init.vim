call plug#begin('~/.vim/plugged')
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-endwise'
Plug 'scrooloose/nerdtree'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }

Plug 'vim-ruby/vim-ruby', {'for': 'ruby'}
Plug 'rust-lang/rust.vim'
Plug 'elixir-lang/vim-elixir', {'for': ['elixir', 'eelixir']}
Plug 'slashmili/alchemist.vim', {'for': ['elixir', 'eelixir']}
Plug 'pangloss/vim-javascript', {'for': 'javascript'}
Plug 'mxw/vim-jsx', {'for': 'javascript'}

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
set cmdheight=1
set winwidth=79
set backspace=2
set clipboard=unnamed
set laststatus=2
set noshowmode
set statusline=%f%m%=%r%y
set noswapfile
set nohlsearch

set lazyredraw

let g:deoplete#enable_at_startup = 1

"nerdtree ignore
let NERDTreeIgnore = ['_build', 'build', 'deps', 'node_modules', '__pycache__', '*.pyc', 'target', 'mnesiadb']
" toggle nerdtree
map <c-n> :NERDTreeToggle <cr>

" If a file is changed outside of vim, automatically reload it without asking
set autoread

"" Use ctrl-[hjkl] to select the active split!
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

tmap <silent> <c-k> <c-\><c-n>:wincmd k<CR>
tmap <silent> <c-j> <c-\><c-n>:wincmd j<CR>
tmap <silent> <c-h> <c-\><c-n>:wincmd h<CR>
tmap <silent> <c-l> <c-\><c-n>:wincmd l<CR>

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
" Indent if we're at the beginning of a line. Else, do completion.
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <expr> <tab> InsertTabWrapper()
inoremap <s-tab> <c-n>

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

autocmd filetype crontab setlocal nobackup nowritebackup

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

""" Map FZF to ctrl-p
map <c-p> :execute 'FZF'<CR>
