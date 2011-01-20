{
module Parser(parseFile) where
import Lexer
import Absyn
}

%name doParse Statements

%tokentype { Token }

%token
    num   { NUMBER $$ }
	str   { STRING $$ }
	lit   { LIT $$ }
    lb   { LBRACE }
    rb   { RBRACE }
    comma   { COMMA }
	semi    { SEMICOLON }
	p   { CMD_p }
	P   { CMD_P }
	s   { CMD_s }
	fslash { FSLASH }
	label { LABEL $$ }

%error { parseError}

%%

Command : p         { Print }
		| P         { Print_P }
		| s fslash RegexContents fslash lit fslash { Sub $3 $5 }
		| label       { Label $1 }

Statement: Address Statement    { AddressedCommand $1 $2 }
         | Command              { Command $1 }
		 | lb Statements rb     { Block $2 }

Statements : { [] }
		   | Statement Statements { $1 : $2 }
		   | Statement semi Statements { $1 : $3 }

Regex : fslash RegexContents fslash { $2 }

RegexContents : lit     { RELiteral $1 }

Address : num { DirectAddress $1 }
        | Address comma Address { AddressRange $1 $3 }
		| Regex { AddressRE $1 }


{
parseError :: [Token] -> a
parseError toks =
    error ("Parse error" ++ lcn ++ "\n")
       where 
         lcn = case toks of
                 [] -> " at end of file"
                 toks -> ", before toksns " ++ show (take 5 toks)

parseFile filename = 
    do 
        code <- readFile filename
        let tokens = alexScanTokens code
        let absyn = doParse tokens
        return absyn
}

-- vim: set syntax=haskell sw=4 ts=4 sts=0:
