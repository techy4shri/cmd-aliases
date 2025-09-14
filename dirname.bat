@echo off
:: dirname PATH
if "%~1"=="" (echo Usage: dirname ^<path^> & exit /b 1)
powershell -NoLogo -NoProfile -Command "Split-Path -Parent -- '%~1'"