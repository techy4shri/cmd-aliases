@echo off
:: yes [STRING]
setlocal
set "s=y"
if not "%~1"=="" set "s=%*"
:loop
echo %s%
goto loop
endlocal