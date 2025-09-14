@echo off
:: sed 's/old/new/g' file   (very limited: only global substitute s///g)
setlocal
if "%~1"=="" (echo Usage: sed "s/old/new/g" ^<file^> & exit /b 1)
set "expr=%~1"
if /I not "!expr:~0,2!"=="s/" (echo sed: only s/old/new/g supported & exit /b 1)
for /f "tokens=1-4 delims=/" %%a in ("%expr%") do (
  set "A=%%a" & set "OLD=%%b" & set "NEW=%%c" & set "FLAGS=%%d"
)
if "%~2"=="" (echo Usage: sed "s/old/new/g" ^<file^> & exit /b 1)
powershell -NoLogo -NoProfile -Command "$old = [regex]::Escape('%OLD%'); $new = '%NEW%'; Get-Content -- '%~2' | ForEach-Object { $_ -replace $old, $new }"
endlocal