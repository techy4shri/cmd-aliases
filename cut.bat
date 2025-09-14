@echo off
:: cut -d DELIM -f FIELDS file
:: Supports: -d <delim>, -f <1,2,5>  (no ranges)
setlocal
set "del=,"
set "fields="
:parse
if "%~1"=="" goto done
if /I "%~1"=="-d" (set "del=%~2" & shift & shift & goto parse)
if /I "%~1"=="-f" (set "fields=%~2" & shift & shift & goto parse)
goto done
:done
if "%fields%"=="" (echo Usage: cut -d ^<delim^> -f ^<fields^> ^<file^> & exit /b 1)
if "%~1"=="" (echo Usage: cut -d ^<delim^> -f ^<fields^> ^<file^> & exit /b 1)
powershell -NoLogo -NoProfile -Command "$f='%~1'; $d='%del%'; $idx=('%fields%'.Split(',') | ForEach-Object { [int]$_ - 1 }); Get-Content -- $f | ForEach-Object { $p = $_ -split [regex]::Escape($d); ($idx | ForEach-Object { if($_ -lt $p.Count){ $p[$_] } }) -join $d }"
endlocal