@echo off
:: chown USER FILE...
:: Uses icacls to set owner; admin rights typically required.
if "%~2"=="" (echo Usage: chown ^<user^> ^<path^> [...] & exit /b 1)
set "owner=%~1"
shift
:loop
if "%~1"=="" goto end
icacls "%~1" /setowner "%owner%"
shift
goto loop
:end