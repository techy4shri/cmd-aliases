@echo off
setlocal
set "N=10"
if /I "%~1"=="-n" (set "N=%~2" & shift & shift)
if "%~1"=="" (echo Usage: tail [-n N] ^<file^> & exit /b 1)
powershell -NoLogo -NoProfile -Command "Get-Content -Tail %N% -- '%~1'"
endlocal