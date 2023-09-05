let SessionLoad = 1
if &cp | set nocp | endif
let s:cpo_save=&cpo
set cpo&vim
imap <Nul> <C-Space>
inoremap <expr> <Up> pumvisible() ? "\" : "\<Up>"
inoremap <expr> <S-Tab> pumvisible() ? "\" : "\<S-Tab>"
inoremap <expr> <Down> pumvisible() ? "\" : "\<Down>"
inoremap <silent> <Plug>NERDCommenterInsert :call nerdcommenter#Comment('i', "Insert")
inoremap <silent> <Plug>(ale_complete) :ALEComplete
inoremap <C-O> 
nnoremap <silent>  :LeaderfFile
nnoremap <NL> :tabprevious
nnoremap  :tabnext
noremap  :LeaderfMru
map  :tab split:exec("tag ".expand("<cword>"))
nmap \ca <Plug>NERDCommenterAltDelims
xmap \cu <Plug>NERDCommenterUncomment
nmap \cu <Plug>NERDCommenterUncomment
xmap \cb <Plug>NERDCommenterAlignBoth
nmap \cb <Plug>NERDCommenterAlignBoth
xmap \cl <Plug>NERDCommenterAlignLeft
nmap \cl <Plug>NERDCommenterAlignLeft
nmap \cA <Plug>NERDCommenterAppend
xmap \cy <Plug>NERDCommenterYank
nmap \cy <Plug>NERDCommenterYank
xmap \cs <Plug>NERDCommenterSexy
nmap \cs <Plug>NERDCommenterSexy
xmap \ci <Plug>NERDCommenterInvert
nmap \ci <Plug>NERDCommenterInvert
nmap \c$ <Plug>NERDCommenterToEOL
xmap \cn <Plug>NERDCommenterNested
nmap \cn <Plug>NERDCommenterNested
xmap \cm <Plug>NERDCommenterMinimal
nmap \cm <Plug>NERDCommenterMinimal
xmap \c  <Plug>NERDCommenterToggle
nmap \c  <Plug>NERDCommenterToggle
xmap \cc <Plug>NERDCommenterComment
nmap \cc <Plug>NERDCommenterComment
nmap \w\m <Plug>VimwikiMakeTomorrowDiaryNote
nmap \w\y <Plug>VimwikiMakeYesterdayDiaryNote
nmap \w\t <Plug>VimwikiTabMakeDiaryNote
nmap \w\w <Plug>VimwikiMakeDiaryNote
nmap \w\i <Plug>VimwikiDiaryGenerateLinks
nmap \wi <Plug>VimwikiDiaryIndex
nmap \ws <Plug>VimwikiUISelect
nmap \wt <Plug>VimwikiTabIndex
nmap \ww <Plug>VimwikiIndex
nnoremap \w :w
nmap \d :ALEDetail
nmap \n <Plug>(ale_next_wrap)
nmap \p <Plug>(ale_previous_wrap)
nnoremap d{ ma%x`ax
vmap gx <Plug>NetrwBrowseXVis
nmap gx <Plug>NetrwBrowseX
map md :call CompileFunc()
nnoremap spc :sp %:r.cpp
nnoremap sph :sp %:r.h
nnoremap sp :spj
nnoremap vsc :vs %:r.cpp
nnoremap vsh :vs %:r.h
nnoremap vs :vsl
nnoremap <silent> <Plug>(YCMFindSymbolInDocument) :call youcompleteme#finder#FindSymbol( 'document' )
nnoremap <silent> <Plug>(YCMFindSymbolInWorkspace) :call youcompleteme#finder#FindSymbol( 'workspace' )
vnoremap <silent> <Plug>NetrwBrowseXVis :call netrw#BrowseXVis()
nnoremap <silent> <Plug>NetrwBrowseX :call netrw#BrowseX(expand((exists("g:netrw_gx")? g:netrw_gx : '<cfile>')),netrw#CheckIfRemote())
nnoremap <silent> <Plug>(CMakeStop) :call cmake#Stop()
nnoremap <silent> <Plug>(CMakeClose) :call cmake#Close()
nnoremap <silent> <Plug>(CMakeOpen) :call cmake#Open()
nnoremap <silent> <Plug>(CMakeTest) :call cmake#Test(0)
nnoremap <Plug>(CMakeBuildTarget) :CMakeBuild 
nnoremap <silent> <Plug>(CMakeInstall) :call cmake#Install()
nnoremap <silent> <Plug>(CMakeBuild) :call cmake#Build(0)
nnoremap <Plug>(CMakeSwitch) :CMakeSwitch 
nnoremap <silent> <Plug>(CMakeClean) :call cmake#Clean()
nnoremap <silent> <Plug>(CMakeGenerate) :call cmake#Generate(0)
nnoremap <Plug>NERDCommenterAltDelims :call nerdcommenter#SwitchToAlternativeDelimiters(1)
xnoremap <silent> <Plug>NERDCommenterUncomment :call nerdcommenter#Comment("x", "Uncomment")
nnoremap <silent> <Plug>NERDCommenterUncomment :call nerdcommenter#Comment("n", "Uncomment")
xnoremap <silent> <Plug>NERDCommenterAlignBoth :call nerdcommenter#Comment("x", "AlignBoth")
nnoremap <silent> <Plug>NERDCommenterAlignBoth :call nerdcommenter#Comment("n", "AlignBoth")
xnoremap <silent> <Plug>NERDCommenterAlignLeft :call nerdcommenter#Comment("x", "AlignLeft")
nnoremap <silent> <Plug>NERDCommenterAlignLeft :call nerdcommenter#Comment("n", "AlignLeft")
nnoremap <silent> <Plug>NERDCommenterAppend :call nerdcommenter#Comment("n", "Append")
xnoremap <silent> <Plug>NERDCommenterYank :call nerdcommenter#Comment("x", "Yank")
nnoremap <silent> <Plug>NERDCommenterYank :call nerdcommenter#Comment("n", "Yank")
xnoremap <silent> <Plug>NERDCommenterSexy :call nerdcommenter#Comment("x", "Sexy")
nnoremap <silent> <Plug>NERDCommenterSexy :call nerdcommenter#Comment("n", "Sexy")
xnoremap <silent> <Plug>NERDCommenterInvert :call nerdcommenter#Comment("x", "Invert")
nnoremap <silent> <Plug>NERDCommenterInvert :call nerdcommenter#Comment("n", "Invert")
nnoremap <silent> <Plug>NERDCommenterToEOL :call nerdcommenter#Comment("n", "ToEOL")
xnoremap <silent> <Plug>NERDCommenterNested :call nerdcommenter#Comment("x", "Nested")
nnoremap <silent> <Plug>NERDCommenterNested :call nerdcommenter#Comment("n", "Nested")
xnoremap <silent> <Plug>NERDCommenterMinimal :call nerdcommenter#Comment("x", "Minimal")
nnoremap <silent> <Plug>NERDCommenterMinimal :call nerdcommenter#Comment("n", "Minimal")
xnoremap <silent> <Plug>NERDCommenterToggle :call nerdcommenter#Comment("x", "Toggle")
nnoremap <silent> <Plug>NERDCommenterToggle :call nerdcommenter#Comment("n", "Toggle")
xnoremap <silent> <Plug>NERDCommenterComment :call nerdcommenter#Comment("x", "Comment")
nnoremap <silent> <Plug>NERDCommenterComment :call nerdcommenter#Comment("n", "Comment")
nnoremap <silent> <M-n> :LeaderfBuffer
nnoremap <silent> <C-F> :LeaderfFile
vnoremap <silent> <Plug>LeaderfGtagsGrep :=leaderf#Gtags#startCmdline(2, 1, 'g')
vnoremap <silent> <Plug>LeaderfGtagsSymbol :=leaderf#Gtags#startCmdline(2, 1, 's')
vnoremap <silent> <Plug>LeaderfGtagsReference :=leaderf#Gtags#startCmdline(2, 1, 'r')
vnoremap <silent> <Plug>LeaderfGtagsDefinition :=leaderf#Gtags#startCmdline(2, 1, 'd')
nnoremap <Plug>LeaderfGtagsGrep :=leaderf#Gtags#startCmdline(0, 1, 'g')
onoremap <Plug>LeaderfGtagsGrep :=leaderf#Gtags#startCmdline(0, 1, 'g')
nnoremap <Plug>LeaderfGtagsSymbol :=leaderf#Gtags#startCmdline(0, 1, 's')
onoremap <Plug>LeaderfGtagsSymbol :=leaderf#Gtags#startCmdline(0, 1, 's')
nnoremap <Plug>LeaderfGtagsReference :=leaderf#Gtags#startCmdline(0, 1, 'r')
onoremap <Plug>LeaderfGtagsReference :=leaderf#Gtags#startCmdline(0, 1, 'r')
nnoremap <Plug>LeaderfGtagsDefinition :=leaderf#Gtags#startCmdline(0, 1, 'd')
onoremap <Plug>LeaderfGtagsDefinition :=leaderf#Gtags#startCmdline(0, 1, 'd')
vnoremap <silent> <Plug>LeaderfRgBangVisualRegexBoundary :=leaderf#Rg#startCmdline(2, 1, 1, 1)
vnoremap <silent> <Plug>LeaderfRgBangVisualRegexNoBoundary :=leaderf#Rg#startCmdline(2, 1, 1, 0)
vnoremap <silent> <Plug>LeaderfRgBangVisualLiteralBoundary :=leaderf#Rg#startCmdline(2, 1, 0, 1)
vnoremap <silent> <Plug>LeaderfRgBangVisualLiteralNoBoundary :=leaderf#Rg#startCmdline(2, 1, 0, 0)
vnoremap <silent> <Plug>LeaderfRgVisualRegexBoundary :=leaderf#Rg#startCmdline(2, 0, 1, 1)
vnoremap <silent> <Plug>LeaderfRgVisualRegexNoBoundary :=leaderf#Rg#startCmdline(2, 0, 1, 0)
vnoremap <silent> <Plug>LeaderfRgVisualLiteralBoundary :=leaderf#Rg#startCmdline(2, 0, 0, 1)
vnoremap <silent> <Plug>LeaderfRgVisualLiteralNoBoundary :=leaderf#Rg#startCmdline(2, 0, 0, 0)
noremap <Plug>LeaderfRgWORDRegexBoundary :=leaderf#Rg#startCmdline(1, 0, 1, 1)
noremap <Plug>LeaderfRgWORDRegexNoBoundary :=leaderf#Rg#startCmdline(1, 0, 1, 0)
noremap <Plug>LeaderfRgWORDLiteralBoundary :=leaderf#Rg#startCmdline(1, 0, 0, 0)
noremap <Plug>LeaderfRgWORDLiteralNoBoundary :=leaderf#Rg#startCmdline(1, 0, 0, 0)
noremap <Plug>LeaderfRgBangCwordRegexBoundary :=leaderf#Rg#startCmdline(0, 1, 1, 1)
noremap <Plug>LeaderfRgBangCwordRegexNoBoundary :=leaderf#Rg#startCmdline(0, 1, 1, 0)
noremap <Plug>LeaderfRgBangCwordLiteralBoundary :=leaderf#Rg#startCmdline(0, 1, 0, 1)
noremap <Plug>LeaderfRgBangCwordLiteralNoBoundary :=leaderf#Rg#startCmdline(0, 1, 0, 0)
noremap <Plug>LeaderfRgCwordRegexBoundary :=leaderf#Rg#startCmdline(0, 0, 1, 1)
noremap <Plug>LeaderfRgCwordRegexNoBoundary :=leaderf#Rg#startCmdline(0, 0, 1, 0)
noremap <Plug>LeaderfRgCwordLiteralBoundary :=leaderf#Rg#startCmdline(0, 0, 0, 1)
noremap <Plug>LeaderfRgCwordLiteralNoBoundary :=leaderf#Rg#startCmdline(0, 0, 0, 0)
noremap <Plug>LeaderfRgPrompt :Leaderf rg -e 
noremap <silent> <Plug>LeaderfMruCwdFullScreen :Leaderf mru --fullScreen
noremap <silent> <Plug>LeaderfMruCwdRight :Leaderf mru --right
noremap <silent> <Plug>LeaderfMruCwdLeft :Leaderf mru --left
noremap <silent> <Plug>LeaderfMruCwdBottom :Leaderf mru --bottom
noremap <silent> <Plug>LeaderfMruCwdTop :Leaderf mru --top
noremap <silent> <Plug>LeaderfBufferFullScreen :Leaderf buffer --fullScreen
noremap <silent> <Plug>LeaderfBufferRight :Leaderf buffer --right
noremap <silent> <Plug>LeaderfBufferLeft :Leaderf buffer --left
noremap <silent> <Plug>LeaderfBufferBottom :Leaderf buffer --bottom
noremap <silent> <Plug>LeaderfBufferTop :Leaderf buffer --top
noremap <silent> <Plug>LeaderfFileFullScreen :Leaderf file --fullScreen
noremap <silent> <Plug>LeaderfFileRight :Leaderf file --right
noremap <silent> <Plug>LeaderfFileLeft :Leaderf file --left
noremap <silent> <Plug>LeaderfFileBottom :Leaderf file --bottom
noremap <silent> <Plug>LeaderfFileTop :Leaderf file --top
nnoremap <silent> <Plug>(ale_repeat_selection) :ALERepeatSelection
nnoremap <silent> <Plug>(ale_code_action) :ALECodeAction
nnoremap <silent> <Plug>(ale_filerename) :ALEFileRename
nnoremap <silent> <Plug>(ale_rename) :ALERename
nnoremap <silent> <Plug>(ale_import) :ALEImport
nnoremap <silent> <Plug>(ale_documentation) :ALEDocumentation
nnoremap <silent> <Plug>(ale_hover) :ALEHover
nnoremap <silent> <Plug>(ale_find_references) :ALEFindReferences
nnoremap <silent> <Plug>(ale_go_to_implementation_in_vsplit) :ALEGoToImplementation -vsplit
nnoremap <silent> <Plug>(ale_go_to_implementation_in_split) :ALEGoToImplementation -split
nnoremap <silent> <Plug>(ale_go_to_implementation_in_tab) :ALEGoToImplementation -tab
nnoremap <silent> <Plug>(ale_go_to_implementation) :ALEGoToImplementation
nnoremap <silent> <Plug>(ale_go_to_type_definition_in_vsplit) :ALEGoToTypeDefinition -vsplit
nnoremap <silent> <Plug>(ale_go_to_type_definition_in_split) :ALEGoToTypeDefinition -split
nnoremap <silent> <Plug>(ale_go_to_type_definition_in_tab) :ALEGoToTypeDefinition -tab
nnoremap <silent> <Plug>(ale_go_to_type_definition) :ALEGoToTypeDefinition
nnoremap <silent> <Plug>(ale_go_to_definition_in_vsplit) :ALEGoToDefinition -vsplit
nnoremap <silent> <Plug>(ale_go_to_definition_in_split) :ALEGoToDefinition -split
nnoremap <silent> <Plug>(ale_go_to_definition_in_tab) :ALEGoToDefinition -tab
nnoremap <silent> <Plug>(ale_go_to_definition) :ALEGoToDefinition
nnoremap <silent> <Plug>(ale_fix) :ALEFix
nnoremap <silent> <Plug>(ale_detail) :ALEDetail
nnoremap <silent> <Plug>(ale_lint) :ALELint
nnoremap <silent> <Plug>(ale_reset_buffer) :ALEResetBuffer
nnoremap <silent> <Plug>(ale_disable_buffer) :ALEDisableBuffer
nnoremap <silent> <Plug>(ale_enable_buffer) :ALEEnableBuffer
nnoremap <silent> <Plug>(ale_toggle_buffer) :ALEToggleBuffer
nnoremap <silent> <Plug>(ale_reset) :ALEReset
nnoremap <silent> <Plug>(ale_disable) :ALEDisable
nnoremap <silent> <Plug>(ale_enable) :ALEEnable
nnoremap <silent> <Plug>(ale_toggle) :ALEToggle
nnoremap <silent> <Plug>(ale_last) :ALELast
nnoremap <silent> <Plug>(ale_first) :ALEFirst
nnoremap <silent> <Plug>(ale_next_wrap_warning) :ALENext -wrap -warning
nnoremap <silent> <Plug>(ale_next_warning) :ALENext -warning
nnoremap <silent> <Plug>(ale_next_wrap_error) :ALENext -wrap -error
nnoremap <silent> <Plug>(ale_next_error) :ALENext -error
nnoremap <silent> <Plug>(ale_next_wrap) :ALENextWrap
nnoremap <silent> <Plug>(ale_next) :ALENext
nnoremap <silent> <Plug>(ale_previous_wrap_warning) :ALEPrevious -wrap -warning
nnoremap <silent> <Plug>(ale_previous_warning) :ALEPrevious -warning
nnoremap <silent> <Plug>(ale_previous_wrap_error) :ALEPrevious -wrap -error
nnoremap <silent> <Plug>(ale_previous_error) :ALEPrevious -error
nnoremap <silent> <Plug>(ale_previous_wrap) :ALEPreviousWrap
nnoremap <silent> <Plug>(ale_previous) :ALEPrevious
nnoremap <C-K> :tabnext
nnoremap <C-J> :tabprevious
nnoremap <M-r> :redo
noremap <M-f> :LeaderfFunction!
noremap <M-t> :LeaderfTag
noremap <M-b> :LeaderfBuffer
noremap <C-R> :LeaderfMru
map <M-]> :vsp :exec("tag ".expand("<cword>"))
map <C-Bslash> :tab split:exec("tag ".expand("<cword>"))
inoremap <expr> 	 pumvisible() ? "\" : "\	"
inoremap  
inoremap " ""<++>F"i
inoremap ' ''<++>F'i
inoremap ( ()<++>F)i
inoremap ) =ClosePair(')')
inoremap ,f /<++>:nohlsearchc4l
nnoremap <silent> î :LeaderfBuffer
nnoremap ò :redo
noremap æ :LeaderfFunction!
noremap ô :LeaderfTag
noremap â :LeaderfBuffer
map Ý :vsp :exec("tag ".expand("<cword>"))
inoremap [ []<++>F]i
inoremap ] =ClosePair(']')
inoremap { {}<++>F}i
inoremap } =ClosePair('}')
let &cpo=s:cpo_save
unlet s:cpo_save
set background=dark
set backspace=indent,eol,start
set clipboard=unnamedplus
set cmdheight=2
set completeopt=menuone
set cpoptions=aAceFsB
set expandtab
set fileencodings=utf8,gbk,gb2312,gb18030
set helplang=en
set hlsearch
set incsearch
set laststatus=2
set mouse=n
set printoptions=paper:a4
set ruler
set runtimepath=~/.vim,~/.vim/bundle/Vundle.vim,~/.vim/bundle/vim-gutentags,~/.vim/bundle/ale,~/.vim/bundle/vim-cpp-enhanced-highlight,~/.vim/bundle/YouCompleteMe,~/.vim/bundle/LeaderF,~/.vim/bundle/echodoc.vim,~/.vim/bundle/vimwiki,~/.vim/bundle/nerdcommenter,~/.vim/bundle/vim-cmake,~/.vim/bundle/tabular,~/.vim/bundle/vim-markdown,~/.vim/bundle/vim-markdown-toc,~/.vim/bundle/markdown-preview.nvim,/var/lib/vim/addons,/etc/vim,/usr/share/vim/vimfiles,/usr/share/vim/vim81,/usr/share/vim/vimfiles/after,/etc/vim/after,/var/lib/vim/addons/after,~/.vim/after,~/.vim/bundle/Vundle.vim,~/.vim/bundle/Vundle.vim/after,~/.vim/bundle/vim-gutentags/after,~/.vim/bundle/ale/after,~/.vim/bundle/vim-cpp-enhanced-highlight/after,~/.vim/bundle/YouCompleteMe/after,~/.vim/bundle/LeaderF/after,~/.vim/bundle/echodoc.vim/after,~/.vim/bundle/vimwiki/after,~/.vim/bundle/nerdcommenter/after,~/.vim/bundle/vim-cmake/after,~/.vim/bundle/tabular/after,~/.vim/bundle/vim-markdown/after,~/.vim/bundle/vim-markdown-toc/after,~/.vim/bundle/markdown-preview.nvim/after
set scrolloff=3
set shiftwidth=4
set shortmess=filnxtToOSc
set showmatch
set softtabstop=-1
set statusline=%f%r[%l,%v][HEX=%B]
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc
set ttimeout
set ttimeoutlen=100
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/Workspace/C++/system/src
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
argglobal
%argdel
$argadd loader.asm
set stal=2
tabnew
tabrewind
edit loader.asm
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
set nosplitbelow
set nosplitright
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe 'vert 1resize ' . ((&columns * 82 + 86) / 173)
exe 'vert 2resize ' . ((&columns * 90 + 86) / 173)
argglobal
setlocal keymap=
setlocal noarabic
setlocal noautoindent
setlocal backupcopy=
setlocal balloonexpr=
setlocal nobinary
setlocal nobreakindent
setlocal breakindentopt=
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal nocindent
setlocal cinkeys=0{,0},0),0],:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
setlocal colorcolumn=
setlocal comments=s1:/*,mb:*,ex:*/,://,b:#,:%,:XCOMM,n:>,fb:-
setlocal commentstring=/*%s*/
setlocal complete=.,w,b,u,t,i
setlocal concealcursor=
setlocal conceallevel=0
setlocal completefunc=
setlocal nocopyindent
setlocal cryptmethod=
setlocal nocursorbind
setlocal nocursorcolumn
setlocal nocursorline
setlocal cursorlineopt=both
setlocal define=
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal expandtab
if &filetype != 'asm'
setlocal filetype=asm
endif
setlocal fixendofline
setlocal foldcolumn=0
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=tcq
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal formatprg=
setlocal grepprg=
setlocal iminsert=0
setlocal imsearch=-1
setlocal include=
setlocal includeexpr=
setlocal indentexpr=
setlocal indentkeys=0{,0},0),0],:,0#,!^F,o,O,e
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255
setlocal keywordprg=
setlocal nolinebreak
setlocal nolisp
setlocal lispwords=
setlocal nolist
setlocal makeencoding=
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=bin,octal,hex
set number
setlocal number
setlocal numberwidth=4
setlocal omnifunc=
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
set relativenumber
setlocal relativenumber
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal scrolloff=-1
setlocal shiftwidth=4
setlocal noshortname
setlocal sidescrolloff=-1
setlocal signcolumn=auto
setlocal nosmartindent
setlocal softtabstop=-1
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=
setlocal suffixesadd=
setlocal swapfile
setlocal synmaxcol=3000
if &syntax != 'asm'
setlocal syntax=asm
endif
setlocal tabstop=8
setlocal tagcase=
setlocal tagfunc=
setlocal tags=~/.cache/tags/home-melrose-Workspace-C++-system-.tags,./tags,./TAGS,tags,TAGS
setlocal termwinkey=
setlocal termwinscroll=10000
setlocal termwinsize=
setlocal textwidth=0
setlocal thesaurus=
setlocal noundofile
setlocal undolevels=-123456
setlocal varsofttabstop=
setlocal vartabstop=
setlocal wincolor=
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
silent! normal! zE
let s:l = 76 - ((30 * winheight(0) + 18) / 37)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
76
normal! 022|
wincmd w
argglobal
if bufexists("boot.asm") | buffer boot.asm | else | edit boot.asm | endif
setlocal keymap=
setlocal noarabic
setlocal noautoindent
setlocal backupcopy=
setlocal balloonexpr=
setlocal nobinary
setlocal nobreakindent
setlocal breakindentopt=
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal nocindent
setlocal cinkeys=0{,0},0),0],:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
setlocal colorcolumn=
setlocal comments=s1:/*,mb:*,ex:*/,://,b:#,:%,:XCOMM,n:>,fb:-
setlocal commentstring=/*%s*/
setlocal complete=.,w,b,u,t,i
setlocal concealcursor=
setlocal conceallevel=0
setlocal completefunc=
setlocal nocopyindent
setlocal cryptmethod=
setlocal nocursorbind
setlocal nocursorcolumn
setlocal nocursorline
setlocal cursorlineopt=both
setlocal define=
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal expandtab
if &filetype != 'asm'
setlocal filetype=asm
endif
setlocal fixendofline
setlocal foldcolumn=0
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=tcq
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal formatprg=
setlocal grepprg=
setlocal iminsert=0
setlocal imsearch=-1
setlocal include=
setlocal includeexpr=
setlocal indentexpr=
setlocal indentkeys=0{,0},0),0],:,0#,!^F,o,O,e
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255
setlocal keywordprg=
setlocal nolinebreak
setlocal nolisp
setlocal lispwords=
setlocal nolist
setlocal makeencoding=
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=bin,octal,hex
set number
setlocal number
setlocal numberwidth=4
setlocal omnifunc=
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
set relativenumber
setlocal relativenumber
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal scrolloff=-1
setlocal shiftwidth=4
setlocal noshortname
setlocal sidescrolloff=-1
setlocal signcolumn=auto
setlocal nosmartindent
setlocal softtabstop=-1
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=
setlocal suffixesadd=
setlocal swapfile
setlocal synmaxcol=3000
if &syntax != 'asm'
setlocal syntax=asm
endif
setlocal tabstop=8
setlocal tagcase=
setlocal tagfunc=
setlocal tags=~/.cache/tags/home-melrose-Workspace-C++-system-.tags,./tags,./TAGS,tags,TAGS
setlocal termwinkey=
setlocal termwinscroll=10000
setlocal termwinsize=
setlocal textwidth=0
setlocal thesaurus=
setlocal noundofile
setlocal undolevels=-123456
setlocal varsofttabstop=
setlocal vartabstop=
setlocal wincolor=
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
silent! normal! zE
let s:l = 21 - ((4 * winheight(0) + 18) / 37)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
21
normal! 0
wincmd w
2wincmd w
exe 'vert 1resize ' . ((&columns * 82 + 86) / 173)
exe 'vert 2resize ' . ((&columns * 90 + 86) / 173)
tabnext
edit bochsrc
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
argglobal
setlocal keymap=
setlocal noarabic
setlocal noautoindent
setlocal backupcopy=
setlocal balloonexpr=
setlocal nobinary
setlocal nobreakindent
setlocal breakindentopt=
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal nocindent
setlocal cinkeys=0{,0},0),0],:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
setlocal colorcolumn=
setlocal comments=:#
setlocal commentstring=#\ %s
setlocal complete=.,w,b,u,t,i
setlocal concealcursor=
setlocal conceallevel=0
setlocal completefunc=
setlocal nocopyindent
setlocal cryptmethod=
setlocal nocursorbind
setlocal nocursorcolumn
setlocal nocursorline
setlocal cursorlineopt=both
setlocal define=
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal expandtab
if &filetype != 'conf'
setlocal filetype=conf
endif
setlocal fixendofline
setlocal foldcolumn=0
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=croql
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal formatprg=
setlocal grepprg=
setlocal iminsert=0
setlocal imsearch=-1
setlocal include=
setlocal includeexpr=
setlocal indentexpr=
setlocal indentkeys=0{,0},0),0],:,0#,!^F,o,O,e
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255
setlocal keywordprg=
setlocal nolinebreak
setlocal nolisp
setlocal lispwords=
setlocal nolist
setlocal makeencoding=
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=bin,octal,hex
set number
setlocal number
setlocal numberwidth=4
setlocal omnifunc=
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
set relativenumber
setlocal relativenumber
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal scrolloff=-1
setlocal shiftwidth=4
setlocal noshortname
setlocal sidescrolloff=-1
setlocal signcolumn=auto
setlocal nosmartindent
setlocal softtabstop=-1
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=
setlocal suffixesadd=
setlocal swapfile
setlocal synmaxcol=3000
if &syntax != 'conf'
setlocal syntax=conf
endif
setlocal tabstop=8
setlocal tagcase=
setlocal tagfunc=
setlocal tags=~/.cache/tags/home-melrose-Workspace-C++-system-.tags,./tags,./TAGS,tags,TAGS
setlocal termwinkey=
setlocal termwinscroll=10000
setlocal termwinsize=
setlocal textwidth=0
setlocal thesaurus=
setlocal noundofile
setlocal undolevels=-123456
setlocal varsofttabstop=
setlocal vartabstop=
setlocal wincolor=
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
silent! normal! zE
let s:l = 40 - ((27 * winheight(0) + 18) / 37)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
40
normal! 022|
tabnext 1
set stal=1
badd +5 loader.asm
badd +6 makefile
badd +23 boot.asm
badd +0 bochsrc
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 shortmess=filnxtToOSc
set winminheight=1 winminwidth=1
let s:sx = expand("<sfile>:p:r")."x.vim"
if file_readable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &so = s:so_save | let &siso = s:siso_save
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
