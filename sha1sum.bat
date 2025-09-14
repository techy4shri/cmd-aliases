@echo off
if "%~1"=="" (echo Usage: sha1sum ^<file^> [...] & exit /b 1)
:loop
if "%~1"=="" goto end
powershell -NoLogo -NoProfile -Command "$h=Get-FileHash -Algorithm SHA1 -- '%~1'; Write-Output \"$($h.Hash.ToLower())  %~nx1\""
shift
goto loop
:end