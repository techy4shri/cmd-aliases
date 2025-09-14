@echo off
:: touch.bat - Create files or update modified time (mtime)
if "%~1"=="" (
  echo Usage: touch file1 [file2 ...]
  exit /b 1
)
powershell -NoLogo -NoProfile -Command ^
  "foreach($p in $args){ if(Test-Path $p){ (Get-Item $p).LastWriteTime = Get-Date } else { New-Item -ItemType File -Path $p | Out-Null } }" %*