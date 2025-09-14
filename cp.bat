@echo off
setlocal enabledelayedexpansion
set "recurse=0"
set "force="
:parse
if "%~1"=="" goto args_done
if /I "%~1"=="-r" (set "recurse=1" & shift & goto parse)
if /I "%~1"=="-f" (set "force=/Y" & shift & goto parse)
:args_done
if "%~1"=="" (echo Usage: cp [-r] [-f] ^<src^> ^<dest^> & exit /b 1)
if "%~2"=="" (echo cp: missing destination operand & exit /b 1)
set "SRC=%~1"
set "DST=%~2"
if exist "%SRC%\NUL" (
  if "%recurse%"=="1" (
    robocopy "%SRC%" "%DST%" /E >nul
  ) else (
    echo cp: -r not specified; omitting directory "%SRC%"
    exit /b 1
  )
) else (
  copy %force% "%SRC%" "%DST%" >nul
)
endlocal