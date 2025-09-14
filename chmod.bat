@echo off
:: chmod (very limited Windows shim)
:: Supports flags like +r -r +h -h +s -s +a -a on files/dirs.
:: Numeric modes and user classes (u,g,o) are not supported on NTFS.
if "%~2"=="" (echo Usage: chmod ^<+/-rhs a^> ^<path^> [...] & echo Example: chmod +r -h file.txt & exit /b 1)
setlocal enabledelayedexpansion
set "flags=%~1"
shift
set "plus="
set "minus="
for /l %%i in (0,1,7) do (
  rem noop loop filler
)
echo %flags% | find "+" >nul && set "plus=1"
echo %flags% | find "-" >nul && set "minus=1"
set "opts="
echo %flags% | find "r" >nul && set "opts=!opts! R"
echo %flags% | find "h" >nul && set "opts=!opts! H"
echo %flags% | find "s" >nul && set "opts=!opts! S"
echo %flags% | find "a" >nul && set "opts=!opts! A"
if not defined opts (echo chmod: no valid flags (use r,h,s,a with + or -) & exit /b 1)
:loop
if "%~1"=="" goto end
if defined plus (
  for %%F in (%~1) do attrib +%opts% "%%~fF"
) else if defined minus (
  for %%F in (%~1) do attrib -%opts% "%%~fF"
) else (
  echo chmod: expected + or - flags
  exit /b 1
)
shift
goto loop
:end
endlocal