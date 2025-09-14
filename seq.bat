@echo off
:: seq [FIRST [INCREMENT]] LAST
setlocal enabledelayedexpansion
if "%~1"=="" (echo Usage: seq ^<last^> ^| seq ^<first^> ^<last^> ^| seq ^<first^> ^<inc^> ^<last^> & exit /b 1)
set /a count=%#
set "first=1"
set "inc=1"
set "last=%~1"
if not "%~2"=="" (
  set "first=%~1"
  set "last=%~2"
  if not "%~3"=="" (
    set "inc=%~2"
    set "last=%~3"
    set "first=%~1"
  )
)
powershell -NoLogo -NoProfile -Command "$f=[double]('%first%'); $i=[double]('%inc%'); $l=[double]('%last%'); if($i -eq 0){exit 1}; if(($i -gt 0) -and ($f -le $l)){ for($x=$f; $x -le $l; $x+=$i){ $x } } elseif(($i -lt 0) -and ($f -ge $l)){ for($x=$f; $x -ge $l; $x+=$i){ $x } }"
endlocal