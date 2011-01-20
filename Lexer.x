{
module Lexer (Token(..), alexScanTokens) where
}

%wrapper "basic"

$alphanum = [A-Za-z0-9_]

@comment = "#"[^\n]*
@label = ":"[a-zA-Z0-9]+
@string = \" [^\"\n]+ \"
@number = [0-9]+
@literal = $alphanum+

tokens :-
  ";"       { \yytext -> SEMICOLON }
  ","       { \yytext -> COMMA }
  "{"       { \yytext -> LBRACE }
  "}"       { \yytext -> RBRACE }
  "/"       { \yytext -> FSLASH }
  "p"       { \yytext -> CMD_p }
  "P"       { \yytext -> CMD_P }
  "s"       { \yytext -> CMD_s }
  @comment  ;
  $white    ;
  @label    { \yytext -> LABEL yytext }
  @string   { \yytext -> STRING yytext }
  @number   { \yytext -> NUMBER (read yytext) }
  @literal  { \yytext -> LIT yytext }
  .         { \yytext -> error ("Unexpected character '" ++ yytext ++ "'") }

{
data Token = 
    COLON | LBRACE | RBRACE | COMMA | SEMICOLON | FSLASH
    | LABEL String | STRING String | NUMBER Int | LIT String
    | CMD_p | CMD_P | CMD_s 
      deriving (Show)
}
