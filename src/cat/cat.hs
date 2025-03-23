import System.IO
import System.Environment (getArgs)

main :: IO ()
main = do
  args <- getArgs
  case args of
    (fileName:_) -> do
      contents <- readFile fileName
      putStr contents 
    [] -> putStrLn "Error: not input files"
