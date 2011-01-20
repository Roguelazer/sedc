BINARIES: LexerTest ParserTest

all: $(BINARIES)

Lexer.hs: Lexer.x
	alex $<

Parser.hs: Parser.y Absyn.hs
	happy $<

LexerTest: LexerTest.hs Lexer.hs
	ghc --make $<

ParserTest: ParserTest.hs Parser.hs Absyn.hs
	ghc --make $<

.PHONY : clean
clean:
	rm -rf Lexer.hs Parser.hs $(BINARIES) *.o *.hi
