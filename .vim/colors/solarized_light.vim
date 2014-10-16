set background=dark
highlight clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "Solarized (light)"

hi Cursor ctermfg=230 ctermbg=0 cterm=NONE guifg=#fdf6e3 guibg=#000000 gui=NONE
hi Visual ctermfg=NONE ctermbg=23 cterm=NONE guifg=NONE guibg=#073642 gui=NONE
hi CursorLine ctermfg=NONE ctermbg=224 cterm=NONE guifg=NONE guibg=#ede8d8 gui=NONE
hi CursorColumn ctermfg=NONE ctermbg=224 cterm=NONE guifg=NONE guibg=#ede8d8 gui=NONE
hi ColorColumn ctermfg=NONE ctermbg=224 cterm=NONE guifg=NONE guibg=#ede8d8 gui=NONE
hi LineNr ctermfg=145 ctermbg=224 cterm=NONE guifg=#abb2ac guibg=#ede8d8 gui=NONE
hi VertSplit ctermfg=187 ctermbg=187 cterm=NONE guifg=#cdcfc3 guibg=#cdcfc3 gui=NONE
hi MatchParen ctermfg=100 ctermbg=NONE cterm=underline guifg=#859900 guibg=NONE gui=underline
hi StatusLine ctermfg=60 ctermbg=187 cterm=bold guifg=#586e75 guibg=#cdcfc3 gui=bold
hi StatusLineNC ctermfg=60 ctermbg=187 cterm=NONE guifg=#586e75 guibg=#cdcfc3 gui=NONE
hi Pmenu ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi PmenuSel ctermfg=NONE ctermbg=23 cterm=NONE guifg=NONE guibg=#073642 gui=NONE
hi IncSearch ctermfg=230 ctermbg=36 cterm=NONE guifg=#fdf6e3 guibg=#2aa198 gui=NONE
hi Search ctermfg=NONE ctermbg=NONE cterm=underline guifg=NONE guibg=NONE gui=underline
hi Directory ctermfg=166 ctermbg=NONE cterm=NONE guifg=#cb4b16 guibg=NONE gui=NONE
hi Folded ctermfg=109 ctermbg=230 cterm=NONE guifg=#93a1a1 guibg=#fdf6e3 gui=NONE

