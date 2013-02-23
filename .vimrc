filetype off
call pathogen#infect()
set nocompatible
set nomodeline
set modelines=0
" Disable highlighting for matching brackets
    let loaded_matchparen = 1
" File type and syntax
    filetype plugin indent on
    filetype indent off
    syntax on
" Show invisible characters
    set list listchars=eol:$,extends:>,precedes:<,nbsp:_,tab:>-,trail:@
" Searching options
    set hlsearch ignorecase incsearch showmatch smartcase
" Indenting options
    set autoindent
    set nocindent
    set nosmartindent
    set expandtab shiftwidth=4 softtabstop=4 tabstop=4
" Custom user mappings
    " Leader mappings
        let mapleader=' '
        let localleader = '\\'
        nnoremap <silent> <leader>nh :nohlsearch<CR>
        nnoremap <silent> <leader>I :set list!<CR>
        nnoremap <silent> <leader>N :set number!<CR>
        nnoremap <leader>p :set paste! paste?<CR>
        function ToggleSpell()
            if &spell ==# "nospell"
                syntax off
                set spell
                echom "spelling is now on; syntax disabled"
            else
                set nospell
                syntax on
                echom "spelling is now off; syntax enabled"
            endif
        endfunction
        " For some reason, the above works, but this one doesn't (even
        " when the string below is changed to just "spell").
        "function ToggleSpell()
            "if &spell ==# "spell"
                "set nospell
                "syntax on
                "echom "spelling was on ... turning off"
            "else
                "syntax off
                "set spell
                "echom "spelling was off ... turning on"
            "endif
        "endfunction
        function ToggleTextWidth()
            if &textwidth ==# 0
                set textwidth=72
                echom "textwidth is now 72"
            else
                set textwidth=0
                echom "textwidth is now 0"
            endif
        endfunction
        nnoremap <leader>sp :call ToggleSpell()<CR>
        "nnoremap <leader>sp :set spell! spell?<CR>
        nnoremap <leader>W :set wrap! wrap?<CR>
        nnoremap <silent> <leader>ev :tabnew $MYVIMRC<CR>
        nnoremap <leader>sv :source $MYVIMRC<CR>
        nnoremap <silent> <leader>t :NERDTreeToggle<CR>
        nnoremap <leader>u :GundoToggle<CR>
        nnoremap <leader>" viw<Esc>a"<Esc>hbi"<Esc>lel
        nnoremap <leader>' viw<Esc>a'<Esc>hbi'<Esc>lel
        nnoremap <leader>m i\(<Esc>Ea\)<Esc>
        nnoremap _ :bp<CR>
        nnoremap <leader>T :call ToggleTextWidth()<CR>
    " Windows
        nnoremap <C-h> <C-w>h
        nnoremap <C-j> <C-w>j
        nnoremap <C-k> <C-w>k
        nnoremap <C-l> <C-w>l
    " Tabs
        nnoremap <silent> <C-t> :tabnew<CR>
        nnoremap <silent> <C-n> :tabn<CR>
        nnoremap <silent> <C-p> :tabp<CR>
    inoremap jj <Esc>
    inoremap kk <Esc>
    nnoremap j gj
    nnoremap k gk
    vnoremap j gj
    vnoremap k gk
    nnoremap Y y$
    nnoremap Q @@
    nnoremap <Enter> o<Esc>
    nnoremap <silent> K :bn<CR>
    onoremap p i(
    onoremap in( :<C-u>normal! f(vi(<CR>
    onoremap il( :<C-u>normal! F)vi(<CR>
" Other
    set backspace=indent,eol,start cmdheight=2 encoding=utf-8 gdefault
    set hidden nospell number ruler scrolloff=5 shiftround showcmd
    set showmode spellfile=~/.spell.en.add title ttyfast wildmenu wrap
    augroup paste
        autocmd!
        au InsertLeave * set nopaste
    augroup END
" HTML options
    augroup filetype_html
        autocmd!
        autocmd filetype html setlocal shiftwidth=2 softtabstop=2 tabstop=2
        autocmd filetype xhtml setlocal shiftwidth=2 softtabstop=2 tabstop=2
        autocmd filetype xml setlocal shiftwidth=2 softtabstop=2 tabstop=2
    augroup END
" Markdown options
    augroup filetype_markdown
        autocmd!
        autocmd filetype markdown nnoremap <buffer> <silent> <localleader><localleader> :!markdown % > %.html<CR><CR>
    augroup END
" LaTeX options
    let g:tex_flavor='latex'
    augroup filetype_tex
        autocmd!
        autocmd filetype tex nnoremap <buffer> <silent> <localleader><localleader> :!latexmk -pdf %<CR>
        autocmd filetype tex nnoremap <buffer> <silent> <localleader>la :!pdflatex %<CR>
        autocmd filetype tex nnoremap <buffer> <silent> <localleader>xe :!xelatex %<CR>
        autocmd filetype tex nnoremap <buffer> <silent> <localleader>ja :!platex % ; dvipdfmx -f /usr/share/texlive/texmf-dist/fonts/map/dvipdfmx/jfontmaps/otf-ipaex.map %:r.dvi<CR>
        autocmd filetype tex nnoremap <buffer> <silent> <localleader>jp :!platex % ; dvipdfmx -f /usr/share/texlive/texmf-dist/fonts/map/dvipdfmx/jfontmaps/otf-ipaex.map %:r.dvi<CR>
    augroup END
" Markdown options
    au BufNewFile,BufRead *.md set filetype=markdown
        " Interpret `.md` files as Markdown
    augroup filetype_markdown
        autocmd!
        autocmd filetype markdown nnoremap <buffer> <silent> <localleader><localleader> :!pandoc -o %:r.html --template=/home/issa/projects/riceissa.bitbucket.org/template.html --toc --mathjax %<CR><CR>
    augroup END
" Plugins
    " EasyMotion
        let g:EasyMotion_leader_key = '<leader><leader>'
" Abbreviations
    iabbrev adn and
    iabbrev nad and
    iabbrev teh the
    iabbrev het the
    iabbrev ehty they
    iabbrev hety they
    iabbrev tehn then
    iabbrev waht what
set background=light
" Hit `Ctrl-k` then type `el` to produce an ellipsis
    dig el 8230
" Type `:Clip` to load the current file into the clipboard
    command Clip :!cat % | xclip -sel clip
