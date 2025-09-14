@echo off
:: sha256sum file1 [file2 ...]
if "%~1"=="" (echo Usage: sha256sum ^<file^> [...] & exit /b 1)
:loop
if "%~1"=="" goto end
powershell -NoLogo -NoProfile -Command "$h=Get-FileHash -Algorithm SHA256 -- '%~1'; Write-Output \"$($h.Hash.ToLower())  %~nx1\""
shift
goto loop
:end