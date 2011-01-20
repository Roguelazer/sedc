import Parser
import System (getArgs)

main :: IO ()
main = do 
  args <- System.getArgs
  let filename = case args of
                   [arg] -> arg
                   _ -> error "exactly one filename expected" 
  fileContents <- readFile filename
  absyn <- Parser.parseFile filename
  putStr (show absyn ++ "\n")

-- vim: set expandtab sw=4 ts=4 sts=0:
