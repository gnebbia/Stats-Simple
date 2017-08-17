let SessionLoad = 1
if &cp | set nocp | endif
let s:cpo_save=&cpo
set cpo&vim
noremap! <Right> 
noremap! <Left> 
noremap! <Down> 
noremap! <Up> 
nnoremap 	 :bnext
map  <Plug>(ctrlp)
map K <Plug>(perldoc)
xmap S <Plug>VSurround
nmap cS <Plug>CSurround
nmap cs <Plug>Csurround
nmap ds <Plug>Dsurround
vmap gx <Plug>NetrwBrowseXVis
nmap gx <Plug>NetrwBrowseX
xmap gS <Plug>VgSurround
nnoremap gb :ls:b
nmap ySS <Plug>YSsurround
nmap ySs <Plug>YSsurround
nmap yss <Plug>Yssurround
nmap yS <Plug>YSurround
nmap ys <Plug>Ysurround
nnoremap <silent> <Plug>(perldoc) :Perldoc
vnoremap <silent> <Plug>NetrwBrowseXVis :call netrw#BrowseXVis()
nnoremap <silent> <Plug>NetrwBrowseX :call netrw#BrowseX(expand((exists("g:netrw_gx")? g:netrw_gx : '<cfile>')),netrw#CheckIfRemote())
nnoremap <silent> <Plug>SurroundRepeat .
nnoremap <silent> <Plug>(ctrlp) :CtrlP
nnoremap <F6> :!make run
nnoremap <F5> :!make prove
nnoremap <S-Tab> :bprevious
noremap <Right> ""
noremap <Left> ""
noremap <Down> ""
noremap <Up> ""
imap S <Plug>ISurround
imap s <Plug>Isurround
imap  <Plug>Isurround
let &cpo=s:cpo_save
unlet s:cpo_save
set autoindent
set background=dark
set backspace=indent,eol,start
set backup
set backupdir=~/.vim/files/backup/
set backupext=-vimbackup
set backupskip=
set directory=~/.vim/files/swap//
set display=lastline
set expandtab
set fileencodings=ucs-bom,utf-8,default,latin1
set foldlevelstart=1
set helplang=en
set hidden
set hlsearch
set incsearch
set isfname=@,48-57,/,.,-,_,+,,,#,$,%,~,=,:
set iskeyword=@,48-57,_,192-255,:
set laststatus=2
set lazyredraw
set listchars=tab:▸\ ,extends:❯,precedes:❮,nbsp:±
set printoptions=paper:letter
set report=0
set ruler
set runtimepath=~/.vim,~/.vim/bundle/ctrlp.vim,~/.vim/bundle/perl-support,~/.vim/bundle/perldoc-vim,~/.vim/bundle/tabular,~/.vim/bundle/trackperlvars,~/.vim/bundle/vim-airline,~/.vim/bundle/vim-airline-themes,~/.vim/bundle/vim-octave,~/.vim/bundle/vim-ruby,~/.vim/bundle/vim-surround,/var/lib/vim/addons,/usr/share/vim/vimfiles,/usr/share/vim/vim80,/usr/share/vim/vimfiles/after,/var/lib/vim/addons/after,~/.vim/bundle/tabular/after,~/.vim/after
set shiftround
set shiftwidth=4
set showcmd
set showtabline=2
set softtabstop=4
set splitbelow
set splitright
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc
set synmaxcol=200
set tabline=%!airline#extensions#tabline#get()
set textwidth=79
set undodir=~/.vim/files/undo/
set undofile
set updatecount=100
set viminfo='100,n$HOME/.vim/files/info/viminfo
set wildmenu
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/Stats-Simple
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +1 lib/Stats/Simple.pm
badd +1 t/01-basic.t
argglobal
silent! argdel *
argadd lib/Stats/Simple.pm
edit t/01-basic.t
set splitbelow splitright
wincmd t
set winheight=1 winwidth=1
argglobal
let s:cpo_save=&cpo
set cpo&vim
inoremap <buffer> <silent> <F9> :call Perl_Debugger()
nnoremap <buffer> <silent>  :call mmtemplates#core#DeleteOptTag('\[-\w*-]\|\[+\w*+]',',',"n")
nnoremap <buffer> <silent> <NL> i=Perl_JumpCtrlJ()
nmap <buffer> <silent> * :let @/ = TPV_locate_perl_var()
vnoremap <buffer> <silent> \rh :call Perl_Hardcopy("v")
vnoremap <buffer> <silent> \ry :call Perl_Perltidy("v")
vnoremap <buffer> <silent> \nts :call mmtemplates#core#ChooseStyle(g:Perl_Templates,"!pick")
nnoremap <buffer> <silent> \nts :call mmtemplates#core#ChooseStyle(g:Perl_Templates,"!pick")
vnoremap <buffer> <silent> \ntw :call mmtemplates#wizard#SetupWizard(g:Perl_Templates)
nnoremap <buffer> <silent> \ntw :call mmtemplates#wizard#SetupWizard(g:Perl_Templates)
vnoremap <buffer> <silent> \ntr :call mmtemplates#core#ReadTemplates(g:Perl_Templates,"reload","all")
nnoremap <buffer> <silent> \ntr :call mmtemplates#core#ReadTemplates(g:Perl_Templates,"reload","all")
vnoremap <buffer> <silent> \ntc :call mmtemplates#core#EditTemplateFiles(g:Perl_Templates,2)
nnoremap <buffer> <silent> \ntc :call mmtemplates#core#EditTemplateFiles(g:Perl_Templates,2)
vnoremap <buffer> <silent> \ntp :call mmtemplates#core#EditTemplateFiles(g:Perl_Templates,1)
nnoremap <buffer> <silent> \ntp :call mmtemplates#core#EditTemplateFiles(g:Perl_Templates,1)
vnoremap <buffer> <silent> \ntl :call mmtemplates#core#EditTemplateFiles(g:Perl_Templates,0)
nnoremap <buffer> <silent> \ntl :call mmtemplates#core#EditTemplateFiles(g:Perl_Templates,0)
vnoremap <buffer> <silent> \he :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Help.English")
nnoremap <buffer> <silent> \he :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Help.English")
vnoremap <buffer> <silent> \ft :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"File Tests")
nnoremap <buffer> <silent> \ft :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"File Tests")
vnoremap <buffer> <silent> \nxs :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Snippets.regex")
nnoremap <buffer> <silent> \nxs :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Snippets.regex")
vnoremap <buffer> <silent> \njt :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Snippets.jump tags")
nnoremap <buffer> <silent> \njt :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Snippets.jump tags")
vnoremap <buffer> <silent> \pm :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"POD.markup sequences","v")
nnoremap <buffer> <silent> \pm :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"POD.markup sequences")
vnoremap <buffer> <silent> \pi :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"POD.item")
nnoremap <buffer> <silent> \pi :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"POD.item")
vnoremap <buffer> <silent> \pob :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"POD.over, back","v")
nnoremap <buffer> <silent> \pob :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"POD.over, back")
vnoremap <buffer> <silent> \ph3 :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"POD.head3")
nnoremap <buffer> <silent> \ph3 :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"POD.head3")
vnoremap <buffer> <silent> \ph2 :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"POD.head2")
nnoremap <buffer> <silent> \ph2 :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"POD.head2")
vnoremap <buffer> <silent> \ph1 :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"POD.head1")
nnoremap <buffer> <silent> \ph1 :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"POD.head1")
vnoremap <buffer> <silent> \pbt :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"POD.begin text, end","v")
nnoremap <buffer> <silent> \pbt :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"POD.begin text, end")
vnoremap <buffer> <silent> \pbm :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"POD.begin man, end","v")
nnoremap <buffer> <silent> \pbm :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"POD.begin man, end")
vnoremap <buffer> <silent> \pbh :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"POD.begin html, end","v")
nnoremap <buffer> <silent> \pbh :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"POD.begin html, end")
vnoremap <buffer> <silent> \pfc :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"POD.for, cut","v")
nnoremap <buffer> <silent> \pfc :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"POD.for, cut")
vnoremap <buffer> <silent> \ppc :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"POD.pod, cut","v")
nnoremap <buffer> <silent> \ppc :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"POD.pod, cut")
vnoremap <buffer> <silent> \xms :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.metasymbols","v")
nnoremap <buffer> <silent> \xms :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.metasymbols")
vnoremap <buffer> <silent> \xex :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.extended Regex","v")
nnoremap <buffer> <silent> \xex :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.extended Regex")
vnoremap <buffer> <silent> \xup :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.Unicode Property")
nnoremap <buffer> <silent> \xup :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.Unicode Property")
vnoremap <buffer> <silent> \xpc :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.POSIX classes")
nnoremap <buffer> <silent> \xpc :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.POSIX classes")
vnoremap <buffer> <silent> \vue :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.use English")
nnoremap <buffer> <silent> \vue :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.use English")
vnoremap <buffer> <silent> \vps :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.POSIX signals")
nnoremap <buffer> <silent> \vps :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.POSIX signals")
vnoremap <buffer> <silent> \vr :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.regexp")
nnoremap <buffer> <silent> \vr :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.regexp")
vnoremap <buffer> <silent> \vio :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.IO")
nnoremap <buffer> <silent> \vio :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.IO")
vnoremap <buffer> <silent> \vid :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.IDs")
nnoremap <buffer> <silent> \vid :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.IDs")
vnoremap <buffer> <silent> \vf :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.filehandle")
nnoremap <buffer> <silent> \vf :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.filehandle")
vnoremap <buffer> <silent> \ve :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.errors")
nnoremap <buffer> <silent> \ve :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.errors")
vnoremap <buffer> <silent> \vb :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.basics")
nnoremap <buffer> <silent> \vb :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.basics")
vnoremap <buffer> <silent> \ise :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.STDERR")
nnoremap <buffer> <silent> \ise :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.STDERR")
vnoremap <buffer> <silent> \iso :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.STDOUT")
nnoremap <buffer> <silent> \iso :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.STDOUT")
vnoremap <buffer> <silent> \isi :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.STDIN")
nnoremap <buffer> <silent> \isi :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.STDIN")
vnoremap <buffer> <silent> \ipi :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open pipe","v")
nnoremap <buffer> <silent> \ipi :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open pipe")
vnoremap <buffer> <silent> \io :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open output file","v")
nnoremap <buffer> <silent> \io :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open output file")
vnoremap <buffer> <silent> \ii :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open input file","v")
nnoremap <buffer> <silent> \ii :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open input file")
vnoremap <buffer> <silent> \ip :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.print")
nnoremap <buffer> <silent> \ip :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.print")
vnoremap <buffer> <silent> \isu :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.subroutine","v")
nnoremap <buffer> <silent> \isu :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.subroutine")
vnoremap <buffer> <silent> \it :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.translate")
nnoremap <buffer> <silent> \it :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.translate")
vnoremap <buffer> <silent> \is :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.substitute")
nnoremap <buffer> <silent> \is :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.substitute")
vnoremap <buffer> <silent> \im :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.match")
nnoremap <buffer> <silent> \im :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.match")
vnoremap <buffer> <silent> \ir :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.regex")
nnoremap <buffer> <silent> \ir :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.regex")
vnoremap <buffer> <silent> \iha :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.hash+assignment")
nnoremap <buffer> <silent> \iha :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.hash+assignment")
vnoremap <buffer> <silent> \ih :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.hash")
nnoremap <buffer> <silent> \ih :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.hash")
vnoremap <buffer> <silent> \iaa :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.array+assignment")
nnoremap <buffer> <silent> \iaa :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.array+assignment")
vnoremap <buffer> <silent> \ia :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.array")
nnoremap <buffer> <silent> \ia :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.array")
vnoremap <buffer> <silent> \idd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar_list")
nnoremap <buffer> <silent> \idd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar_list")
vnoremap <buffer> <silent> \ida :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar+assignment")
nnoremap <buffer> <silent> \ida :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar+assignment")
vnoremap <buffer> <silent> \id :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar")
nnoremap <buffer> <silent> \id :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar")
vnoremap <buffer> <silent> \swh :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.when")
nnoremap <buffer> <silent> \swh :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.when")
vnoremap <buffer> <silent> \sg :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.given")
nnoremap <buffer> <silent> \sg :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.given")
vnoremap <buffer> <silent> \sw :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.while","v")
nnoremap <buffer> <silent> \sw :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.while")
vnoremap <buffer> <silent> \st :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.until","v")
nnoremap <buffer> <silent> \st :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.until")
vnoremap <buffer> <silent> \sue :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.unless-else","v")
nnoremap <buffer> <silent> \sue :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.unless-else")
vnoremap <buffer> <silent> \su :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.unless","v")
nnoremap <buffer> <silent> \su :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.unless")
vnoremap <buffer> <silent> \sie :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.if-else","v")
nnoremap <buffer> <silent> \sie :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.if-else")
vnoremap <buffer> <silent> \sei :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.elsif","v")
nnoremap <buffer> <silent> \sei :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.elsif")
vnoremap <buffer> <silent> \se :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.else","v")
nnoremap <buffer> <silent> \se :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.else")
vnoremap <buffer> <silent> \si :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.if","v")
nnoremap <buffer> <silent> \si :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.if")
vnoremap <buffer> <silent> \sfe :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.foreach","v")
nnoremap <buffer> <silent> \sfe :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.foreach")
vnoremap <buffer> <silent> \sf :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.for","v")
nnoremap <buffer> <silent> \sf :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.for")
vnoremap <buffer> <silent> \sd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.do-while","v")
nnoremap <buffer> <silent> \sd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.do-while")
vnoremap <buffer> <silent> \cma :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.macros")
nnoremap <buffer> <silent> \cma :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.macros")
vnoremap <buffer> <silent> \ck :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.keyword comments")
nnoremap <buffer> <silent> \ck :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.keyword comments")
vnoremap <buffer> <silent> \ct :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.date+time")
nnoremap <buffer> <silent> \ct :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.date+time")
vnoremap <buffer> <silent> \cd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.date")
nnoremap <buffer> <silent> \cd :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.date")
vnoremap <buffer> <silent> \chpo :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pod")
nnoremap <buffer> <silent> \chpo :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pod")
vnoremap <buffer> <silent> \cht :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description t")
nnoremap <buffer> <silent> \cht :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description t")
vnoremap <buffer> <silent> \chpm :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pm")
nnoremap <buffer> <silent> \chpm :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pm")
vnoremap <buffer> <silent> \chpl :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pl")
nnoremap <buffer> <silent> \chpl :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pl")
vnoremap <buffer> <silent> \cme :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.method")
nnoremap <buffer> <silent> \cme :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.method")
vnoremap <buffer> <silent> \cfu :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.function")
nnoremap <buffer> <silent> \cfu :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.function")
vnoremap <buffer> <silent> \cfr :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.frame")
nnoremap <buffer> <silent> \cfr :call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.frame")
noremap <buffer> <silent> \rpco :call Perl_PerlcriticOptionsInput()
noremap <buffer> <silent> \rpcv :call Perl_PerlcriticVerbosityInput()
noremap <buffer> <silent> \rpcs :call Perl_PerlcriticSeverityInput()
noremap <buffer> <silent> \ro :call Perl_Toggle_Gvim_Xterm()
noremap <buffer> <silent> \rk :call Perl_Settings(0)
nnoremap <buffer> <silent> \rh :call Perl_Hardcopy("n")
onoremap <buffer> <silent> \rh :call Perl_Hardcopy("n")
noremap <buffer> <silent> \rt :call Perl_SaveWithTimestamp()
noremap <buffer> <silent> \rpc :call Perl_Perlcritic()
nnoremap <buffer> <silent> \ry :call Perl_Perltidy("n")
onoremap <buffer> <silent> \ry :call Perl_Perltidy("n")
noremap <buffer> <silent> \rg :call Perl_perldoc_generate_module_list()
noremap <buffer> <silent> \ri :call Perl_perldoc_show_module_list()
noremap <buffer> <silent> \re :call Perl_MakeScriptExecutable()
noremap <buffer> <silent> \rd :call Perl_Debugger()
noremap <buffer> \rw :PerlSwitches 
noremap <buffer> \ra :PerlScriptArguments 
noremap <buffer> <silent> \rs :call Perl_SyntaxCheck()
noremap <buffer> <silent> \rr :call Perl_Run()
nnoremap <buffer> <silent> \rpnh :call perlsupportprofiling#Perl_NYTprofReadHtml()
nnoremap <buffer> <silent> \rpns :call perlsupportprofiling#Perl_NYTProfSortInput()
nnoremap <buffer> <silent> \rpnc :call perlsupportprofiling#Perl_NYTprofReadCSV("read","line")
nnoremap <buffer> <silent> \rpn :call perlsupportprofiling#Perl_NYTprof()
nnoremap <buffer> <silent> \rpfs :call perlsupportprofiling#Perl_FastProfSortInput()
nnoremap <buffer> <silent> \rpf :call perlsupportprofiling#Perl_Fastprof()
nnoremap <buffer> <silent> \rpss :call perlsupportprofiling#Perl_SmallProfSortInput()
nnoremap <buffer> <silent> \rps :call perlsupportprofiling#Perl_Smallprof()
nnoremap <buffer> <silent> \podt :call Perl_POD('text')
nnoremap <buffer> <silent> \podm :call Perl_POD('man')
nnoremap <buffer> <silent> \podh :call Perl_POD('html')
nnoremap <buffer> <silent> \pod :call Perl_PodCheck()
vnoremap <buffer> <silent> \xe :call perlsupportregex#Perl_RegexExplain( "v" )
nnoremap <buffer> <silent> \xe :call perlsupportregex#Perl_RegexExplain( "n" )
nnoremap <buffer> <silent> \xmm :call perlsupportregex#Perl_RegexMatchSeveral( )
nnoremap <buffer> <silent> \xm :call perlsupportregex#Perl_RegexVisualize( )
vnoremap <buffer> <silent> \xf :call perlsupportregex#Perl_RegexPickFlag( "v" )'>j
vnoremap <buffer> <silent> \xs :call perlsupportregex#Perl_RegexPick( "String", "v" )'>j
vnoremap <buffer> <silent> \xr :call perlsupportregex#Perl_RegexPick( "Regexp", "v" )'>j
nnoremap <buffer> <silent> \xf :call perlsupportregex#Perl_RegexPickFlag( "n" )
nnoremap <buffer> <silent> \xs :call perlsupportregex#Perl_RegexPick( "String", "n" )j
nnoremap <buffer> <silent> \xr :call perlsupportregex#Perl_RegexPick( "Regexp", "n" )j
nnoremap <buffer> <silent> \nv :call Perl_CodeSnippet("view")
nnoremap <buffer> <silent> \ne :call Perl_CodeSnippet("edit")
vnoremap <buffer> <silent> \nw :call Perl_CodeSnippet("writemarked")
nnoremap <buffer> <silent> \nw :call Perl_CodeSnippet("write")
nnoremap <buffer> <silent> \nr :call Perl_CodeSnippet("read")
nnoremap <buffer> <silent> \cub :call Perl_UncommentBlock()
vnoremap <buffer> <silent> \cb :call Perl_CommentBlock("v")
nnoremap <buffer> <silent> \cb :call Perl_CommentBlock("a")
vnoremap <buffer> <silent> \cc :call Perl_CommentToggle()j
nnoremap <buffer> <silent> \cc :call Perl_CommentToggle()j
nnoremap <buffer> <silent> \cs :call Perl_GetLineEndCommCol()
vnoremap <buffer> <silent> \cj :call Perl_AlignLineEndComm()
nnoremap <buffer> <silent> \cj :call Perl_AlignLineEndComm()
noremap <buffer> <silent> \cl :call Perl_EndOfLineComment()
noremap <buffer> <silent> \hp :call Perl_HelpPerlsupport()
noremap <buffer> <silent> \h :call Perl_perldoc()
noremap <buffer> \rcm :MakeFile 
noremap <buffer> \rma :MakeCmdlineArgs 
noremap <buffer> <silent> \rmc :Make clean
noremap <buffer> <silent> \rm :Make
vmap <buffer> cv :call TPV_rename_perl_var('visual')gv
nmap <buffer> cv :call TPV_rename_perl_var('normal')
nmap <buffer> <silent> gd :let @/ = TPV_locate_perl_var_decl()
nmap <buffer> <silent> tt :let b:track_perl_var_locked = ! b:track_perl_var_locked:call TPV_track_perl_var()
vnoremap <buffer> { s{}kp=iB
noremap <buffer> <silent> <F9> :call Perl_Debugger()
inoremap <buffer> <silent>  u:call mmtemplates#core#DeleteOptTag('\[-\w*-]\|\[+\w*+]',',',"i")gi
inoremap <buffer> <silent> <NL> u=Perl_JumpCtrlJ()
inoremap <buffer> <silent> \nts :call mmtemplates#core#ChooseStyle(g:Perl_Templates,"!pick")
inoremap <buffer> <silent> \ntw :call mmtemplates#wizard#SetupWizard(g:Perl_Templates)
inoremap <buffer> <silent> \ntr :call mmtemplates#core#ReadTemplates(g:Perl_Templates,"reload","all")
inoremap <buffer> <silent> \ntc :call mmtemplates#core#EditTemplateFiles(g:Perl_Templates,2)
inoremap <buffer> <silent> \ntp :call mmtemplates#core#EditTemplateFiles(g:Perl_Templates,1)
inoremap <buffer> <silent> \ntl :call mmtemplates#core#EditTemplateFiles(g:Perl_Templates,0)
inoremap <buffer> <silent> \he u:call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Help.English","i")
inoremap <buffer> <silent> \ft u:call mmtemplates#core#InsertTemplate(g:Perl_Templates,"File Tests","i")
inoremap <buffer> <silent> \nxs u:call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Snippets.regex","i")
inoremap <buffer> <silent> \njt u:call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Snippets.jump tags","i")
inoremap <buffer> <silent> \pm u:call mmtemplates#core#InsertTemplate(g:Perl_Templates,"POD.markup sequences","i")
inoremap <buffer> <silent> \pi u:call mmtemplates#core#InsertTemplate(g:Perl_Templates,"POD.item","i")
inoremap <buffer> <silent> \pob u:call mmtemplates#core#InsertTemplate(g:Perl_Templates,"POD.over, back","i")
inoremap <buffer> <silent> \ph3 u:call mmtemplates#core#InsertTemplate(g:Perl_Templates,"POD.head3","i")
inoremap <buffer> <silent> \ph2 u:call mmtemplates#core#InsertTemplate(g:Perl_Templates,"POD.head2","i")
inoremap <buffer> <silent> \ph1 u:call mmtemplates#core#InsertTemplate(g:Perl_Templates,"POD.head1","i")
inoremap <buffer> <silent> \pbt u:call mmtemplates#core#InsertTemplate(g:Perl_Templates,"POD.begin text, end","i")
inoremap <buffer> <silent> \pbm u:call mmtemplates#core#InsertTemplate(g:Perl_Templates,"POD.begin man, end","i")
inoremap <buffer> <silent> \pbh u:call mmtemplates#core#InsertTemplate(g:Perl_Templates,"POD.begin html, end","i")
inoremap <buffer> <silent> \pfc u:call mmtemplates#core#InsertTemplate(g:Perl_Templates,"POD.for, cut","i")
inoremap <buffer> <silent> \ppc u:call mmtemplates#core#InsertTemplate(g:Perl_Templates,"POD.pod, cut","i")
inoremap <buffer> <silent> \xms u:call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.metasymbols","i")
inoremap <buffer> <silent> \xex u:call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.extended Regex","i")
inoremap <buffer> <silent> \xup u:call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.Unicode Property","i")
inoremap <buffer> <silent> \xpc u:call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Regex.POSIX classes","i")
inoremap <buffer> <silent> \vue u:call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.use English","i")
inoremap <buffer> <silent> \vps u:call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.POSIX signals","i")
inoremap <buffer> <silent> \vr u:call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.regexp","i")
inoremap <buffer> <silent> \vio u:call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.IO","i")
inoremap <buffer> <silent> \vid u:call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.IDs","i")
inoremap <buffer> <silent> \vf u:call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.filehandle","i")
inoremap <buffer> <silent> \ve u:call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.errors","i")
inoremap <buffer> <silent> \vb u:call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Special Variables.basics","i")
inoremap <buffer> <silent> \ise u:call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.STDERR","i")
inoremap <buffer> <silent> \iso u:call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.STDOUT","i")
inoremap <buffer> <silent> \isi u:call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.STDIN","i")
inoremap <buffer> <silent> \ipi u:call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open pipe","i")
inoremap <buffer> <silent> \io u:call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open output file","i")
inoremap <buffer> <silent> \ii u:call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.open input file","i")
inoremap <buffer> <silent> \ip u:call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.print","i")
inoremap <buffer> <silent> \isu u:call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.subroutine","i")
inoremap <buffer> <silent> \it u:call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.translate","i")
inoremap <buffer> <silent> \is u:call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.substitute","i")
inoremap <buffer> <silent> \im u:call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.match","i")
inoremap <buffer> <silent> \ir u:call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.regex","i")
inoremap <buffer> <silent> \iha u:call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.hash+assignment","i")
inoremap <buffer> <silent> \ih u:call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.hash","i")
inoremap <buffer> <silent> \iaa u:call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.array+assignment","i")
inoremap <buffer> <silent> \ia u:call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.array","i")
inoremap <buffer> <silent> \idd u:call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar_list","i")
inoremap <buffer> <silent> \ida u:call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar+assignment","i")
inoremap <buffer> <silent> \id u:call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Idioms.scalar","i")
inoremap <buffer> <silent> \swh u:call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.when","i")
inoremap <buffer> <silent> \sg u:call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.given","i")
inoremap <buffer> <silent> \sw u:call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.while","i")
inoremap <buffer> <silent> \st u:call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.until","i")
inoremap <buffer> <silent> \sue u:call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.unless-else","i")
inoremap <buffer> <silent> \su u:call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.unless","i")
inoremap <buffer> <silent> \sie u:call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.if-else","i")
inoremap <buffer> <silent> \sei u:call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.elsif","i")
inoremap <buffer> <silent> \se u:call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.else","i")
inoremap <buffer> <silent> \si u:call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.if","i")
inoremap <buffer> <silent> \sfe u:call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.foreach","i")
inoremap <buffer> <silent> \sf u:call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.for","i")
inoremap <buffer> <silent> \sd u:call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Statements.do-while","i")
inoremap <buffer> <silent> \cma u:call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.macros","i")
inoremap <buffer> <silent> \ck u:call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.keyword comments","i")
inoremap <buffer> <silent> \ct u:call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.date+time","i")
inoremap <buffer> <silent> \cd u:call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.date","i")
inoremap <buffer> <silent> \chpo u:call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pod","i")
inoremap <buffer> <silent> \cht u:call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description t","i")
inoremap <buffer> <silent> \chpm u:call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pm","i")
inoremap <buffer> <silent> \chpl u:call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.file description pl","i")
inoremap <buffer> <silent> \cme u:call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.method","i")
inoremap <buffer> <silent> \cfu u:call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.function","i")
inoremap <buffer> <silent> \cfr u:call mmtemplates#core#InsertTemplate(g:Perl_Templates,"Comments.frame","i")
inoremap <buffer> <silent> \ro :call Perl_Toggle_Gvim_Xterm()
inoremap <buffer> <silent> \rk :call Perl_Settings(0)
inoremap <buffer> <silent> \rh :call Perl_Hardcopy("n")
inoremap <buffer> <silent> \rt :call Perl_SaveWithTimestamp()
inoremap <buffer> <silent> \rpc :call Perl_Perlcritic()
inoremap <buffer> <silent> \ry :call Perl_Perltidy("n")
inoremap <buffer> <silent> \rg :call Perl_perldoc_generate_module_list()
inoremap <buffer> <silent> \ri :call Perl_perldoc_show_module_list()
inoremap <buffer> <silent> \re :call Perl_MakeScriptExecutable()
inoremap <buffer> \rw :PerlSwitches 
inoremap <buffer> \ra :PerlScriptArguments 
inoremap <buffer> <silent> \rs :call Perl_SyntaxCheck()
inoremap <buffer> <silent> \rr :call Perl_Run()
inoremap <buffer> <silent> \rpnh :call perlsupportprofiling#Perl_NYTprofReadHtml()
inoremap <buffer> <silent> \rpns :call perlsupportprofiling#Perl_NYTProfSortInput()
inoremap <buffer> <silent> \rpnc :call perlsupportprofiling#Perl_NYTprofReadCSV("read","line")
inoremap <buffer> <silent> \rpn :call perlsupportprofiling#Perl_NYTprof()
inoremap <buffer> <silent> \rpfs :call perlsupportprofiling#Perl_FastProfSortInput()
inoremap <buffer> <silent> \rpf :call perlsupportprofiling#Perl_Fastprof()
inoremap <buffer> <silent> \rpss :call perlsupportprofiling#Perl_SmallProfSortInput()
inoremap <buffer> <silent> \rps :call perlsupportprofiling#Perl_Smallprof()
inoremap <buffer> <silent> \podt :call Perl_POD('text')
inoremap <buffer> <silent> \podm :call Perl_POD('man')
inoremap <buffer> <silent> \podh :call Perl_POD('html')
inoremap <buffer> <silent> \pod :call Perl_PodCheck()
inoremap <buffer> <silent> \nv :call Perl_CodeSnippet("view")
inoremap <buffer> <silent> \ne :call Perl_CodeSnippet("edit")
inoremap <buffer> <silent> \nw :call Perl_CodeSnippet("write")
inoremap <buffer> <silent> \nr :call Perl_CodeSnippet("read")
inoremap <buffer> <silent> \cb :call Perl_CommentBlock("a")
inoremap <buffer> <silent> \cj :call Perl_AlignLineEndComm()
inoremap <buffer> <silent> \cl :call Perl_EndOfLineComment()
inoremap <buffer> <silent> \hp :call Perl_HelpPerlsupport()
inoremap <buffer> <silent> \h :call Perl_perldoc()
inoremap <buffer> \rcm :MakeFile 
inoremap <buffer> \rma :MakeCmdlineArgs 
inoremap <buffer> <silent> \rmc :Make clean
inoremap <buffer> <silent> \rm :Make
inoremap <buffer> { {}O
let &cpo=s:cpo_save
unlet s:cpo_save
setlocal keymap=
setlocal noarabic
setlocal autoindent
setlocal backupcopy=
setlocal balloonexpr=
setlocal nobinary
setlocal nobreakindent
setlocal breakindentopt=
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal nocindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
setlocal colorcolumn=
setlocal comments=:#
setlocal commentstring=#%s
setlocal complete=.,w,b,u,t,i
setlocal concealcursor=
setlocal conceallevel=0
setlocal completefunc=
setlocal nocopyindent
setlocal cryptmethod=
setlocal nocursorbind
setlocal nocursorcolumn
set cursorline
setlocal cursorline
setlocal define=[^A-Za-z_]
setlocal dictionary=~/.vim/bundle/perl-support/perl-support/wordlists/perl.list
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal expandtab
if &filetype != 'perl'
setlocal filetype=perl
endif
setlocal fixendofline
setlocal foldcolumn=0
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=1
setlocal foldmarker={{{,}}}
setlocal foldmethod=syntax
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=crqol
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal formatprg=
setlocal grepprg=
setlocal iminsert=2
setlocal imsearch=2
setlocal include=\\<\\(use\\|require\\)\\>
setlocal includeexpr=substitute(substitute(substitute(v:fname,'::','/','g'),'->*','',''),'$','.pm','')
setlocal indentexpr=GetPerlIndent()
setlocal indentkeys=0{,0},:,0#,!^F,o,O,e,0=,0),0],0=or,0=and
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255,:,$,%,@-@
setlocal keywordprg=perldoc\ -f
setlocal nolinebreak
setlocal nolisp
setlocal lispwords=
set list
setlocal list
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=bin,octal,hex
setlocal nonumber
setlocal numberwidth=4
setlocal omnifunc=
setlocal path=.,/usr/include,,,~/perl5/perlbrew/perls/perl-5.22.2/lib/site_perl/5.22.2/x86_64-linux,~/perl5/perlbrew/perls/perl-5.22.2/lib/site_perl/5.22.2,~/perl5/perlbrew/perls/perl-5.22.2/lib/5.22.2/x86_64-linux,~/perl5/perlbrew/perls/perl-5.22.2/lib/5.22.2,,
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norelativenumber
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal shiftwidth=4
setlocal noshortname
setlocal signcolumn=auto
setlocal nosmartindent
setlocal softtabstop=4
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=%!airline#statusline(1)
setlocal suffixesadd=
setlocal swapfile
setlocal synmaxcol=200
if &syntax != 'perl'
setlocal syntax=perl
endif
setlocal tabstop=4
setlocal tagcase=
setlocal tags=
setlocal textwidth=79
setlocal thesaurus=
setlocal undofile
setlocal undolevels=-123456
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
let s:l = 1 - ((0 * winheight(0) + 17) / 34)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
tabnext 1
if exists('s:wipebuf')
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 shortmess=filnxtToO
let s:sx = expand("<sfile>:p:r")."x.vim"
if file_readable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &so = s:so_save | let &siso = s:siso_save
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
