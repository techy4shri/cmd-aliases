@echo off
:: sort - sort lines; supports -r (reverse), -u (unique)
:: Usage: sort [-r] [-u] [file]
setlocal
set "rev="
set "uniq="
:parse
if "%~1"=="" goto done
if /I "%~1"=="-r" (set "rev=-Descending" & shift & goto parse)
if /I "%~1"=="-u" (set "uniq=1" & shift & goto parse)
goto done
:done
if "%~1"=="" (
  powershell -NoLogo -NoProfile -Command "$c = [Console]::In.ReadToEnd().Split([Environment]::NewLine,[StringSplitOptions]::None); $c = $c | Where-Object { $_ -ne '' } | Sort-Object %rev% ; if('%uniq%' -eq '1'){ $c = $c | Get-Unique }; $c"
) else (
  powershell -NoLogo -NoProfile -Command "$c = Get-Content -- '%~1'; $c = $c | Sort-Object %rev% ; if('%uniq%' -eq '1'){ $c = $c | Get-Unique }; $c"
)
endlocal