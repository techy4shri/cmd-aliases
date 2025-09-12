@echo off
:: ls.bat - Minimal ls for CMD with a few Linux-like flags
::   -a  show hidden/system files
::   -l  long listing (owner, timestamp)
::   -al or -la  combine -a and -l
::   -R  recursive
:: Usage: ls [-a] [-l] [-al|-la] [-R] [path]
setlocal enabledelayedexpansion

set "showAll=0"
set "long=0"
set "recurse=0"
set "target="

:: Parse args
for %%A in (%*) do (
  set "arg=%%~A"
  if "!arg:~0,1!"=="-" (
    if /I "!arg!"=="-a"  set "showAll=1"
    if /I "!arg!"=="-l"  set "long=1"
    if /I "!arg!"=="-al" (set "showAll=1" & set "long=1")
    if /I "!arg!"=="-la" (set "showAll=1" & set "long=1")
    if /I "!arg!"=="-R"  set "recurse=1"
  ) else (
    if defined target (set "target=!target! %%~A") else (set "target=%%~A")
  )
)

if not defined target set "target=."

:: Build DIR options
set "opts="
if %showAll%==1 (set "opts=!opts! /A") else (set "opts=!opts! /A:-H")
if %recurse%==1 (set "opts=!opts! /S")
if %long%==1 (set "opts=!opts! /Q /T:W") else (set "opts=!opts! /B")

dir!opts! "%target%"
endlocal
