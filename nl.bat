@echo off
:: nl - number lines
:: Usage: nl [file]
if "%~1"=="" (
  powershell -NoLogo -NoProfile -Command "$i=1; [Console]::In.ReadToEnd().Split([Environment]::NewLine,[StringSplitOptions]::RemoveEmptyEntries) | ForEach-Object { '{0,6}  {1}' -f $i++, $_ }"
) else (
  powershell -NoLogo -NoProfile -Command "$i=1; Get-Content -- '%~1' | ForEach-Object { '{0,6}  {1}' -f $i++, $_ }"
)