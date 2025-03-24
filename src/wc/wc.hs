-- NaGNU/nasralutils/wc
-- by ruzen42

import System.Environment (getArgs)
import qualified Data.Text as T
import qualified Data.Text.IO as TIO

countText :: T.Text -> (Int, Int, Int)
countText txt = (lineCount, wordCount, charCount)
  where
    lineCount = length $ T.lines txt
    wordCount = length $ T.words txt
    charCount = T.length txt 

wcFile :: FilePath -> IO ()
wcFile path = do
  content <- TIO.readFile path
  let (l, w, c) = countText content
  putStrLn $ unwords [show l, show w, show c, path]

wcStdin :: IO ()
wcStdin = do
  content <- TIO.getContents
  let (l, w, c) = countText content
  putStrLn $ unwords [show l, show w, show c]

main :: IO ()
main = do
  args <- getArgs 
  if null args
    then wcStdin
    else mapM_ wcFile args
