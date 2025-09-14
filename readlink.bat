@echo off
:: readlink PATH
if "%~1"=="" (echo Usage: readlink ^<path^> & exit /b 1)
powershell -NoLogo -NoProfile -Command "$i = Get-Item -Force -- '%~1' -ErrorAction SilentlyContinue; if(!$i){ Write-Error 'readlink: no such file'; exit 1 }; if($i.LinkType){ $t = $i.Target; if($t -is [array]){ $t -join [Environment]::NewLine } else { $t } } else { Write-Error 'readlink: not a link'; exit 1 }"