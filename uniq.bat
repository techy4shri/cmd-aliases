@echo off
:: uniq - filter adjacent duplicates; -c counts; -i ignore case
:: Usage: uniq [-c] [-i] [file]
setlocal
set "count=0"
set "ignore=0"
:parse
if "%~1"=="" goto done
if /I "%~1"=="-c" (set "count=1" & shift & goto parse)
if /I "%~1"=="-i" (set "ignore=1" & shift & goto parse)
goto done
:done
if "%~1"=="" (
  powershell -NoLogo -NoProfile -Command "$lines = [Console]::In.ReadToEnd().Split([Environment]::NewLine,[StringSplitOptions]::RemoveEmptyEntries); $prev=$null; $n=0; foreach($l in $lines){ $cmp=$l; if('%ignore%' -eq '1'){ $cmp=$l.ToLowerInvariant() }; if($prev -eq $null -or $cmp -ne $prev){ if($prev -ne $null -and '%count%' -eq '1'){ Write-Output \"${n} $last\" } elseif($prev -ne $null){ Write-Output $last }; $n=1; $prev=$cmp; $last=$l } else { $n++ } } ; if($prev -ne $null){ if('%count%' -eq '1'){ Write-Output \"${n} $last\" } else { Write-Output $last } }"
) else (
  powershell -NoLogo -NoProfile -Command "$lines = Get-Content -- '%~1'; $prev=$null; $n=0; foreach($l in $lines){ $cmp=$l; if('%ignore%' -eq '1'){ $cmp=$l.ToLowerInvariant() }; if($prev -eq $null -or $cmp -ne $prev){ if($prev -ne $null -and '%count%' -eq '1'){ Write-Output \"${n} $last\" } elseif($prev -ne $null){ Write-Output $last }; $n=1; $prev=$cmp; $last=$l } else { $n++ } } ; if($prev -ne $null){ if('%count%' -eq '1'){ Write-Output \"${n} $last\" } else { Write-Output $last } }"
)
endlocal