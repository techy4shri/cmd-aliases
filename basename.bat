@echo off
:: basename PATH [SUFFIX]
setlocal enabledelayedexpansion
if "%~1"=="" (echo Usage: basename ^<path^> [suffix] & exit /b 1)
set "name=%~nx1"
if not "%~2"=="" (
  set "suf=%~2"
  if /I "!name:~-len=%suf%!"=="%suf%" (
    set "name=!name:~0,-%len=%suf%%!"
  ) else (
    rem no-op
  )
) else (
  rem no suffix removal
)
echo !name!
endlocal