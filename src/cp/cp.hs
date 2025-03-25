-- NaGNU/nasralutils/cp
-- by ruzen42

import System.Directory (copyFile)
import System.Environment (getArgs)
import System.Exit (die)

main :: IO ()
main = do
  args <- getArgs
  case args of
    [src, dst] -> do
      copyFile src dst
    _ -> die "Error: must 2 arguments"
  putStrLn "ready"


  
