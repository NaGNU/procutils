# NaGNU by Nikita Shyshatksy (Holos) 27.07.25

import os

when defined(nanoKernel):
  proc getKernelUserName(): string =
    result = "root"

proc getUserName(): string =
  when defined(linux):
    result = getEnv("USER")
  elif defined(nanoKernel):
    result = getKernelUserName()
  else:
    result = "unknown"

echo getUserName()
