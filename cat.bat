@echo off
:: cat.bat - Print file contents
if "%~1"=="" (
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