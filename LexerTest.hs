import Lexer
import System (getArgs)

main :: IO ()
main = do 
       args <- System.getArgs
       let filename = case args of
                        [arg] -> arg
                        _ -> error "exactly one filename expected" 
       fileContents <- readFile filename
       let tokens = Lexer.alexScanTokens fileContents
       putStrLn (show tokens)

-- vim: set expandtab sw=4 ts=4 sts=0:
