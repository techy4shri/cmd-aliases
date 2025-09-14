@echo off
setlocal
set "N=10"
if /I "%~1"=="-n" (set "N=%~2" & shift & shift)
if "%~1"=="" (echo Usage: head [-n N] ^<file^> & exit /b 1)
powershell -NoLogo -NoProfile -Command "Get-Content -TotalCount %N% -- '%~1'"
endlocal