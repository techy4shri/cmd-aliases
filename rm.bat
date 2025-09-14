@echo off
setlocal enabledelayedexpansion
set "recurse=0"
set "force=0"
:parse
if "%~1"=="" goto done_parse
if /I "%~1"=="-r" (set "recurse=1" & shift & goto parse)
if /I "%~1"=="-f" (set "force=1" & shift & goto parse)
goto done_parse
:done_parse
if "%~1"=="" (echo Usage: rm [-r] [-f] ^<path^> [paths...] & exit /b 1)
:loop
if "%~1"=="" goto end
set "TARGET=%~1"
if exist "%TARGET%\NUL" (
  if "%recurse%"=="1" (
    if "%force%"=="1" (rmdir /S /Q "%TARGET%") else (rmdir /S "%TARGET%")
  ) else (
    echo rm: cannot remove "%TARGET%": Is a directory
  )
) else (
  if exist "%TARGET%" (
    if "%force%"=="1" (del /Q /F "%TARGET%") else (del "%TARGET%")
  ) else (
    if "%force%"=="1" (rem ignore missing) else (echo rm: cannot remove "%TARGET%": No such file or directory 1>&2)
  )
)
shift
goto loop
:end
endlocal