" Vim syntax file
" Language:     JavaScript
" Maintainer:   Yi Zhao (ZHAOYI) <zzlinux AT hotmail DOT com>
" Last Change:  May 17, 2013
" Version:      0.7.7.1
" Changes:      Add Extjs related syntax
"
" TODO:
"  - Add the HTML syntax inside the JSDoc

if !exists("main_syntax")
  if version < 600
    syntax clear
  elseif exists("b:current_syntax")
    finish
  endif
  let main_syntax = 'javascript'
endif

"" Drop fold if it set but VIM doesn't support it.
let b:javascript_fold='true'
if version < 600    " Don't support the old version
  unlet! b:javascript_fold
endif

"" dollar sigh is permittd anywhere in an identifier
setlocal iskeyword+=$

syntax sync fromstart

"" JavaScript comments
syntax keyword javaScriptCommentTodo    TODO FIXME XXX TBD contained
syntax region  javaScriptLineComment    start=+\/\/+ end=+$+ keepend contains=javaScriptCommentTodo,@Spell
syntax region  javaScriptLineComment    start=+^\s*\/\/+ skip=+\n\s*\/\/+ end=+$+ keepend contains=javaScriptCommentTodo,@Spell fold
syntax region  javaScriptCvsTag         start="\$\cid:" end="\$" oneline contained
syntax region  javaScriptComment        start="/\*"  end="\*/" contains=javaScriptCommentTodo,javaScriptCvsTag,@Spell fold

"" JSDoc support start
if !exists("javascript_ignore_javaScriptdoc")
  syntax case ignore

  "" syntax coloring for javadoc comments (HTML)
  "syntax include @javaHtml <sfile>:p:h/html.vim
  "unlet b:current_syntax

  syntax region javaScriptDocComment    matchgroup=javaScriptComment start="/\*\*\s*$"  end="\*/" contains=javaScriptDocTags,javaScriptCommentTodo,javaScriptCvsTag,@javaScriptHtml,@Spell fold
  syntax match  javaScriptDocTags       contained "@\(param\|argument\|requires\|exception\|throws\|type\|class\|extends\|see\|link\|member\|module\|method\|title\|namespace\|optional\|default\|base\|file\)\>" nextgroup=javaScriptDocParam,javaScriptDocSeeTag skipwhite
  syntax match  javaScriptDocTags       contained "@\(beta\|deprecated\|description\|fileoverview\|author\|license\|version\|returns\=\|constructor\|private\|protected\|final\|ignore\|addon\|exec\)\>"
  syntax match  javaScriptDocParam      contained "\%(#\|\w\|\.\|:\|\/\)\+"
  syntax region javaScriptDocSeeTag     contained matchgroup=javaScriptDocSeeTag start="{" end="}" contains=javaScriptDocTags

  syntax case match
endif   "" JSDoc end

syntax case match

