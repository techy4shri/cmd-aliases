@echo off
setlocal
set "recurse=0"
if /I "%~1"=="-r" (set "recurse=1" & shift)
if "%~1"=="" (echo Usage: rmdir [-r] ^<dir^> [...] & exit /b 1)
:loop
if "%~1"=="" goto end
if not exist "%~1\NUL" (echo rmdir: "%~1": Not a directory & shift & goto loop)
if "%recurse%"=="1" (rmdir /S "%~1") else (rmdir "%~1")
shift
goto loop
:end
endlocal