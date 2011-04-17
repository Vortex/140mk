let SessionLoad = 1
if &cp | set nocp | endif
let s:cpo_save=&cpo
set cpo&vim
inoremap <Plug>ZenCodingAnchorizeSummary :call zencoding#anchorizeURL(1)a
inoremap <Plug>ZenCodingAnchorizeURL :call zencoding#anchorizeURL(0)a
inoremap <Plug>ZenCodingRemoveTag :call zencoding#removeTag()a
inoremap <Plug>ZenCodingSplitJoinTagInsert :call zencoding#splitJoinTag()a
inoremap <Plug>ZenCodingToggleComment :call zencoding#toggleComment()a
inoremap <Plug>ZenCodingImageSize :call zencoding#imageSize()a
inoremap <Plug>ZenCodingPrev :call zencoding#moveNextPrev(1)
inoremap <Plug>ZenCodingNext :call zencoding#moveNextPrev(0)
inoremap <Plug>ZenCodingBalanceTagOutwardInsert :call zencoding#balanceTag(-1)a
inoremap <Plug>ZenCodingBalanceTagInwardInsert :call zencoding#balanceTag(1)a
inoremap <Plug>ZenCodingExpandWord u:call zencoding#expandAbbr(1)a
inoremap <Plug>ZenCodingExpandAbbr u:call zencoding#expandAbbr(0)a
inoremap <silent> <S-Tab> =BackwardsSnippet()
inoremap <C-Tab> 	
inoremap <silent> <Plug>ragtagXmlV ="&#".getchar().";"
inoremap <silent> <Plug>NERDCommenterInInsert  <BS>:call NERDComment(0, "insert")
inoremap <Plug>ClojureReplDownHistory :call b:vimclojure_repl.downHistory()
inoremap <Plug>ClojureReplUpHistory :call b:vimclojure_repl.upHistory()
inoremap <Plug>ClojureReplEnterHook :call b:vimclojure_repl.enterHook()
map! <S-Insert> <MiddleMouse>
nnoremap <silent>  :call FindInNERDTree()
map  h
snoremap <silent> 	 i<Right>=TriggerSnippet()
nmap 	 gt
map <NL> j
map  k
map  l
nmap  :w
snoremap  b<BS>
nmap A <Plug>ZenCodingAnchorizeSummary
nmap a <Plug>ZenCodingAnchorizeURL
nmap k <Plug>ZenCodingRemoveTag
nmap j <Plug>ZenCodingSplitJoinTagNormal
nmap / <Plug>ZenCodingToggleComment
nmap i <Plug>ZenCodingImageSize
nmap N <Plug>ZenCodingPrev
nmap n <Plug>ZenCodingNext
vmap D <Plug>ZenCodingBalanceTagOutwardVisual
nmap D <Plug>ZenCodingBalanceTagOutwardNormal
vmap d <Plug>ZenCodingBalanceTagInwardVisual
nmap d <Plug>ZenCodingBalanceTagInwardNormal
nmap ; <Plug>ZenCodingExpandWord
nmap , <Plug>ZenCodingExpandNormal
vmap , <Plug>ZenCodingExpandVisual
snoremap % b<BS>%
snoremap ' b<BS>'
xmap <silent> ,e <Plug>CamelCaseMotion_e
xmap <silent> ,b <Plug>CamelCaseMotion_b
xmap <silent> ,w <Plug>CamelCaseMotion_w
omap <silent> ,e <Plug>CamelCaseMotion_e
omap <silent> ,b <Plug>CamelCaseMotion_b
omap <silent> ,w <Plug>CamelCaseMotion_w
nmap <silent> ,e <Plug>CamelCaseMotion_e
nmap <silent> ,b <Plug>CamelCaseMotion_b
nmap <silent> ,w <Plug>CamelCaseMotion_w
vmap <D-]> >gv
vmap <D-[> <gv
nmap <D-]> >>
nmap <D-[> <<
nmap <D-0> g^
nmap <D-6> g^
nmap <D-4> g$
nmap <D-k> gk
nmap <D-j> gj
vmap <D-0> g^
vmap <D-6> g^
vmap <D-4> g$
vmap <D-k> gk
vmap <D-j> gj
inoremap ï o
noremap Q gq
xmap S <Plug>VSurround
snoremap U b<BS>U
nnoremap Y y$
nmap [xx <Plug>unimpairedLineXmlEncode
xmap [x <Plug>unimpairedXmlEncode
nmap [x <Plug>unimpairedXmlEncode
nmap [uu <Plug>unimpairedLineUrlEncode
xmap [u <Plug>unimpairedUrlEncode
nmap [u <Plug>unimpairedUrlEncode
nmap [yy <Plug>unimpairedLineStringEncode
xmap [y <Plug>unimpairedStringEncode
nmap [y <Plug>unimpairedStringEncode
xmap [e <Plug>unimpairedMoveUp
nmap [e <Plug>unimpairedMoveUp
nmap [  <Plug>unimpairedBlankUp
nmap [o <Plug>unimpairedOPrevious
nmap <silent> [Q <Plug>unimpairedQFirst
nmap <silent> [q <Plug>unimpairedQPrevious
nmap <silent> [L <Plug>unimpairedLFirst
nmap <silent> [l <Plug>unimpairedLPrevious
nmap <silent> [B <Plug>unimpairedBFirst
nmap <silent> [b <Plug>unimpairedBPrevious
nmap <silent> [A <Plug>unimpairedAFirst
nmap <silent> [a <Plug>unimpairedAPrevious
vmap [% [%m'gv``
snoremap \ b<BS>\
nmap \P :Preview
nmap \ca <Plug>NERDCommenterAltDelims
vmap \cA <Plug>NERDCommenterAppend
nmap \cA <Plug>NERDCommenterAppend
vmap \c$ <Plug>NERDCommenterToEOL
nmap \c$ <Plug>NERDCommenterToEOL
vmap \cu <Plug>NERDCommenterUncomment
nmap \cu <Plug>NERDCommenterUncomment
vmap \cn <Plug>NERDCommenterNest
nmap \cn <Plug>NERDCommenterNest
vmap \cb <Plug>NERDCommenterAlignBoth
nmap \cb <Plug>NERDCommenterAlignBoth
vmap \cl <Plug>NERDCommenterAlignLeft
nmap \cl <Plug>NERDCommenterAlignLeft
vmap \cy <Plug>NERDCommenterYank
nmap \cy <Plug>NERDCommenterYank
vmap \ci <Plug>NERDCommenterInvert
nmap \ci <Plug>NERDCommenterInvert
vmap \cs <Plug>NERDCommenterSexy
nmap \cs <Plug>NERDCommenterSexy
vmap \cm <Plug>NERDCommenterMinimal
nmap \cm <Plug>NERDCommenterMinimal
vmap \c  <Plug>NERDCommenterToggle
nmap \c  <Plug>NERDCommenterToggle
vmap \cc <Plug>NERDCommenterComment
nmap \cc <Plug>NERDCommenterComment
map <silent> \grx <Plug>GrailsDisplayTestXml
map <silent> \grv <Plug>GrailsDisplayViews
map <silent> \gru <Plug>GrailsDisplayUrlMappings
map <silent> \grt <Plug>GrailsDisplayTests
map <silent> \grs <Plug>GrailsDisplayService
map <silent> \grr <Plug>GrailsDisplayTestReports
map <silent> \grm <Plug>GrailsControllerMarks
map <silent> \grg <Plug>GrailsReadTestOutput
map <silent> \grd <Plug>GrailsDisplayDomainClass
map <silent> \grc <Plug>GrailsDisplayController
map \rwp <Plug>RestoreWinPosn
map \swp <Plug>SaveWinPosn
map \tt <Plug>AM_tt
map \tsq <Plug>AM_tsq
map \tsp <Plug>AM_tsp
map \tml <Plug>AM_tml
map \tab <Plug>AM_tab
map \m= <Plug>AM_m=
map \t@ <Plug>AM_t@
map \t~ <Plug>AM_t~
map \t? <Plug>AM_t?
map \w= <Plug>AM_w=
map \ts= <Plug>AM_ts=
map \ts< <Plug>AM_ts<
map \ts; <Plug>AM_ts;
map \ts: <Plug>AM_ts:
map \ts, <Plug>AM_ts,
map \t= <Plug>AM_t=
map \t< <Plug>AM_t<
map \t; <Plug>AM_t;
map \t: <Plug>AM_t:
map \t, <Plug>AM_t,
map \t# <Plug>AM_t#
map \t| <Plug>AM_t|
map \T~ <Plug>AM_T~
map \Tsp <Plug>AM_Tsp
map \Tab <Plug>AM_Tab
map \T@ <Plug>AM_T@
map \T? <Plug>AM_T?
map \T= <Plug>AM_T=
map \T< <Plug>AM_T<
map \T; <Plug>AM_T;
map \T: <Plug>AM_T:
map \Ts, <Plug>AM_Ts,
map \T, <Plug>AM_T,o
map \T# <Plug>AM_T#
map \T| <Plug>AM_T|
map \Htd <Plug>AM_Htd
map \anum <Plug>AM_aunum
map \aunum <Plug>AM_aenum
map \afnc <Plug>AM_afnc
map \adef <Plug>AM_adef
map \adec <Plug>AM_adec
map \ascom <Plug>AM_ascom
map \aocom <Plug>AM_aocom
map \adcom <Plug>AM_adcom
map \acom <Plug>AM_acom
map \abox <Plug>AM_abox
map \a( <Plug>AM_a(
map \a= <Plug>AM_a=
map \a< <Plug>AM_a<
map \a, <Plug>AM_a,
map \a? <Plug>AM_a?
nnoremap \gp :GitPullRebase
nnoremap \gc :GitCommit
nnoremap \gA :GitAdd <cfile>
nnoremap \ga :GitAdd
nnoremap \gl :GitLog
nnoremap \gs :GitStatus
nnoremap \gD :GitDiff --cached
nnoremap \gd :GitDiff
nmap \a <Plug>ToggleAutoCloseMappings
nnoremap \t :CommandT
nnoremap \b :BufExplorer
nmap <silent> \p :NERDTreeToggle
nmap ]xx <Plug>unimpairedLineXmlDecode
xmap ]x <Plug>unimpairedXmlDecode
nmap ]x <Plug>unimpairedXmlDecode
nmap ]uu <Plug>unimpairedLineUrlDecode
xmap ]u <Plug>unimpairedUrlDecode
nmap ]u <Plug>unimpairedUrlDecode
nmap ]yy <Plug>unimpairedLineStringDecode
xmap ]y <Plug>unimpairedStringDecode
nmap ]y <Plug>unimpairedStringDecode
xmap ]e <Plug>unimpairedMoveDown
nmap ]e <Plug>unimpairedMoveDown
nmap ]  <Plug>unimpairedBlankDown
nmap ]o <Plug>unimpairedONext
nmap <silent> ]Q <Plug>unimpairedQLast
nmap <silent> ]q <Plug>unimpairedQNext
nmap <silent> ]L <Plug>unimpairedLLast
nmap <silent> ]l <Plug>unimpairedLNext
nmap <silent> ]B <Plug>unimpairedBLast
nmap <silent> ]b <Plug>unimpairedBNext
nmap <silent> ]A <Plug>unimpairedALast
nmap <silent> ]a <Plug>unimpairedANext
vmap ]% ]%m'gv``
snoremap ^ b<BS>^
snoremap ` b<BS>`
omap ar <Plug>(textobj-rubyblock-a)
xmap ar <Plug>(textobj-rubyblock-a)
vmap a% [%v]%
nmap cs <Plug>Csurround
nmap ds <Plug>Dsurround
nmap gx <Plug>NetrwBrowseX
xmap gS <Plug>VgSurround
omap ir <Plug>(textobj-rubyblock-i)
xmap ir <Plug>(textobj-rubyblock-i)
xmap <silent> i,e <Plug>CamelCaseMotion_ie
xmap <silent> i,b <Plug>CamelCaseMotion_ib
xmap <silent> i,w <Plug>CamelCaseMotion_iw
omap <silent> i,e <Plug>CamelCaseMotion_ie
omap <silent> i,b <Plug>CamelCaseMotion_ib
omap <silent> i,w <Plug>CamelCaseMotion_iw
xmap s <Plug>Vsurround
nmap ySS <Plug>YSsurround
nmap ySs <Plug>YSsurround
nmap yss <Plug>Yssurround
nmap yS <Plug>YSurround
nmap ys <Plug>Ysurround
snoremap <Left> bi
snoremap <Right> a
snoremap <BS> b<BS>
snoremap <silent> <S-Tab> i<Right>=BackwardsSnippet()
nnoremap <silent> <Plug>NetrwBrowseX :call netrw#NetrwBrowseX(expand("<cWORD>"),0)
nnoremap <Plug>ZenCodingAnchorizeSummary :call zencoding#anchorizeURL(1)
nnoremap <Plug>ZenCodingAnchorizeURL :call zencoding#anchorizeURL(0)
nnoremap <Plug>ZenCodingRemoveTag :call zencoding#removeTag()
nnoremap <Plug>ZenCodingSplitJoinTagNormal :call zencoding#splitJoinTag()
nnoremap <Plug>ZenCodingToggleComment :call zencoding#toggleComment()
nnoremap <Plug>ZenCodingImageSize :call zencoding#imageSize()
nnoremap <Plug>ZenCodingPrev :call zencoding#moveNextPrev(1)
nnoremap <Plug>ZenCodingNext :call zencoding#moveNextPrev(0)
vnoremap <Plug>ZenCodingBalanceTagOutwardVisual :call zencoding#balanceTag(-2)
nnoremap <Plug>ZenCodingBalanceTagOutwardNormal :call zencoding#balanceTag(-1)
vnoremap <Plug>ZenCodingBalanceTagInwardVisual :call zencoding#balanceTag(2)
nnoremap <Plug>ZenCodingBalanceTagInwardNormal :call zencoding#balanceTag(1)
nnoremap <Plug>ZenCodingExpandWord :call zencoding#expandAbbr(1)
nnoremap <Plug>ZenCodingExpandNormal :call zencoding#expandAbbr(3)
vnoremap <Plug>ZenCodingExpandVisual :call zencoding#expandAbbr(2)
xnoremap <silent> <Plug>unimpairedMoveDown :exe 'norm m`'|exe '''<,''>move''>+'.v:count1``
xnoremap <silent> <Plug>unimpairedMoveUp :exe 'norm m`'|exe '''<,''>move--'.v:count1``
nnoremap <silent> <Plug>unimpairedMoveDown :exe 'norm m`'|exe 'move+'.v:count1``
nnoremap <silent> <Plug>unimpairedMoveUp :exe 'norm m`'|exe 'move--'.v:count1``
nnoremap <silent> <Plug>unimpairedBlankDown :put =repeat(nr2char(10),v:count)|'[-1
nnoremap <silent> <Plug>unimpairedBlankUp :put!=repeat(nr2char(10),v:count)|']+1
nmap <silent> <Plug>unimpairedQLast :exe "clast ".(v:count ? v:count : "")
nmap <silent> <Plug>unimpairedQFirst :exe "cfirst ".(v:count ? v:count : "")
nmap <silent> <Plug>unimpairedQNext :exe "cnext ".(v:count ? v:count : "")
nmap <silent> <Plug>unimpairedQPrevious :exe "cprevious ".(v:count ? v:count : "")
nmap <silent> <Plug>unimpairedLLast :exe "llast ".(v:count ? v:count : "")
nmap <silent> <Plug>unimpairedLFirst :exe "lfirst ".(v:count ? v:count : "")
nmap <silent> <Plug>unimpairedLNext :exe "lnext ".(v:count ? v:count : "")
nmap <silent> <Plug>unimpairedLPrevious :exe "lprevious ".(v:count ? v:count : "")
nmap <silent> <Plug>unimpairedBLast :exe "blast ".(v:count ? v:count : "")
nmap <silent> <Plug>unimpairedBFirst :exe "bfirst ".(v:count ? v:count : "")
nmap <silent> <Plug>unimpairedBNext :exe "bnext ".(v:count ? v:count : "")
nmap <silent> <Plug>unimpairedBPrevious :exe "bprevious ".(v:count ? v:count : "")
nmap <silent> <Plug>unimpairedALast :exe "last ".(v:count ? v:count : "")
nmap <silent> <Plug>unimpairedAFirst :exe "first ".(v:count ? v:count : "")
nmap <silent> <Plug>unimpairedANext :exe "next ".(v:count ? v:count : "")
nmap <silent> <Plug>unimpairedAPrevious :exe "previous ".(v:count ? v:count : "")
nmap <silent> <Plug>NERDCommenterAppend :call NERDComment(0, "append")
nnoremap <silent> <Plug>NERDCommenterToEOL :call NERDComment(0, "toEOL")
vnoremap <silent> <Plug>NERDCommenterUncomment :call NERDComment(1, "uncomment")
nnoremap <silent> <Plug>NERDCommenterUncomment :call NERDComment(0, "uncomment")
vnoremap <silent> <Plug>NERDCommenterNest :call NERDComment(1, "nested")
nnoremap <silent> <Plug>NERDCommenterNest :call NERDComment(0, "nested")
vnoremap <silent> <Plug>NERDCommenterAlignBoth :call NERDComment(1, "alignBoth")
nnoremap <silent> <Plug>NERDCommenterAlignBoth :call NERDComment(0, "alignBoth")
vnoremap <silent> <Plug>NERDCommenterAlignLeft :call NERDComment(1, "alignLeft")
nnoremap <silent> <Plug>NERDCommenterAlignLeft :call NERDComment(0, "alignLeft")
vmap <silent> <Plug>NERDCommenterYank :call NERDComment(1, "yank")
nmap <silent> <Plug>NERDCommenterYank :call NERDComment(0, "yank")
vnoremap <silent> <Plug>NERDCommenterInvert :call NERDComment(1, "invert")
nnoremap <silent> <Plug>NERDCommenterInvert :call NERDComment(0, "invert")
vnoremap <silent> <Plug>NERDCommenterSexy :call NERDComment(1, "sexy")
nnoremap <silent> <Plug>NERDCommenterSexy :call NERDComment(0, "sexy")
vnoremap <silent> <Plug>NERDCommenterMinimal :call NERDComment(1, "minimal")
nnoremap <silent> <Plug>NERDCommenterMinimal :call NERDComment(0, "minimal")
vnoremap <silent> <Plug>NERDCommenterToggle :call NERDComment(1, "toggle")
nnoremap <silent> <Plug>NERDCommenterToggle :call NERDComment(0, "toggle")
vnoremap <silent> <Plug>NERDCommenterComment :call NERDComment(1, "norm")
nnoremap <silent> <Plug>NERDCommenterComment :call NERDComment(0, "norm")
noremap <SNR>50_GrailsControllerMarks :call grails#GrailsControllerMarks()
nnoremap <Plug>ClojureCloseResultBuffer :call vimclojure#ResultBuffer.CloseBuffer()
nnoremap <Plug>ClojureStartLocalRepl :call vimclojure#ProtectedPlug(function("vimclojure#StartRepl"), [ b:vimclojure_namespace ])
nnoremap <Plug>ClojureStartRepl :call vimclojure#ProtectedPlug(function("vimclojure#StartRepl"), [  ])
nnoremap <Plug>ClojureEvalParagraph :call vimclojure#ProtectedPlug(function("vimclojure#EvalParagraph"), [  ])
nnoremap <Plug>ClojureEvalToplevel :call vimclojure#ProtectedPlug(function("vimclojure#EvalToplevel"), [  ])
vnoremap <Plug>ClojureEvalBlock :call vimclojure#ProtectedPlug(function("vimclojure#EvalBlock"), [  ])
nnoremap <Plug>ClojureEvalLine :call vimclojure#ProtectedPlug(function("vimclojure#EvalLine"), [  ])
nnoremap <Plug>ClojureEvalFile :call vimclojure#ProtectedPlug(function("vimclojure#EvalFile"), [  ])
nnoremap <Plug>ClojureMacroExpand1 :call vimclojure#ProtectedPlug(function("vimclojure#MacroExpand"), [ 1 ])
nnoremap <Plug>ClojureMacroExpand :call vimclojure#ProtectedPlug(function("vimclojure#MacroExpand"), [ 0 ])
nnoremap <Plug>ClojureRunTests :call vimclojure#ProtectedPlug(function("vimclojure#RunTests"), [ 0 ])
nnoremap <Plug>ClojureRequireFileAll :call vimclojure#ProtectedPlug(function("vimclojure#RequireFile"), [ 1 ])
nnoremap <Plug>ClojureRequireFile :call vimclojure#ProtectedPlug(function("vimclojure#RequireFile"), [ 0 ])
nnoremap <Plug>ClojureGotoSourceInteractive :call vimclojure#ProtectedPlug(function("vimclojure#GotoSource"), [ input("Symbol to go to: ") ])
nnoremap <Plug>ClojureGotoSourceWord :call vimclojure#ProtectedPlug(function("vimclojure#GotoSource"), [ expand("<cword>") ])
nnoremap <Plug>ClojureSourceLookupInteractive :call vimclojure#ProtectedPlug(function("vimclojure#SourceLookup"), [ input("Symbol to look up: ") ])
nnoremap <Plug>ClojureSourceLookupWord :call vimclojure#ProtectedPlug(function("vimclojure#SourceLookup"), [ expand("<cword>") ])
nnoremap <Plug>ClojureMetaLookupInteractive :call vimclojure#ProtectedPlug(function("vimclojure#MetaLookup"), [ input("Symbol to look up: ") ])
nnoremap <Plug>ClojureMetaLookupWord :call vimclojure#ProtectedPlug(function("vimclojure#MetaLookup"), [ expand("<cword>") ])
nnoremap <Plug>ClojureFindDoc :call vimclojure#ProtectedPlug(function("vimclojure#FindDoc"), [  ])
nnoremap <Plug>ClojureJavadocLookupInteractive :call vimclojure#ProtectedPlug(function("vimclojure#JavadocLookup"), [ input("Class to lookup: ") ])
nnoremap <Plug>ClojureJavadocLookupWord :call vimclojure#ProtectedPlug(function("vimclojure#JavadocLookup"), [ expand("<cword>") ])
nnoremap <Plug>ClojureDocLookupInteractive :call vimclojure#ProtectedPlug(function("vimclojure#DocLookup"), [ input("Symbol to look up: ") ])
nnoremap <Plug>ClojureDocLookupWord :call vimclojure#ProtectedPlug(function("vimclojure#DocLookup"), [ expand("<cword>") ])
nnoremap <Plug>ClojureAddToLispWords :call vimclojure#ProtectedPlug(function("vimclojure#AddToLispWords"), [ expand("<cword>") ])
vnoremap <Plug>CamelCaseMotion_ie :call camelcasemotion#InnerMotion('e',v:count1)
vnoremap <Plug>CamelCaseMotion_ib :call camelcasemotion#InnerMotion('b',v:count1)
vnoremap <Plug>CamelCaseMotion_iw :call camelcasemotion#InnerMotion('w',v:count1)
onoremap <Plug>CamelCaseMotion_ie :call camelcasemotion#InnerMotion('e',v:count1)
onoremap <Plug>CamelCaseMotion_ib :call camelcasemotion#InnerMotion('b',v:count1)
onoremap <Plug>CamelCaseMotion_iw :call camelcasemotion#InnerMotion('w',v:count1)
vnoremap <Plug>CamelCaseMotion_e :call camelcasemotion#Motion('e',v:count1,'v')
vnoremap <Plug>CamelCaseMotion_b :call camelcasemotion#Motion('b',v:count1,'v')
vnoremap <Plug>CamelCaseMotion_w :call camelcasemotion#Motion('w',v:count1,'v')
onoremap <Plug>CamelCaseMotion_e :call camelcasemotion#Motion('e',v:count1,'o')
onoremap <Plug>CamelCaseMotion_b :call camelcasemotion#Motion('b',v:count1,'o')
onoremap <Plug>CamelCaseMotion_w :call camelcasemotion#Motion('w',v:count1,'o')
nnoremap <Plug>CamelCaseMotion_e :call camelcasemotion#Motion('e',v:count1,'n')
nnoremap <Plug>CamelCaseMotion_b :call camelcasemotion#Motion('b',v:count1,'n')
nnoremap <Plug>CamelCaseMotion_w :call camelcasemotion#Motion('w',v:count1,'n')
nmap <silent> <Plug>RestoreWinPosn :call RestoreWinPosn()
nmap <silent> <Plug>SaveWinPosn :call SaveWinPosn()
nmap <SNR>38_WE <Plug>AlignMapsWrapperEnd
map <SNR>38_WS <Plug>AlignMapsWrapperStart
nmap <S-Tab> gT
nmap <Up> gk
nmap <Down> gj
map <S-Insert> <MiddleMouse>
imap S <Plug>ISurround
imap s <Plug>Isurround
inoremap <silent> 	 =TriggerSnippet()
inoremap <NL> <Down>
inoremap  :nohls
inoremap <expr>  pumvisible() ? "\ \<BS>" : "\"
inoremap <silent> 	 =ShowAvailableSnips()
imap  <Plug>Isurround
imap & <Plug>ragtagXmlV
imap % <Plug>ragtagUrlV
imap & <Plug>ragtagXmlEncode
imap % <Plug>ragtagUrlEncode
imap / </<Plug>ragtagHtmlComplete
imap H <Plug>ragtagHtmlComplete
imap  <Plug>AlwaysEnd
imap A <Plug>ZenCodingAnchorizeSummary
imap a <Plug>ZenCodingAnchorizeURL
imap k <Plug>ZenCodingRemoveTag
imap j <Plug>ZenCodingSplitJoinTagInsert
imap / <Plug>ZenCodingToggleComment
imap i <Plug>ZenCodingImageSize
imap N <Plug>ZenCodingPrev
imap n <Plug>ZenCodingNext
imap D <Plug>ZenCodingBalanceTagOutwardInsert
imap d <Plug>ZenCodingBalanceTagInwardInsert
imap ; <Plug>ZenCodingExpandWord
imap , <Plug>ZenCodingExpandAbbr
map ë :cprevious
map ê :cnext
map ñ :cclose
map ï :copen
let &cpo=s:cpo_save
unlet s:cpo_save
set autoindent
set background=dark
set backspace=indent,eol,start
set expandtab
set fileencodings=ucs-bom,utf-8,default,latin1
set formatoptions=l
set guifont=Monaco\ 9
set guioptions=aegimrLt
set guitablabel=%M%t
set helplang=en
set hidden
set history=1000
set hlsearch
set incsearch
set indentkeys=o,O,*<Return>,<>>,{,},0),0],o,O,!^F,=end,=else,=elsif,=rescue,=ensure,=when
set iskeyword=@,48-57,_,192-255,$
set laststatus=2
set linespace=4
set nomodeline
set mouse=a
set printoptions=paper:letter
set ruler
set runtimepath=~/.vim,~/.vim/bundle/abolish,~/.vim/bundle/ack,~/.vim/bundle/Align,~/.vim/bundle/bufexplorer,~/.vim/bundle/camelcasemotion,~/.vim/bundle/clojure,~/.vim/bundle/Command-T,~/.vim/bundle/CSApprox,~/.vim/bundle/cucumber,~/.vim/bundle/endwise,~/.vim/bundle/fugitive,~/.vim/bundle/git,~/.vim/bundle/grails-vim,~/.vim/bundle/haml,~/.vim/bundle/liftweb,~/.vim/bundle/markdown,~/.vim/bundle/markdown-preview,~/.vim/bundle/matchit,~/.vim/bundle/NERD_commenter,~/.vim/bundle/NERD_tree,~/.vim/bundle/pastie,~/.vim/bundle/ragtag,~/.vim/bundle/rails,~/.vim/bundle/scala,~/.vim/bundle/scss-syntax,~/.vim/bundle/securemodelines,~/.vim/bundle/snipmate,~/.vim/bundle/supertab,~/.vim/bundle/surround,~/.vim/bundle/syntastic,~/.vim/bundle/taglist_45,~/.vim/bundle/textile,~/.vim/bundle/unimpaired,~/.vim/bundle/vim-coffee-script,~/.vim/bundle/vim-preview,~/.vim/bundle/vim-ruby,~/.vim/bundle/vim-ruby-sinatra,~/.vim/bundle/vim-textobj-rubybloc,~/.vim/bundle/vim-textobj-user,~/.vim/bundle/vividchalk,~/.vim/bundle/zencoding-vim,/var/lib/vim/addons,/usr/share/vim/vimfiles,/usr/share/vim/vim72,/usr/share/vim/vimfiles/after,/var/lib/vim/addons/after,~/.vim/bundle/snipmate/after,~/.vim/after
set scrolloff=3
set shiftwidth=2
set showbreak=...
set showcmd
set sidescroll=1
set sidescrolloff=7
set softtabstop=2
set statusline=%f[%{GitBranch()}]%{exists('g:loaded_rvm')?rvm#statusline():''}%=%c,%l/%L\ %P
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc
set termencoding=utf-8
set visualbell
set wildignore=*.o,*.obj,*~
set wildmenu
set wildmode=list:longest
set window=42
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/dev/t140mk
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +1 app/controllers/about_controller.rb
badd +25 Gemfile
badd +14 config/environment.rb.rails2
badd +1 config/initializers/config.rb
badd +10 config/initializers/new_rails_defaults.rb
badd +15 config/database.yml.rails2
badd +33 config/database.yml
badd +12 config/routes.rb.rails2
badd +34 config/routes.rb
badd +19 app/controllers/welcome_controller.rb
badd +20 app/controllers/application_controller.rb
badd +27 app/controllers/application_controller.rb.rails2
badd +9 app/views/welcome/index.html.haml
badd +45 config/application.rb
badd +1 app/views/configurations/_edit_today_topic.html.haml
badd +13 app/views/shared/_hashtag_filter.html.haml
badd +1 app/views/welcome/_tweets.html.haml
badd +19 app/views/shared/_tweet.html.haml
badd +8 app/views/shared/_user_info_left.html.haml
badd +60 app/helpers/application_helper.rb.rails2
badd +3 app/helpers/application_helper.rb
badd +6 app/views/shared/_trending_tags.html.haml
badd +14 app/views/shared/_categories.html.haml
badd +1 app/views/layouts/application.html.erb
badd +1 app/views/layouts/admin.html.haml
silent! argdel *
edit app/helpers/application_helper.rb.rails2
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
argglobal
let s:cpo_save=&cpo
set cpo&vim
nmap <buffer> gf <Plug>RailsTabFind
nmap <buffer> f <Plug>RailsSplitFind
nmap <buffer> [f <Plug>RailsAlternate
nmap <buffer> ]f <Plug>RailsRelated
nmap <buffer> gf <Plug>RailsFind
nnoremap <buffer> <silent> <Plug>RailsTabFind :RTfind
nnoremap <buffer> <silent> <Plug>RailsVSplitFind :RVfind
nnoremap <buffer> <silent> <Plug>RailsSplitFind :RSfind
nnoremap <buffer> <silent> <Plug>RailsFind :REfind
nnoremap <buffer> <silent> <Plug>RailsRelated :R
nnoremap <buffer> <silent> <Plug>RailsAlternate :A
cnoremap <buffer> <expr>  fugitive#buffer().rev()
let &cpo=s:cpo_save
unlet s:cpo_save
setlocal keymap=
setlocal noarabic
setlocal autoindent
setlocal balloonexpr=
setlocal nobinary
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal nocindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
setlocal comments=:#
setlocal commentstring=#\ %s
setlocal complete=.,w,b,u,t,i
setlocal completefunc=
setlocal nocopyindent
setlocal nocursorcolumn
setlocal nocursorline
setlocal define=
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal expandtab
if &filetype != 'conf'
setlocal filetype=conf
endif
setlocal foldcolumn=0
set nofoldenable
setlocal nofoldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
set foldmethod=indent
setlocal foldmethod=indent
setlocal foldminlines=1
set foldnestmax=3
setlocal foldnestmax=3
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=croql
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal grepprg=
setlocal iminsert=2
setlocal imsearch=2
setlocal include=
setlocal includeexpr=RailsIncludeexpr()
setlocal indentexpr=
setlocal indentkeys=0{,0},:,0#,!^F,o,O,e
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255,$
setlocal keywordprg=
set linebreak
setlocal linebreak
setlocal nolisp
setlocal nolist
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal nomodeline
setlocal modifiable
setlocal nrformats=octal,hex
set number
setlocal number
setlocal numberwidth=4
setlocal omnifunc=
setlocal path=.,~/dev/t140mk,~/dev/t140mk/app,~/dev/t140mk/app/models,~/dev/t140mk/app/controllers,~/dev/t140mk/app/helpers,~/dev/t140mk/config,~/dev/t140mk/lib,~/dev/t140mk/app/views,~/dev/t140mk/test,~/dev/t140mk/test/unit,~/dev/t140mk/test/functional,~/dev/t140mk/test/integration,~/dev/t140mk/spec,~/dev/t140mk/spec/models,~/dev/t140mk/spec/controllers,~/dev/t140mk/spec/helpers,~/dev/t140mk/spec/views,~/dev/t140mk/spec/lib,~/dev/t140mk/spec/requests,~/dev/t140mk/spec/integration,~/dev/t140mk/app/*,~/dev/t140mk/vendor,~/dev/t140mk/vendor/plugins/*/lib,~/dev/t140mk/vendor/plugins/*/test,~/dev/t140mk/vendor/rails/*/lib,~/dev/t140mk/vendor/rails/*/test,/usr/include,
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal shiftwidth=2
setlocal noshortname
setlocal nosmartindent
setlocal softtabstop=2
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=%f[%{GitBranch()}]%{exists('g:loaded_rvm')?rvm#statusline():''}%{rails#statusline()}%=%c,%l/%L\ %P
setlocal suffixesadd=.rb,.rhtml,.erb,.rxml,.builder,.rjs,.mab,.liquid,.haml,.dryml,.mn,.css,.js,.yml,.csv,.rake,.sql,.html,.xml
setlocal swapfile
setlocal synmaxcol=3000
if &syntax != 'conf'
setlocal syntax=conf
endif
setlocal tabstop=8
setlocal tags=~/dev/t140mk/tmp/tags,./tags,./TAGS,tags,TAGS,~/dev/t140mk/.git/tags,~/dev/t140mk/tags
setlocal textwidth=0
setlocal thesaurus=
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
let s:l = 60 - ((4 * winheight(0) + 20) / 41)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
60
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
