@echo off
setlocal
set "parents="
if /I "%~1"=="-p" (set "parents=1" & shift)
if "%~1"=="" (echo Usage: mkdir [-p] ^<dir^> [...] & exit /b 1)
:loop
if "%~1"=="" goto done
if defined parents (
  md "%~1" 2>nul
) else (
  if exist "%~1" (echo mkdir: cannot create directory "%~1": File exists & exit /b 1)
  md "%~1"
)
shift
goto loop
:done
endlocal