"" Extjs
syntax match javaScriptSpecialFn           "console\.log\|Ext\.log"
syntax match javaScriptExtjsCore           "Ext\.\(BLANK_IMAGE_URL\|SSL_SECURE_URL\|USE_NATIVE_JSON\|emptyFn\|enableFx\|enableGarbageCollector\|enableListenerCollection\|isAir\|isBorderBox\|isChrome\|isGecko2\|isGecko3\|isGecko\|isIE6\|isIE7\|isIE8\|isIE\|isLinux\|isMac\|isOpera\|isReady\|isSafari2\|isSafari3\|isSafari4\|isSafari\|isSecure\|isStrict\|isWindows\|useShims\|version\|addBehaviors\|applyIf\|apply\|clean\|copyTo\|decode\|destroyMembers\|destroy\|each\|encode\|esacpeRe\|extend\|flatten\|fly\|getCmp\|getBody\|getDoc\|getDom\|get\|id\|invoke\|isArray\|isDate\|isEmpty\|isFunction\|isObject\|isPrimitive\|isString\|isBoolean\|isNumber\|isDefined\|isElement\|max\|mean\|min\|ns\|namespace\|num\|onReady\|override\|partition\|pluck\|query\|reg\|removeNode\|select\|sum\|toArray\|type\|unique\|urlDecode\|urlEncode\|value\|zip\)"
syntax match javaScriptExtjsDateClass      "Date\.\(dayNames\|defaults\|formatCodes\|formatFunctions\|monthNames\|monthNumbers\|parseFunctions\|DAY\|HOUR\|MILLI\|MINUTE\|MONTH\|SECOND\|YEAR\)"
syntax match javaScriptExtjsMisc           "\.\(createCallback\|createDelegate\|createInterceptor\|createSequence\|defer\|call\|apply\|constrain\|escape\|format\|leftPad\|toggle\|trim\|indexOf\|remove\|between\|clearTime\|clone\|format\|getDayOfYear\|getDaysInMonth\|getElapsed\|getFirstDateOfMonth\|getFirstDayOfMonth\|getGMTOffset\|getLastDateOfMonth\|getLastDayOfMonth\|getMonthNumber\|getShortDayName\|getShortMonthName\|getSuffix\|getTimezone\|getWeekOfYear\|isLeapYear\|parseDate\)"
syntax match javaScriptExtjsClass          "Ext\.\(Ajax\|EventManager\|QuickTips\|air\.Clipboard\|air\.DragType\|air\.FileProvider\|air\.NativeObservable\|air\.NativeWindow\|air\.NativeWindowGroup\|air\.NativeWindowManager\|air\.Sound\|air\.SystemMenu\|air\.SystemTray\|air\.VideoPanel\|chart\.Axis\|chart\.BarChart\|chart\.BarSeries\|chart\.CartesianChart\|chart\.CartesianSeries\|chart\.CategoryAxis\|chart\.Chart\|chart\.ColumnChart\|chart\.ColumnSeries\|chart\.LineChart\|chart\.LineSeries\|chart\.NumericAxis\|chart\.PieChart\|chart\.PieSeries\|chart\.Series\|chart\.TimeAxis\|data\.Api\|data\.ArrayReader\|data\.ArrayStore\|data\.Connection\|data\.DataProxy\|data\.DataReader\|data\.DataWriter\|data\.DirectProxy\|data\.DirectStore\|data\.Field\|data\.GroupingStore\|data\.HttpProxy\|data\.JsonReader\|data\.JsonStore\|data\.JsonWriter\|data\.MemoryProxy\|data\.Node\|data\.Record\|data\.SrciptTagProxy\|data\.SortTypes\|data\.Store\|data\.Tree\|data\.XmlReader\|data\.XmlStore\|data\.XmlWriter\|dd\.DD\|dd\.DDProxy\|dd\.DDTarget\|dd\.DragDrop\|dd\.DragDropMgr\|dd\.DragSource\|dd\.DragTracker\|dd\.DragZone\|dd\.DropTarget\|dd\.DropZone\|dd\.PanelProxy\|dd\.Registry\|dd\.ScrollManager\|dd\.StatusProxy\|direct\.JsonProvider\|direct\.PollingProvider\|direct\.Provider\|direct\.RemotingProvider\|form\.Action\.Load\|form\.Action\.Submit\|form\.Action\.DirectLoad\|form\.Action\.DirectSubmit\|form\.Action\|form\.BasicForm\|form\.Checkbox\|form\.CheckboxGroup\|form\.ComboBox\|form\.DateField\|form\.DisplayField\|form\.FieldSet\|form\.Field\|form\.FormPanel\|form\.Hidden\|form\.HtmlEditor\|form\.Label\|form\.NumberField\|form\.RadioGroup\|form\.Radio\|form\.TextArea\|form\.TextField\|form\.TimeField\|form\.TriggerField\|form\.TwinTriggerField\|form\.VTypes\|grid\.AbstractSelectionModel\|grid\.BooleanColumn\|grid\.CellSelectionModel\|grid\.CheckboxSelectionModel\|grid\.ColumnModel\|grid\.Column\|grid\.Datecolumn\|grid\.EditorGridPanel\|grid\.GridDragZone\|grid\.GridPanel\|grid\.GridView\|grid\.GroupingView\|grid\.PropertyColumnModel\|grid\.PropertyGrid\|grid\.PropertyRecord\|grid\.PropertyStore\|grid\.RowNumberer\|grid\.RowSelectionModel\|grid\.TemplateColumn\|layout\.AbsoluteLayout\|layout\.AccordionLayout\|layout\.AnchorLayout\|layout\.BorderLayout\.Region\|layout\.BorderLayout\.SplitRegin\|layout\.BorderLayout\|layout\.BoxLayout\|layout\.CardLayout\|layout\.ColumnLayout\|layout\.ContainerLayout\|layout\.FitLayout\|layout\.FormLayout\|layout\.HBoxLayout\|layout\.TableLayout\|layout\.ToolbarLayout\|layout\.VBoxLayout\|menu\.BaseItem\|menu\.CheckItem\|menu\.ColorMenu\|menu\.DateMenu\|menu\.Item\|menu\.MenuMgr\|menu\.Menu\|menu\.Separator\|menu\.TextItem\|state\.CookieProvider\|state\.Manager\|state\.Provider\|tree\.AsyncTreeNode\|tree\.DefaultSelectionModel\|tree\.MultiSelectionModel\|tree\.RootTreeNodeUI\|tree\.TreeDragZone\|tree\.TreeDropZone\|tree\.TreeEditor\|tree\.TreeFilter\|tree\.TreeLoader\|tree\.TreeNodeUI\|tree\.TreeNode\|tree\.TreePanel\|tree\.TreeSorter\|util\.CSS\|util\.ClickRepeater\|util\.DelayedTask\|util\.Format\|util\.JSON\|util\.MixedCollection\|util\.Observable\|util\.TaskRunner\|util\.TextMetrics\|Action\|Ajax\|BoxComponent\|ButtonGroup\|Button\|ColorPalette\|ComponentMgr\|Component\|CompositeElementLite\|CompositeElement\|Container\|CycleButton\|DataView\|DatePicker\|Direct\|DomHelper\|DomQuery\|Editor\|Element\|Error\|EventManager\|EventObject\|\FlashComponent\|FlashProxy\|Fx\|History\|KeyMap\|KeyNav\|Layer\|ListView\.ColumnResizer\|ListView\.Sorter\|ListView\|LoadMask\|MessageBox\|PagingToolbar\|Panel\|ProgressBar\|QuickTips\|QuickTip\|Resizable\|Shadow\|Slider\|Spacer\|SplitBar\.AbsoluteLayoutAdapter\|SplitBar\.BasicLayoutAdapter\|SplitBar\|SplitButton\|StoreMgr\|TabPanel\|TaskMgr\|Template\|Tip\|ToolTip\|Toolbar\.Fill\|Toolbar\.Item\|Toolbar\.Separator\|Toolbar\.Spacer\|Toolbar\.TextItem\|Toolbar\|Updater\.BasicRenderer\|Updater\.defaults\|Updater\|Viewport\|WindowGroup\|WindowMgr\|Window\|XTemplate\)"

