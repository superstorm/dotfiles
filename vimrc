" General options
set nocompatible
set hidden
set smartindent autoindent
set tabstop=8 shiftwidth=8 softtabstop=8 noexpandtab
set number
set nowrap
set hls
set mouse=a
set ttymouse=xterm2
set autoread
set backspace=indent,eol,start
set shortmess+=I
set timeout timeoutlen=3000 ttimeoutlen=10
set laststatus=2
set statusline=%<%f%(\ %y%m%r%)%(\ %{fugitive#statusline()}%)%=%(\ %{CtrlSpaceStartWindowIndicator()}\ %)%-3.(%l,%c%V%)\ %P
set showtabline=0
set nostartofline
set noautochdir

" Vundle
filetype off

set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Plugin 'derekwyatt/vim-scala'
Plugin 'derekwyatt/vim-sbt'
" Plugin 'ensime/ensime-vim'
" Plugin 'kien/rainbow_parentheses.vim'

Plugin 'Lokaltog/vim-easymotion'
Plugin 'airblade/vim-gitgutter'
Plugin 'altercation/vim-colors-solarized'
Plugin 'cohama/lexima.vim'
Plugin 'ekalinin/Dockerfile.vim'
Plugin 'elixir-lang/vim-elixir'
" Plugin 'ervandew/supertab'
Plugin 'fatih/vim-go'
Plugin 'glts/vim-textobj-comment'
Plugin 'jgdavey/vim-blockle'
Plugin 'junegunn/vim-easy-align'
Plugin 'kana/vim-textobj-entire'
Plugin 'kana/vim-textobj-lastpat'
Plugin 'kana/vim-textobj-line'
Plugin 'kana/vim-textobj-user'
Plugin 'kchmck/vim-coffee-script'
Plugin 'kshenoy/vim-signature'
Plugin 'majutsushi/tagbar'
Plugin 'nelstrom/vim-markdown-folding'
Plugin 'pangloss/vim-javascript'
Plugin 'rking/ag.vim'
Plugin 'scrooloose/syntastic'
Plugin 'shawncplus/phpcomplete.vim'
Plugin 'sickill/vim-pasta'
Plugin 'szw/vim-commentary'
Plugin 'vim-ctrlspace/vim-ctrlspace'
Plugin 'szw/vim-dict'
Plugin 'szw/vim-g'
Plugin 'szw/vim-indent-object'
Plugin 'szw/vim-kompleter'
Plugin 'szw/vim-maximizer'
Plugin 'szw/vim-smartclose'
Plugin 'szw/vim-tags'
Plugin 'terryma/vim-expand-region'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-characterize'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-haml'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-rake'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-rvm'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-vinegar'
Plugin 'vim-ruby/vim-ruby'
Plugin 'vim-scripts/indenthtml.vim'

call vundle#end()
" Swap/backup files
set noswapfile
set dir=/tmp
set nowb
set nobackup

" Low updatetime, since we don't write swaps
set updatetime=200

" Custom .vimrcs
set exrc
set secure

" Search
set ignorecase
set smartcase
set incsearch
set noinfercase

" Command line
set history=200
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <M-b> <S-Left>
cnoremap <M-f> <S-Right>

if has("user_commands")
    command! -bang -nargs=? -complete=file E e<bang> <args>
    command! -bang -nargs=? -complete=file W w<bang> <args>
    command! -bang -nargs=? -complete=file Wq wq<bang> <args>
    command! -bang -nargs=? -complete=file WQ wq<bang> <args>
    command! -bang Wa wa<bang>
    command! -bang WA wa<bang>
    command! -bang Q q<bang>
    command! -bang QA qa<bang>
    command! -bang Qa qa<bang>
endif

" Folding
set foldmethod=indent
set foldlevelstart=99

" Paste mode
set pastetoggle=<F5>

" Jumps
nnoremap <silent><S-TAB> <C-o>

" List contents of all registers (that typically contain pasteable text).
nnoremap <silent> "" :registers "0123456789abcdefghijklmnopqrstuvwxyz*+.:<CR>

"Improve window resizing
nnoremap <silent><Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent><Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>
nnoremap <silent><Leader>> :exe "vertical resize " . (winwidth(0) * 3/2)<CR>
nnoremap <silent><Leader>< :exe "vertical resize " . (winwidth(0) * 2/3)<CR>

" Insert mode with indent
nnoremap <silent>i @=empty(getline(".")) ? "S" : "i"<CR>
nnoremap <silent>I @=empty(getline(".")) ? "S" : "I"<CR>
nnoremap <silent>a @=empty(getline(".")) ? "S" : "a"<CR>
nnoremap <silent>A @=empty(getline(".")) ? "S" : "A"<CR>

" Insert datetime
inoremap <silent><F11> <C-r>=strftime("%d-%m-%y %H:%M:%S")<CR>

" Encoding
set fileencoding=utf-8
" set fileencodings=utf-8
set termencoding=utf-8
set encoding=utf-8

" Ignore list
set wildignore=.git,.svn,CVS,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,*.pyc,tags,*.tags

" Completion settings
set ofu=syntaxcomplete#Complete
set dictionary+=/usr/share/dict/words

" Omnicompletion trigger
if !has("gui_running")
    inoremap <unique><Nul> <C-x><C-o><C-p>
else
    inoremap <unique><C-Space> <C-x><C-o><C-p>
endif

" Custom language settings
syntax on
" syntax enable
filetype on
filetype plugin on
filetype indent on
runtime macros/matchit.vim

" Colors
syntax enable
set background=dark
colorscheme solarized

" Remove trailing spaces
augroup TrailingSpaces
    au!
    au BufWritePre * if &ft != "markdown" | let b:cpos = [line("."), col(".")] | %s/\s\+$//e | call cursor(b:cpos) | endif
augroup END

" Mute highlight search
nnoremap <silent><C-l> :<C-u>nohlsearch<CR><C-l>

" Lispy identifiers support
augroup LispyIdentifiers
    au!
    au FileType lisp,clojure,html,xml,xhtml,haml,eruby,css,scss,sass,javascript,coffee setlocal isk+=-
augroup END

" Custom filetype settings

augroup PHP
    au!
    au FileType php setlocal omnifunc=phpcomplete#CompletePHP
    " au FileType php,html filetype indent off
    " au FileType php au InsertLeave * pclose
augroup END

augroup Ruby
    au!
    au FileType ruby,eruby,haml setlocal omnifunc=rubycomplete#Complete
    au FileType ruby,eruby,haml let g:rubycomplete_buffer_loading = 1
    au FileType ruby,eruby,haml let g:rubycomplete_rails = 1
    au FileType ruby,eruby,haml let g:rubycomplete_classes_in_global = 1
    au FileType ruby,eruby,haml setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
    au FileType ruby setlocal isk-=-
    au FileType ruby,eruby,haml Rvm
augroup END

augroup Python
    au!
    au FileType python setlocal omnifunc=pythoncomplete#Complete
    au FileType python setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab
    au FileType python setlocal completeopt-=preview "turn off the preview window
    au FileType python setlocal isk-=-
augroup END

augroup Go
    au!
    au FileType go setlocal completeopt-=preview "turn off the preview window
    au FileType go setlocal isk-=-
augroup END

augroup Vimscript
    au!
    au FileType vim setlocal isk-=-
augroup END

augroup Javascript
    au!
    au FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
augroup END

augroup CoffeeScript
    au!
    au FileType coffee setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
augroup END

augroup Html
    au!
    au FileType html setlocal omnifunc=htmlcomplete#CompleteTags
augroup END

augroup Css
    au!
    au FileType css,scss setlocal omnifunc=csscomplete#CompleteCSS
augroup END

augroup Xml
    au!
    au FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
augroup END

augroup Yaml
    au!
    au FileType yaml setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
augroup END

augroup Text
    au!
    au FileType text,markdown setlocal textwidth=74 formatoptions+=1
    au FileType text,markdown,gitcommit setlocal complete+=k infercase
    au FileType text,markdown,gitcommit setlocal isk-=-

    au FileType text,markdown setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab

    " Support for the Markdown Viewer: https://github.com/russross/blackfriday-tool
    au FileType markdown command! -buffer -nargs=0 Md :silent! :exe '! ' . fnameescape($GOPATH) . '/bin/blackfriday-tool --css="http://thomasf.github.io/solarized-css/solarized-dark.min.css" ' . fnameescape(expand('%:p')) . ' /tmp/bft.html && open /tmp/bft.html' | redraw!
    au FileType markdown nnoremap <silent><buffer><F1> :Md<CR>
augroup END

" Custom plugins settings

" Syntastic
" let g:syntastic_ruby_exec="~/.rvm/rubies/default/bin/ruby"

" Vim-Ruby
let g:ruby_indent_access_modifier_style = "indent"

" Dict
let g:dict_hosts = [["dict.org", ["english"]], ["dict.mova.org", ["slovnyk_en-pl", "slovnyk_pl-en"]]]

" Tagbar
nmap <silent><F8> :TagbarToggle<CR>

let g:tagbar_type_go = {
        \ 'ctagstype' : 'go',
        \ 'kinds'     : [
                \ 'p:package',
                \ 'i:imports:1',
                \ 'c:constants',
                \ 'v:variables',
                \ 't:types',
                \ 'n:interfaces',
                \ 'w:fields',
                \ 'e:embedded',
                \ 'm:methods',
                \ 'r:constructor',
                \ 'f:functions'
        \ ],
        \ 'sro' : '.',
        \ 'kind2scope' : {
                \ 't' : 'ctype',
                \ 'n' : 'ntype'
        \ },
        \ 'scope2kind' : {
                \ 'ctype' : 't',
                \ 'ntype' : 'n'
        \ },
        \ 'ctagsbin'  : 'gotags',
        \ 'ctagsargs' : '-sort -silent'
\ }

" Maximizer
let g:maximizer_set_mapping_with_bang = 1

" Vim-Fugitive
nnoremap <silent><F12> :Gstatus<CR>

" CtrlSpace
" nnoremap <silent><Leader>p :CtrlSpaceGoUp<CR>
" nnoremap <silent><Leader>n :CtrlSpaceGoDown<CR>

function! CtrlSpaceStartWindowIndicator()
    return ctrlspace#api#BufNr() != -1 && t:CtrlSpaceStartWindow == winnr() ? ctrlspace#context#Configuration().Symbols.IA . " " : ""
endfunction

" hi link CtrlSpaceSearch IncSearch

if has("gui_running")
    " Settings for MacVim and Inconsolata font
    let g:CtrlSpaceSymbols = { "File": "◯", "CTab": "▣", "Tabs": "▢" }
endif

if executable("ag")
    let g:CtrlSpaceGlobCommand = 'ag -l --nocolor -g ""'
endif

let g:CtrlSpaceIgnoredFiles = '\v(tmp|temp|Godeps)[\/]'

" Vinegar
let g:netrw_liststyle=1

" SuperTab
let g:SuperTabDefaultCompletionType = "<c-x><c-u>"

" easy-align
vmap <Enter> <Plug>(EasyAlign)
nmap <Leader>a <Plug>(EasyAlign)

" vim-pasta
let g:pasta_disabled_filetypes = ["python", "coffee", "markdown", "yaml", "slim", "haml"]

" expand_region
call expand_region#custom_text_objects({
            \ 'a]' :1,
            \ 'ab' :1,
            \ 'aB' :1,
            \ 'ii' :0,
            \ 'ai' :0,
            \ })

