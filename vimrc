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
nnoremap <leader>t :call RunNearestTest()<cr>
nnoremap <leader>a :call RunTests('')<cr>

function! RunTestFile(...)
    if a:0
        let command_suffix = a:1
    else
        let command_suffix = ""
    endif

    " save the file before running specs
    if expand("%") != ""
      :w
    end

    " store the filename if in a spec file
    let in_test_file = match(expand("%"), '\([sS]pec\|[tT]est\|examples\)') != -1

    " First choice: project-specific test script
    if filereadable("script/test")
      if in_test_file
        call SetTestFile()
      endif
      exec ":!script/test " . t:grb_test_file
      return
    end

    " Run the tests for the previously-marked file.
    let in_ruby_test_file = match(expand("%"), '\(_spec.rb\)$') != -1
    let in_elixir_test_file = match(expand("%"), '\(_test.exs\)$') != -1
    let in_javascript_test_file = match(expand("%"), '\([sS]pec.js\)$') != -1

    if in_ruby_test_file
      let t:test_lang='ruby'
      call SetTestFile()
    elseif in_elixir_test_file
      let t:test_lang='elixir'
      call SetTestFile()
    elseif in_javascript_test_file
      let t:test_lang='javascript'
      call SetTestFile()
    end
    if t:test_lang == 'ruby'
      call RunRubyTests(t:grb_test_file . command_suffix)
    elseif t:test_lang == 'elixir'
      call RunElixirTests(t:grb_test_file . command_suffix)
    elseif t:test_lang == 'javascript'
      call RunJavascriptTests(t:grb_test_file . command_suffix)
    end
endfunction

function! RunNearestTest()
    let spec_line_number = line('.')
    call RunTestFile(":" . spec_line_number)
endfunction

function! SetTestFile()
    let t:grb_test_file=@%
endfunction

function! RunElixirTests(filename)
    exec ":!mix test " . a:filename
endfunction

function! RunJavascriptTests(filename)
    exec ":!rake teaspoon " . a:filename
endfunction

function! RunRubyTests(filename)
  if match(a:filename, '\.feature$') != -1
      exec ":!script/features " . a:filename
  else
      " Fall back to a blocking test run with Bundler
      if filereadable("Gemfile")
          exec ":!bundle exec rspec --color " . a:filename
      " Fall back to a normal blocking test run
      else
          exec ":!rspec --color " . a:filename
      end
  end
endfunction