hi Normal ctermfg=60 ctermbg=230 cterm=NONE guifg=#586e75 guibg=#fdf6e3 gui=NONE
hi Boolean ctermfg=136 ctermbg=NONE cterm=NONE guifg=#b58900 guibg=NONE gui=NONE
hi Character ctermfg=166 ctermbg=NONE cterm=NONE guifg=#cb4b16 guibg=NONE gui=NONE
hi Comment ctermfg=109 ctermbg=NONE cterm=NONE guifg=#93a1a1 guibg=NONE gui=NONE
hi Conditional ctermfg=100 ctermbg=NONE cterm=NONE guifg=#859900 guibg=NONE gui=NONE
hi Constant ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi Define ctermfg=100 ctermbg=NONE cterm=NONE guifg=#859900 guibg=NONE gui=NONE
hi DiffAdd ctermfg=60 ctermbg=149 cterm=bold guifg=#586e75 guibg=#a1e657 gui=bold
hi DiffDelete ctermfg=203 ctermbg=NONE cterm=NONE guifg=#f2524e guibg=NONE gui=NONE
hi DiffChange ctermfg=60 ctermbg=152 cterm=NONE guifg=#586e75 guibg=#b8cbd9 gui=NONE
hi DiffText ctermfg=60 ctermbg=74 cterm=bold guifg=#586e75 guibg=#729fcf gui=bold
hi ErrorMsg ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi WarningMsg ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi Float ctermfg=168 ctermbg=NONE cterm=NONE guifg=#d33682 guibg=NONE gui=NONE
hi Function ctermfg=32 ctermbg=NONE cterm=NONE guifg=#268bd2 guibg=NONE gui=NONE
hi Identifier ctermfg=23 ctermbg=NONE cterm=bold guifg=#073642 guibg=NONE gui=bold
hi Keyword ctermfg=100 ctermbg=NONE cterm=NONE guifg=#859900 guibg=NONE gui=NONE
hi Label ctermfg=36 ctermbg=NONE cterm=NONE guifg=#2aa198 guibg=NONE gui=NONE
hi NonText ctermfg=251 ctermbg=230 cterm=NONE guifg=#c8ccc2 guibg=#f5efdd gui=NONE
hi Number ctermfg=168 ctermbg=NONE cterm=NONE guifg=#d33682 guibg=NONE gui=NONE
hi Operator ctermfg=100 ctermbg=NONE cterm=NONE guifg=#859900 guibg=NONE gui=NONE
hi PreProc ctermfg=100 ctermbg=NONE cterm=NONE guifg=#859900 guibg=NONE gui=NONE
hi Special ctermfg=60 ctermbg=NONE cterm=NONE guifg=#586e75 guibg=NONE gui=NONE
hi SpecialKey ctermfg=251 ctermbg=224 cterm=NONE guifg=#c8ccc2 guibg=#ede8d8 gui=NONE
hi Statement ctermfg=100 ctermbg=NONE cterm=NONE guifg=#859900 guibg=NONE gui=NONE
hi StorageClass ctermfg=23 ctermbg=NONE cterm=bold guifg=#073642 guibg=NONE gui=bold
hi String ctermfg=36 ctermbg=NONE cterm=NONE guifg=#2aa198 guibg=NONE gui=NONE
hi Tag ctermfg=32 ctermbg=NONE cterm=bold guifg=#268bd2 guibg=NONE gui=bold
hi Title ctermfg=60 ctermbg=NONE cterm=bold guifg=#586e75 guibg=NONE gui=bold
hi Todo ctermfg=109 ctermbg=NONE cterm=inverse,bold guifg=#93a1a1 guibg=NONE gui=inverse,bold
hi Type ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi Underlined ctermfg=NONE ctermbg=NONE cterm=underline guifg=NONE guibg=NONE gui=underline
hi rubyClass ctermfg=100 ctermbg=NONE cterm=NONE guifg=#859900 guibg=NONE gui=NONE
hi rubyFunction ctermfg=32 ctermbg=NONE cterm=NONE guifg=#268bd2 guibg=NONE gui=NONE
hi rubyInterpolationDelimiter ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi rubySymbol ctermfg=166 ctermbg=NONE cterm=NONE guifg=#cb4b16 guibg=NONE gui=NONE
hi rubyConstant ctermfg=100 ctermbg=NONE cterm=NONE guifg=#859900 guibg=NONE gui=NONE
hi rubyStringDelimiter ctermfg=36 ctermbg=NONE cterm=NONE guifg=#2aa198 guibg=NONE gui=NONE
hi rubyBlockParameter ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi rubyInstanceVariable ctermfg=32 ctermbg=NONE cterm=NONE guifg=#268bd2 guibg=NONE gui=NONE
hi rubyInclude ctermfg=100 ctermbg=NONE cterm=NONE guifg=#859900 guibg=NONE gui=NONE
hi rubyGlobalVariable ctermfg=32 ctermbg=NONE cterm=NONE guifg=#268bd2 guibg=NONE gui=NONE
hi rubyRegexp ctermfg=160 ctermbg=NONE cterm=NONE guifg=#d30102 guibg=NONE gui=NONE
hi rubyRegexpDelimiter ctermfg=160 ctermbg=NONE cterm=NONE guifg=#d30102 guibg=NONE gui=NONE
hi rubyEscape ctermfg=166 ctermbg=NONE cterm=NONE guifg=#cb4b16 guibg=NONE gui=NONE
hi rubyControl ctermfg=100 ctermbg=NONE cterm=NONE guifg=#859900 guibg=NONE gui=NONE
hi rubyClassVariable ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi rubyOperator ctermfg=100 ctermbg=NONE cterm=NONE guifg=#859900 guibg=NONE gui=NONE
hi rubyException ctermfg=100 ctermbg=NONE cterm=NONE guifg=#859900 guibg=NONE gui=NONE
hi rubyPseudoVariable ctermfg=32 ctermbg=NONE cterm=NONE guifg=#268bd2 guibg=NONE gui=NONE
hi rubyRailsUserClass ctermfg=100 ctermbg=NONE cterm=NONE guifg=#859900 guibg=NONE gui=NONE
hi rubyRailsARAssociationMethod ctermfg=32 ctermbg=NONE cterm=NONE guifg=#268bd2 guibg=NONE gui=NONE
hi rubyRailsARMethod ctermfg=32 ctermbg=NONE cterm=NONE guifg=#268bd2 guibg=NONE gui=NONE
hi rubyRailsRenderMethod ctermfg=32 ctermbg=NONE cterm=NONE guifg=#268bd2 guibg=NONE gui=NONE
hi rubyRailsMethod ctermfg=32 ctermbg=NONE cterm=NONE guifg=#268bd2 guibg=NONE gui=NONE
hi erubyDelimiter ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi erubyComment ctermfg=109 ctermbg=NONE cterm=NONE guifg=#93a1a1 guibg=NONE gui=NONE
hi erubyRailsMethod ctermfg=32 ctermbg=NONE cterm=NONE guifg=#268bd2 guibg=NONE gui=NONE
hi htmlTag ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi htmlEndTag ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi htmlTagName ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi htmlArg ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi htmlSpecialChar ctermfg=166 ctermbg=NONE cterm=NONE guifg=#cb4b16 guibg=NONE gui=NONE
hi javaScriptFunction ctermfg=23 ctermbg=NONE cterm=bold guifg=#073642 guibg=NONE gui=bold
hi javaScriptRailsFunction ctermfg=32 ctermbg=NONE cterm=NONE guifg=#268bd2 guibg=NONE gui=NONE
hi javaScriptBraces ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi yamlKey ctermfg=32 ctermbg=NONE cterm=bold guifg=#268bd2 guibg=NONE gui=bold
hi yamlAnchor ctermfg=32 ctermbg=NONE cterm=NONE guifg=#268bd2 guibg=NONE gui=NONE
hi yamlAlias ctermfg=32 ctermbg=NONE cterm=NONE guifg=#268bd2 guibg=NONE gui=NONE
hi yamlDocumentHeader ctermfg=36 ctermbg=NONE cterm=NONE guifg=#2aa198 guibg=NONE gui=NONE
hi cssURL ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi cssFunctionName ctermfg=32 ctermbg=NONE cterm=NONE guifg=#268bd2 guibg=NONE gui=NONE
hi cssColor ctermfg=166 ctermbg=NONE cterm=NONE guifg=#cb4b16 guibg=NONE gui=NONE
hi cssPseudoClassId ctermfg=109 ctermbg=NONE cterm=NONE guifg=#93a1a1 guibg=NONE gui=NONE
hi cssClassName ctermfg=109 ctermbg=NONE cterm=NONE guifg=#93a1a1 guibg=NONE gui=NONE
hi cssValueLength ctermfg=168 ctermbg=NONE cterm=NONE guifg=#d33682 guibg=NONE gui=NONE
hi cssCommonAttr ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi cssBraces ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
