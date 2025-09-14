@echo off
:: ln [-s|-H|-J] TARGET LINKNAME
:: -s symlink (auto /D for directories)
:: -H hard link (files only)
:: -J junction (directories)
if "%~3"=="" (echo Usage: ln [-s ^| -H ^| -J] ^<target^> ^<linkname^> & exit /b 1)
set "mode=%~1"
set "target=%~2"
set "link=%~3"
if /I "%mode%"=="-s" (
  if exist "%target%\NUL" (
    mklink /D "%link%" "%target%"
  ) else (
    mklink "%link%" "%target%"
  )
) else if /I "%mode%"=="-H" (
  mklink /H "%link%" "%target%"
) else if /I "%mode%"=="-J" (
  mklink /J "%link%" "%target%"
) else (
  echo ln: unknown mode "%mode%"
  exit /b 1
)