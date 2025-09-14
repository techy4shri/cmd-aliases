@echo off
setlocal enabledelayedexpansion
set "opts="
:parse
if "%~1"=="" goto done
set "a=%~1"
if "!a:~0,1!"=="-" (
  if /I "%~1"=="-i" set "opts=!opts! /I"
  if /I "%~1"=="-n" set "opts=!opts! /N"
  if /I "%~1"=="-r" set "opts=!opts! /S"
  if /I "%~1"=="-w" set "opts=!opts! /R"
  shift & goto parse
)
:done
if "%~1"=="" (echo Usage: grep [opts] ^<pattern^> [files...] & exit /b 1)
set "pattern=%~1"
shift
if "%~1"=="" (set "files=." & set "opts=%opts% /S /P") else (set "files=%*")
findstr %opts% /C:"%pattern%" %files%
endlocal