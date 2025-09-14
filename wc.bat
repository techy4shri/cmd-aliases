@echo off
setlocal
set "mode=all"
if /I "%~1"=="-l" (set "mode=l" & shift)
if /I "%~1"=="-w" (set "mode=w" & shift)
if /I "%~1"=="-c" (set "mode=c" & shift)
if "%~1"=="" (echo Usage: wc [-l|-w|-c] ^<file^> & exit /b 1)
powershell -NoLogo -NoProfile -Command ^
  "$t=Get-Content -- '%~1' -Raw; " ^
  "if('%mode%' -eq 'l'){($t -split "`r?`n").Count} " ^
  "elseif('%mode%' -eq 'w'){($t -split "\s+").Where({$_ -ne ''}).Count} " ^
  "elseif('%mode%' -eq 'c'){[Text.Encoding]::UTF8.GetByteCount($t)} " ^
  "else{ $lines=($t -split "`r?`n").Count; $words=($t -split "\s+").Where({$_ -ne ''}).Count; $chars=[Text.Encoding]::UTF8.GetByteCount($t); Write-Output "$lines $words $chars %~1" }"
endlocal