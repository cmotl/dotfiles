:syntax on
:colo railscasts

set foldmethod=marker
set ignorecase
set smartcase
set incsearch

set cindent
set smartindent
set autoindent
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

set term=screen-256color

set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'


let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_no_default_include_dirs = 1
let g:syntastic_cpp_no_include_search = 1
let g:syntastic_cpp_auto_refresh_includes = 1
let g:syntastic_cpp_compiler_options = ' -std=c++14'
let g:syntastic_cpp_remove_include_errors = 1

"let g:syntastic_cpp_gcc_exec = 'echo'


"set guifont=Inconsolata\ for\ Powerline\ 12
let g:Powerline_symbols = 'fancy'
set encoding=utf-8
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
set termencoding=utf-8

"nmap , :
imap ,. <esc>
map <F2> :NERDTreeToggle<CR>
nmap <F3> :w<enter> 
imap <F3> <esc>:w<enter> 
nmap <F4> :call ProjectFuzzyFind()<enter>
nmap <F5> :FufTag<enter>
nmap <F6> :FufBuffer<enter>
nmap <F7> :SlimuxShellLast<cr>
imap <F7> <esc>:SlimuxShellLast<cr>
nmap <F8> :SlimuxShellPrompt<cr>
imap <F8> <esc>:SlimuxShellPrompt<cr>
nmap <F9> :SlimuxREPLSendLine<cr>
imap <F9> <esc>:SlimuxREPLSendLine<cr>
nmap <F10> :SlimuxREPLSendSelection<cr>
vmap <F10> :SlimuxREPLSendSelection<cr>

nmap <F11> :bprevious<CR>
nmap <F12> :bpnext<CR>

function! ProjectFuzzyFind()
    let origcurdir = getcwd()
    let curdir = origcurdir
    let prevdir = ""
    let g:fuf_maxMenuWidth = 150

    while curdir != prevdir
        if filereadable(".fuzzyfinder")
            break
        endif
        cd ..
        let prevdir = curdir
        let curdir = getcwd()
    endwhile

    if filereadable(".fuzzyfinder")
        let items = readfile(".fuzzyfinder")
        let files = []
        for n in items
            let files += split(glob(curdir . "/" . n), "\n")
        endfor

        exec 'cd' origcurdir
        call fuf#givenfile#launch('', 0, '>', files)
    endif
    exec 'cd' origcurdir
endfunction


autocmd FileType make set noexpandtab shiftwidth=8 softtabstop=0

execute pathogen#infect()
