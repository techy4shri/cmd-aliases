@echo off
:: realpath PATH
if "%~1"=="" (echo Usage: realpath ^<path^> & exit /b 1)
powershell -NoLogo -NoProfile -Command "$p = Resolve-Path -LiteralPath -- '%~1' -ErrorAction SilentlyContinue; if($p){ $p.Path } else { Write-Error 'realpath: cannot resolve path' }"