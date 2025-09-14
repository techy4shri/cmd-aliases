@echo off
if "%~1"=="" (echo Usage: find ^<pattern^> [start_dir] & exit /b 1)
set "start=%CD%"
if not "%~2"=="" set "start=%~2"
dir /S /B "%start%\%~1"