"" Syntax in the JavaScript code
syntax match   javaScriptSpecial        "\\\d\d\d\|\\x\x\{2\}\|\\u\x\{4\}\|\\."
syntax region  javaScriptStringD        start=+"+  skip=+\\\\\|\\$"+  end=+"+  contains=javaScriptSpecial,@htmlPreproc
syntax region  javaScriptStringS        start=+'+  skip=+\\\\\|\\$'+  end=+'+  contains=javaScriptSpecial,@htmlPreproc
syntax region  javaScriptRegexpString   start=+/\(\*\|/\)\@!+ skip=+\\\\\|\\/+ end=+/[gim]\{,3}+ contains=javaScriptSpecial,@htmlPreproc oneline
syntax match   javaScriptNumber         /\<-\=\d\+L\=\>\|\<0[xX]\x\+\>/
syntax match   javaScriptFloat          /\<-\=\%(\d\+\.\d\+\|\d\+\.\|\.\d\+\)\%([eE][+-]\=\d\+\)\=\>/
syntax match   javaScriptLabel          /\(?\s*\)\@<!\<\w\+\(\s*:\)\@=/

"" JavaScript Prototype
syntax keyword javaScriptPrototype      prototype

"" Programm Keywords
syntax keyword javaScriptSource         import export
syntax keyword javaScriptType           const this undefined var void yield caller callee
syntax keyword javaScriptOperator       delete new in instanceof let typeof
syntax keyword javaScriptBoolean        true false
syntax keyword javaScriptNull           null
syntax keyword javaScriptIdentifier     arguments

"" Statement Keywords
syntax keyword javaScriptConditional    if else
syntax keyword javaScriptRepeat         do while for
syntax keyword javaScriptBranch         break continue switch case default return
syntax keyword javaScriptStatement      try catch throw with finally superclass

syntax keyword javaScriptGlobalObjects  Array Boolean Date Function Infinity JavaArray JavaClass JavaObject JavaPackage Math Number NaN Object Packages RegExp String Undefined java netscape sun

