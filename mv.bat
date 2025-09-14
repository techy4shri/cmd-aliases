@echo off
setlocal
set "force="
if /I "%~1"=="-f" (set "force=/Y" & shift)
if "%~2"=="" (echo Usage: mv [-f] ^<src^> ^<dest^> & exit /b 1)
move %force% "%~1" "%~2"
endlocal