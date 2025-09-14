@echo off
:: expr ARITH-EXPR (limited: arithmetic only)
if "%~1"=="" (echo Usage: expr ^<expression^> & exit /b 1)
setlocal
set "expr=%*"
powershell -NoLogo -NoProfile -Command "try{ [double]([scriptblock]::Create('%expr%').Invoke()) } catch { Write-Error 'expr: invalid expression' ; exit 2 }"
endlocal