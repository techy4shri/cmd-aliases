@echo off
if "%~1"=="" (echo Usage: which ^<name^> & exit /b 1)
where %*