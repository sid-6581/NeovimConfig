if exists("b:current_syntax")
   finish
endif

if getline(1) =~ "^ISA"
   let b:ISA = getline(1)
else
   finish
endif

let b:elmdl = b:ISA[3:3]
let b:subdl = b:ISA[104:104]
let b:segdl = b:ISA[105:105]

exe 'syn match x12ElmDelimiter "\v\' . b:elmdl . '"'
exe 'syn match x12SubDelimiter "\v\' . b:subdl . '"'
exe 'syn match x12SegDelimiter "\v\' . b:segdl . '"'
exe 'syn match x12Segments "\v^\w+"'
exe 'syn match x12Envelope "\v^(ISA|GS|ST|SE|GE|IEA)"'
exe 'syn match x12Identifier "\v^(NM1)"'
exe 'syn match x12Special "\v^(CLM|EB)"'

let b:current_syntax = "x12"

hi def link x12ElmDelimiter  Constant
hi def link x12SubDelimiter  PreProc
hi def link x12SegDelimiter  Operator
hi def link x12Envelope      Title
hi def link x12Segments      Type
hi def link x12Identifier    Identifier
hi def link x12Special       Special
