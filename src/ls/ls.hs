import System.Directory
import System.Environment (getArgs)

main :: IO ()
main = do
  args <- getArgs
  case args of
    (directory:_) -> do
      contents <- getDirectoryContents directory 
      putStrLn $ unwords contents
    [] -> do 
      dir <- getCurrentDirectory
      contents <- getDirectoryContents dir
      putStrLn $ unwords contents
