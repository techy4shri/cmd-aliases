@echo off
setlocal
set "force="
if /I "%~1"=="-9" (set "force=/F" & shift)
if "%~1"=="" (echo Usage: kill [-9] ^<PID^|name^> & exit /b 1)
echo %~1 | findstr /R "^[0-9][0-9]*$" >nul
if %errorlevel%==0 (
  taskkill %force% /PID %~1
) else (
  taskkill %force% /IM "%~1"
)
endlocal