# NaGNU by Nikita Shyshatksy (Holos) 27.07.25

import os, times

var params = commandLineParams()

if params.len < 1:
  echo "Usage: touchf [FILE_NAME]"
  quit(1)

var fileName = params[0]

if not fileExists(fileName):
  let f = open(fileName, fmWrite)
  defer: close(f)
  if f == nil:
    echo "Error creating file: ", fileName
    quit(1)
  echo "File created: ", fileName
else:
  var f: File
  if open(f, fileName, fmAppend):
    close(f)
    echo "File touched: ", fileName
  else:
    echo "Error touching file: ", fileName
    quit(1)
