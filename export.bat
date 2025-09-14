@echo off
:: export NAME=VALUE
if "%~1"=="" (echo Usage: export NAME=VALUE & exit /b 1)
for /f "tokens=1,2 delims==" %%a in ("%~1") do set "%%a=%%b"