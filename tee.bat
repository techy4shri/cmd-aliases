@echo off
setlocal
set "mode=Overwrite"
if /I "%~1"=="-a" (set "mode=Append" & shift)
if "%~1"=="" (echo Usage: tee [-a] ^<file^> & exit /b 1)
powershell -NoLogo -NoProfile -Command " [Console]::OpenStandardInput() | Out-String | Tee-Object -FilePath '%~1' -%mode% | Write-Output " 
endlocal