syntax keyword javaScriptExceptions     Error EvalError RangeError ReferenceError SyntaxError TypeError URIError

syntax keyword javaScriptFutureKeys     abstract enum int short boolean export interface static byte extends long super char final native synchronized class float package throws const goto private transient debugger implements protected volatile double import public

"" DOM/HTML/CSS specified things

  " DOM2 Objects
  syntax keyword javaScriptGlobalObjects  DOMImplementation DocumentFragment Document Node NodeList NamedNodeMap CharacterData Attr Element Text Comment CDATASection DocumentType Notation Entity EntityReference ProcessingInstruction
  syntax keyword javaScriptExceptions     DOMException

  " DOM2 CONSTANT
  syntax keyword javaScriptDomErrNo       INDEX_SIZE_ERR DOMSTRING_SIZE_ERR HIERARCHY_REQUEST_ERR WRONG_DOCUMENT_ERR INVALID_CHARACTER_ERR NO_DATA_ALLOWED_ERR NO_MODIFICATION_ALLOWED_ERR NOT_FOUND_ERR NOT_SUPPORTED_ERR INUSE_ATTRIBUTE_ERR INVALID_STATE_ERR SYNTAX_ERR INVALID_MODIFICATION_ERR NAMESPACE_ERR INVALID_ACCESS_ERR
  syntax keyword javaScriptDomNodeConsts  ELEMENT_NODE ATTRIBUTE_NODE TEXT_NODE CDATA_SECTION_NODE ENTITY_REFERENCE_NODE ENTITY_NODE PROCESSING_INSTRUCTION_NODE COMMENT_NODE DOCUMENT_NODE DOCUMENT_TYPE_NODE DOCUMENT_FRAGMENT_NODE NOTATION_NODE

  " HTML events and internal variables
  syntax case ignore
  syntax keyword javaScriptHtmlEvents     onblur onclick oncontextmenu ondblclick onfocus onkeydown onkeypress onkeyup onmousedown onmousemove onmouseout onmouseover onmouseup onresize
  syntax case match

" Follow stuff should be highligh within a special context
" While it can't be handled with context depended with Regex based highlight
" So, turn it off by default
if exists("javascript_enable_domhtmlcss")

    " DOM2 things
    syntax match javaScriptDomElemAttrs     contained /\%(nodeName\|nodeValue\|nodeType\|parentNode\|childNodes\|firstChild\|lastChild\|previousSibling\|nextSibling\|attributes\|ownerDocument\|namespaceURI\|prefix\|localName\|tagName\)\>/
    syntax match javaScriptDomElemFuncs     contained /\%(insertBefore\|replaceChild\|removeChild\|appendChild\|hasChildNodes\|cloneNode\|normalize\|isSupported\|hasAttributes\|getAttribute\|setAttribute\|removeAttribute\|getAttributeNode\|setAttributeNode\|removeAttributeNode\|getElementsByTagName\|getAttributeNS\|setAttributeNS\|removeAttributeNS\|getAttributeNodeNS\|setAttributeNodeNS\|getElementsByTagNameNS\|hasAttribute\|hasAttributeNS\)\>/ nextgroup=javaScriptParen skipwhite
    " HTML things
    syntax match javaScriptHtmlElemAttrs    contained /\%(className\|clientHeight\|clientLeft\|clientTop\|clientWidth\|dir\|id\|innerHTML\|lang\|length\|offsetHeight\|offsetLeft\|offsetParent\|offsetTop\|offsetWidth\|scrollHeight\|scrollLeft\|scrollTop\|scrollWidth\|style\|tabIndex\|title\)\>/
    syntax match javaScriptHtmlElemFuncs    contained /\%(blur\|click\|focus\|scrollIntoView\|addEventListener\|dispatchEvent\|removeEventListener\|item\)\>/ nextgroup=javaScriptParen skipwhite

    " CSS Styles in JavaScript
    syntax keyword javaScriptCssStyles      contained color font fontFamily fontSize fontSizeAdjust fontStretch fontStyle fontVariant fontWeight letterSpacing lineBreak lineHeight quotes rubyAlign rubyOverhang rubyPosition
    syntax keyword javaScriptCssStyles      contained textAlign textAlignLast textAutospace textDecoration textIndent textJustify textJustifyTrim textKashidaSpace textOverflowW6 textShadow textTransform textUnderlinePosition
    syntax keyword javaScriptCssStyles      contained unicodeBidi whiteSpace wordBreak wordSpacing wordWrap writingMode
    syntax keyword javaScriptCssStyles      contained bottom height left position right top width zIndex
    syntax keyword javaScriptCssStyles      contained border borderBottom borderLeft borderRight borderTop borderBottomColor borderLeftColor borderTopColor borderBottomStyle borderLeftStyle borderRightStyle borderTopStyle borderBottomWidth borderLeftWidth borderRightWidth borderTopWidth borderColor borderStyle borderWidth borderCollapse borderSpacing captionSide emptyCells tableLayout
    syntax keyword javaScriptCssStyles      contained margin marginBottom marginLeft marginRight marginTop outline outlineColor outlineStyle outlineWidth padding paddingBottom paddingLeft paddingRight paddingTop
    syntax keyword javaScriptCssStyles      contained listStyle listStyleImage listStylePosition listStyleType
    syntax keyword javaScriptCssStyles      contained background backgroundAttachment backgroundColor backgroundImage gackgroundPosition backgroundPositionX backgroundPositionY backgroundRepeat
    syntax keyword javaScriptCssStyles      contained clear clip clipBottom clipLeft clipRight clipTop content counterIncrement counterReset cssFloat cursor direction display filter layoutGrid layoutGridChar layoutGridLine layoutGridMode layoutGridType
    syntax keyword javaScriptCssStyles      contained marks maxHeight maxWidth minHeight minWidth opacity MozOpacity overflow overflowX overflowY verticalAlign visibility zoom cssText
    syntax keyword javaScriptCssStyles      contained scrollbar3dLightColor scrollbarArrowColor scrollbarBaseColor scrollbarDarkShadowColor scrollbarFaceColor scrollbarHighlightColor scrollbarShadowColor scrollbarTrackColor

    " Highlight ways
    syntax match javaScriptDotNotation      "\." nextgroup=javaScriptPrototype,javaScriptDomElemAttrs,javaScriptDomElemFuncs,javaScriptHtmlElemAttrs,javaScriptHtmlElemFuncs
    syntax match javaScriptDotNotation      "\.style\." nextgroup=javaScriptCssStyles

