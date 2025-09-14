@echo off
:: date [+FORMAT] (supports tokens: %Y %m %d %H %M %S)
setlocal
set "fmt="
if not "%~1"=="" (
  set "first=%~1"
  if "!first:~0,1!"=="+" set "fmt=!first:~1!"
)
if "%fmt%"=="" (
  powershell -NoLogo -NoProfile -Command "Get-Date"
) else (
  set "pfmt=%fmt%"
  set "pfmt=!pfmt:%%Y=yyyy!"
  set "pfmt=!pfmt:%%m=MM!"
  set "pfmt=!pfmt:%%d=dd!"
  set "pfmt=!pfmt:%%H=HH!"
  set "pfmt=!pfmt:%%M=mm!"
  set "pfmt=!pfmt:%%S=ss!"
  powershell -NoLogo -NoProfile -Command "Get-Date -Format '%pfmt%'"
)
endlocal