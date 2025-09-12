@echo off
:: cp - copy files/folders
:: Usage:
::   cp [-f] <src_file> <dest_file_or_dir>
::   cp -r [-f] <src_dir> <dest_dir>
setlocal enabledelayedexpansion

set "recurse=0"
set "force="
:parse
if "%~1"=="" goto args_done
if /I "%~1"=="-r" (set "recurse=1" & shift & goto parse)
if /I "%~1"=="-f" (set "force=/Y" & shift & goto parse)
:args_done

if "%~1"=="" (
  echo Usage: cp [-r] [-f] ^<src^> ^<dest^>
  exit /b 1
)
if "%~2"=="" (
  echo cp: missing destination operand
  exit /b 1
)

set "SRC=%~1"
set "DST=%~2"

:: Directory copy requires -r; use robocopy for reliability
if exist "%SRC%\NUL" (
  if "%recurse%"=="1" (
    :: robocopy returns 1 for success-with-copies; treat 0..7 as success
    robocopy "%SRC%" "%DST%" /E /NFL /NDL /NJH /NJS /NC /NS >nul
    set "rc=%ERRORLEVEL%"
    if %rc% lss 8 (exit /b 0) else (exit /b %rc%)
  ) else (
    echo cp: -r not specified; omitting directory "%SRC%"
    exit /b 1
  )
) else (
  :: File copy
  if exist "%DST%\NUL" (
    copy %force% "%SRC%" "%DST%" >nul
  ) else (
    copy %force% "%SRC%" "%DST%" >nul
  )
)
endlocal