call expand_region#custom_text_objects('ruby', {
            \ 'im' :0,
            \ 'am' :0,
            \ })

" vim-tags
" turn off autogenerating until bug with hanging process is fixed
let g:vim_tags_auto_generate = 0

" vim-go
" let g:go_auto_type_info = 1
let g:go_autodetect_gopath = 0

au FileType go nnoremap <silent><buffer><F1> :GoInfo<CR>
au FileType go nnoremap <silent><buffer><F2> :GoImports<CR>:w<CR>
" au BufWritePre *.go GoImports
" let g:go_fmt_autosave = 0
let g:go_fmt_fail_silently = 1

" lexima.vim
call lexima#add_rule({'char': '"', 'at': '\%#[A-Za-z0-9]', 'leave': 1})
call lexima#add_rule({'char': '"', 'at': '[A-Za-z0-9]\%#', 'leave': 1})

call lexima#add_rule({'char': "'", 'at': '\%#[A-Za-z0-9]', 'leave': 1})
call lexima#add_rule({'char': "'", 'at': '[A-Za-z0-9]\%#', 'leave': 1})

call lexima#add_rule({'char': '`', 'at': '\%#[A-Za-z0-9]', 'leave': 1})
call lexima#add_rule({'char': '`', 'at': '[A-Za-z0-9]\%#', 'leave': 1})

