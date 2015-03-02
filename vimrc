execute pathogen#infect()

map <leader>S :so $MYVIMRC

let mapleader=","

set number
set hidden
syntax on
filetype plugin indent on

set shell=/bin/sh
set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab
set runtimepath^=~/.vim/bundle/ctrlp.vim
set cmdheight=1
set winwidth=79
set backspace=2
set clipboard=unnamed
set laststatus=2
set noshowmode
set statusline=%f%m%=%r%y
filetype plugin on
filetype indent on
set noswapfile

"writing mode
let g:goyo_width=100
let g:limelight_default_coefficient = 0.3

autocmd User GoyoEnter Limelight
autocmd User GoyoLeave Limelight!

" toggle nerdtree
map <c-n> :NERDTreeToggle <cr>

" Fix slow O inserts
:set timeout timeoutlen=1000 ttimeoutlen=100

" If a file is changed outside of vim, automatically reload it without asking
set autoread

 if &term =~ '^xterm'
    let &t_SI .= "\<Esc>[4 q"
    let &t_EI .= "\<Esc>[6 q"
 endif

"" Use ctrl-[hjkl] to select the active split!
nmap <silent> <c-k> :wincmd k<CR>                                                                                                                       
nmap <silent> <c-j> :wincmd j<CR>                                                                                                                       
nmap <silent> <c-h> :wincmd h<CR>                                                                                                                       
nmap <silent> <c-l> :wincmd l<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" COLOR
"" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
:set t_Co=256 " 256 colors
:color Tomorrow-Night


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
set wildignore+=dist/
set wildignore+=*.png,*.jpg,*.gif

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
         return "\<c-n>"
      endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>

" RUNNING TESTS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! MapCR()
  nnoremap <cr> :call RunTestFile()<cr>
endfunction
call MapCR()

function! RunTestFile(...)
    " save the file before running specs
    if expand("%") != ""
      :w
    end

    " store the filename if in a spec file
    let in_test_file = match(expand("%"), '\([sS]pec\|[tT]est\|examples\)') != -1
    let in_ruby_file = match(expand("%"), '\(.rb\)$') != -1

    if in_test_file
      let t:test_file=@%
    elseif !exists("t:test_file")
      let t:test_file=""
    endif

    if filereadable("script/test")
      exec ":!script/test " . t:test_file
    elseif in_ruby_file
      call RunRubyTests(t:test_file)
    end
endfunction

function! RunRubyTests(filename)
    if filereadable("Gemfile")
        exec ":!bundle exec rspec --color " . a:filename
    else
        exec ":!rspec --color " . a:filename
    end
endfunction

function! IcepickCommand(choice_command, selecta_args, vim_command)
  try
    let selection = system(a:choice_command . " | icepick " . a:selecta_args)
  catch /Vim:Interrupt/
    redraw!
    return
  endtry
  redraw!
  exec a:vim_command . " " . selection
endfunction

" Find all files in all non-dot directories starting in the working directory.
" Fuzzy select one of those. Open the selected file with :e.
nnoremap <leader>f :call IcepickCommand("find * -type f", "", ":e")<cr>
