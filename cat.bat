@echo off
:: cat.bat - Print file contents
:: Usage: cat file1 [file2 ...]
if "%~1"=="" (
  :: No args: pass stdin to stdout (Ctrl+Z then Enter to end)
  more
  exit /b
)

for %%F in (%*) do (
  if exist "%%~F" (
    type "%%~F"
  ) else (
    echo cat: cannot access "%%~F": No such file or directory 1>&2
  )
)
