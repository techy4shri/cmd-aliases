@echo off
:: touch.bat - Create files or update modified time (mtime)
:: Usage: touch file1 [file2 ...]
if "%~1"=="" (
  echo Usage: touch file1 [file2 ...]
  exit /b 1
)

:: Requires PowerShell (present on Win10/11 by default)
powershell -NoLogo -NoProfile -Command ^
  "foreach($p in $args){ if(Test-Path $p){ (Get-Item $p).LastWriteTime = Get-Date } else { New-Item -ItemType File -Path $p | Out-Null } }" %*