endif "DOM/HTML/CSS

"" end DOM/HTML/CSS specified things


"" Code blocks
syntax cluster javaScriptAll       contains=javaScriptComment,javaScriptLineComment,javaScriptDocComment,javaScriptStringD,javaScriptStringS,javaScriptRegexpString,javaScriptNumber,javaScriptFloat,javaScriptLabel,javaScriptSource,javaScriptType,javaScriptOperator,javaScriptBoolean,javaScriptNull,javaScriptFunction,javaScriptConditional,javaScriptRepeat,javaScriptBranch,javaScriptStatement,javaScriptGlobalObjects,javaScriptExceptions,javaScriptFutureKeys,javaScriptDomErrNo,javaScriptDomNodeConsts,javaScriptHtmlEvents,javaScriptDotNotation,javaScriptSpecialFn,javaScriptExtjsCore,javaScriptExtjsDateClass,javaScriptExtjsMisc,javaScriptExtjsClass,javaScriptIdentifier
syntax region  javaScriptBracket   matchgroup=javaScriptBracket transparent start="\[" end="\]" contains=@javaScriptAll,javaScriptParensErrB,javaScriptParensErrC,javaScriptBracket,javaScriptParen,javaScriptBlock,@htmlPreproc
syntax region  javaScriptParen     matchgroup=javaScriptParen   transparent start="("  end=")"  contains=@javaScriptAll,javaScriptParensErrA,javaScriptParensErrC,javaScriptParen,javaScriptBracket,javaScriptBlock,@htmlPreproc
syntax region  javaScriptBlock     matchgroup=javaScriptBlock   transparent start="{"  end="}"  contains=@javaScriptAll,javaScriptParensErrA,javaScriptParensErrB,javaScriptParen,javaScriptBracket,javaScriptBlock,@htmlPreproc 

"" catch errors caused by wrong parenthesis
syntax match   javaScriptParensError    ")\|}\|\]"
syntax match   javaScriptParensErrA     contained "\]"
syntax match   javaScriptParensErrB     contained ")"
syntax match   javaScriptParensErrC     contained "}"

