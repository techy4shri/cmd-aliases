@echo off
:: split -l LINES FILE [PREFIX]
:: default LINES=1000, PREFIX=xa
setlocal
set "lines=1000"
if /I "%~1"=="-l" (set "lines=%~2" & shift & shift)
if "%~1"=="" (echo Usage: split [-l N] ^<file^> [prefix] & exit /b 1)
set "file=%~1"
set "prefix=xa"
if not "%~2"=="" set "prefix=%~2"
powershell -NoLogo -NoProfile -Command "$n=%lines%; $p='%prefix%'; $i=0; $j=0; $writer=$null; function name($k){ $letters='abcdefghijklmnopqrstuvwxyz'; $a=[int]($k/26); $b=$k%%26; return $p + $letters[$a] + $letters[$b] }; Get-Content -- '%file%' | ForEach-Object { if(($i%%$n) -eq 0){ if($writer){ $writer.Close() }; $out = name($j++); $writer = New-Object System.IO.StreamWriter($out) }; $writer.WriteLine($_); $i++ } ; if($writer){ $writer.Close() }"
endlocal