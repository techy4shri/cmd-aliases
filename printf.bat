@echo off
:: printf FORMAT [ARGS...] (very minimal: writes args without newline)
:: Example: printf "Hello %s" world
setlocal enabledelayedexpansion
if "%~1"=="" (exit /b 0)
set "fmt=%~1"
shift
powershell -NoLogo -NoProfile -Command "$fmt = @'
%fmt%
'@; $argsList = @(%*); try { $out = [string]::Format($fmt, $argsList); Write-Host -NoNewline $out } catch { Write-Host -NoNewline ($fmt -replace '%%','%') -NoNewline; if($argsList.Count -gt 0){ Write-Host -NoNewline (' ' + ($argsList -join ' ')) } }"
endlocal