@echo off
:: xargs -n1 cmd (runs CMD for each line from stdin)
:: Usage: somecmd | xargs [-n N] command
setlocal
set "N=1"
if /I "%~1"=="-n" (set "N=%~2" & shift & shift)
if "%~1"=="" (echo Usage: xargs [-n N] ^<command^> & exit /b 1)
set "CMD=%*"
powershell -NoLogo -NoProfile -Command "$buf=@(); $n=%N%; $cmd='%CMD%'; $input = [Console]::In.ReadToEnd().Split([Environment]::NewLine,[StringSplitOptions]::RemoveEmptyEntries); foreach($line in $input){ $buf += $line; if($buf.Count -ge $n){ & cmd /c $cmd $buf; $buf=@() } }; if($buf.Count -gt 0){ & cmd /c $cmd $buf }"
endlocal