if main_syntax == "javascript"
  syntax sync clear
  syntax sync ccomment javaScriptComment minlines=200
  syntax sync match javaScriptHighlight grouphere javaScriptBlock /{/
endif

"" Fold control
if exists("b:javascript_fold")
    syntax match   javaScriptFunction       /\<function\>/ nextgroup=javaScriptFuncName skipwhite
    syntax match   javaScriptOpAssign       /=\@<!=/ nextgroup=javaScriptFuncBlock skipwhite skipempty
    syntax region  javaScriptFuncName       contained matchgroup=javaScriptFuncName start=/\%(\$\|\w\)*\s*(/ end=/)/ contains=javaScriptLineComment,javaScriptComment nextgroup=javaScriptFuncBlock skipwhite skipempty
    syntax region  javaScriptFuncBlock      contained matchgroup=javaScriptFuncBlock start="{" end="}" contains=@javaScriptAll,javaScriptParensErrA,javaScriptParensErrB,javaScriptParen,javaScriptBracket,javaScriptBlock fold

    if &l:filetype=='javascript' && !&diff
      " Fold setting
      " Redefine the foldtext (to show a JS function outline) and foldlevel
      " only if the entire buffer is JavaScript, but not if JavaScript syntax
      " is embedded in another syntax (e.g. HTML).
      setlocal foldmethod=syntax
      setlocal foldlevel=4
    endif
else
    syntax keyword javaScriptFunction       function
    setlocal foldmethod<
    setlocal foldlevel<
endif

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_javascript_syn_inits")
  if version < 508
    let did_javascript_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif
  HiLink javaScriptComment              Comment
  HiLink javaScriptLineComment          Comment
  HiLink javaScriptDocComment           Comment
  HiLink javaScriptCommentTodo          Todo
  HiLink javaScriptCvsTag               Function
  HiLink javaScriptDocTags              Special
  HiLink javaScriptDocSeeTag            Function
  HiLink javaScriptDocParam             Function
  HiLink javaScriptStringS              String
  HiLink javaScriptStringD              String
  HiLink javaScriptRegexpString         String
  HiLink javaScriptCharacter            Character
  HiLink javaScriptPrototype            Type
  HiLink javaScriptConditional          Conditional
  HiLink javaScriptBranch               Conditional
  HiLink javaScriptRepeat               Repeat
  HiLink javaScriptStatement            Statement
  HiLink javaScriptFunction             Function
  HiLink javaScriptError                Error
  HiLink javaScriptParensError          Error
  HiLink javaScriptParensErrA           Error
  HiLink javaScriptParensErrB           Error
  HiLink javaScriptParensErrC           Error
  HiLink javaScriptOperator             Operator
  HiLink javaScriptIdentifier           Identifier
  HiLink javaScriptType                 Type
  HiLink javaScriptNull                 Type
  HiLink javaScriptNumber               Number
  HiLink javaScriptFloat                Number
  HiLink javaScriptBoolean              Boolean
  HiLink javaScriptLabel                Label
  HiLink javaScriptSpecial              Special
  HiLink javaScriptSource               Special
  HiLink javaScriptGlobalObjects        Special
  HiLink javaScriptExceptions           Special

  HiLink javaScriptDomErrNo             Constant
  HiLink javaScriptDomNodeConsts        Constant
  HiLink javaScriptDomElemAttrs         Label
  HiLink javaScriptDomElemFuncs         PreProc

  HiLink javaScriptHtmlEvents           Special
  HiLink javaScriptHtmlElemAttrs        Label
  HiLink javaScriptHtmlElemFuncs        PreProc

  HiLink javaScriptCssStyles            Label

  HiLink javaScriptExtjsMisc            Function
  HiLink javaScriptExtjsClass           Type
  HiLink javaScriptExtjsDateClass       Type
  HiLink javaScriptExtjsCore            Special
  HiLink javaScriptSpecialFn            Error
  delcommand HiLink
endif

" Define the htmlJavaScript for HTML syntax html.vim
"syntax clear htmlJavaScript
"syntax clear javaScriptExpression
syntax cluster  htmlJavaScript contains=@javaScriptAll,javaScriptBracket,javaScriptParen,javaScriptBlock,javaScriptParenError
syntax cluster  javaScriptExpression contains=@javaScriptAll,javaScriptBracket,javaScriptParen,javaScriptBlock,javaScriptParenError,@htmlPreproc

let b:current_syntax = "javascript"
if main_syntax == 'javascript'
  unlet main_syntax
endif

" vim: ts=4
