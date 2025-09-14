@echo off
:: join -t DELIM FILE1 FILE2 (join on first field; files should be sorted)
setlocal
set "del= "
if /I "%~1"=="-t" (set "del=%~2" & shift & shift)
if "%~2"=="" (echo Usage: join [-t ^<delim^>] ^<file1^> ^<file2^> & exit /b 1)
set "f1=%~1"
set "f2=%~2"
powershell -NoLogo -NoProfile -Command "$d='%del%'; $h=@{}; Get-Content -- '%f2%' | ForEach-Object { $p = $_ -split [regex]::Escape($d),2; if($p.Length -gt 0){ $h[$p[0]] = $_ } }; Get-Content -- '%f1%' | ForEach-Object { $p = $_ -split [regex]::Escape($d),2; if($p.Length -gt 0 -and $h.ContainsKey($p[0])){ Write-Output ($_ + '$d' + ($h[$p[0]] -replace '^[^'] + [regex]::Escape($d),'') ) } }"
endlocal