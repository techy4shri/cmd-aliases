@echo off
:: awk - very limited print fields
:: Usage: awk [-F delim] "{print $1,$3}" file
setlocal
set "del= "
if /I "%~1"=="-F" (set "del=%~2" & shift & shift)
set "prog=%~1"
set "file=%~2"
if "%prog%"=="" (echo Usage: awk [-F ^<delim^>] "{print $1,$2}" ^<file^> & exit /b 1)
if "%file%"=="" (echo Usage: awk [-F ^<delim^>] "{print $1,$2}" ^<file^> & exit /b 1)
powershell -NoLogo -NoProfile -Command "$d='%del%'; $prog='%prog%'; $fields = [regex]::Matches($prog, '\$(\d+)') | ForEach-Object { [int]$_.Groups[1].Value - 1 }; Get-Content -- '%file%' | ForEach-Object { $p = $_ -split [regex]::Escape($d); ($fields | ForEach-Object { if($_ -lt $p.Count){ $p[$_] } }) -join ' ' }"
endlocal