" Easymotion
map <Leader> <Plug>(easymotion-prefix)

" Syntastic
let g:syntastic_always_populate_loc_list = 1



" let g:rbpt_colorpairs = [
"     \ ['brown',       'RoyalBlue3'],
"     \ ['Darkblue',    'SeaGreen3'],
"     \ ['darkgray',    'DarkOrchid3'],
"     \ ['darkgreen',   'firebrick3'],
"     \ ['darkcyan',    'RoyalBlue3'],
"     \ ['darkred',     'SeaGreen3'],
"     \ ['darkmagenta', 'DarkOrchid3'],
"     \ ['brown',       'firebrick3'],
"     \ ['gray',        'RoyalBlue3'],
"     \ ['black',       'SeaGreen3'],
"     \ ['darkmagenta', 'DarkOrchid3'],
"     \ ['Darkblue',    'firebrick3'],
"     \ ['darkgreen',   'RoyalBlue3'],
"     \ ['darkcyan',    'SeaGreen3'],
"     \ ['darkred',     'DarkOrchid3'],
"     \ ['red',         'firebrick3'],
"     \ ]
" let g:rbpt_max = 16
" let g:rbpt_loadcmd_toggle = 0
" au VimEnter * RainbowParenthesesToggle
" au Syntax * RainbowParenthesesLoadRound
" au Syntax * RainbowParenthesesLoadSquare
" au Syntax * RainbowParenthesesLoadBraces
"

let g:syntastic_ignore_files = ['\m\c\.h$', '\m\.sbt$']

" Scala has fsc and scalac checkers--running both is pretty redundant and
" slow. An explicit `:SyntasticCheck scalac` can always run the other.
let g:syntastic_scala_checkers = ['fsc']
