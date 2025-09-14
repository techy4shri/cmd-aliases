@echo off
:: cal - show calendar of current month/year
:: Usage: cal [month] [year]
powershell -NoLogo -NoProfile -Command ^
  "$m=$args[0];$y=$args[1]; if(-not $m){{$m=(Get-Date).Month}}; if(-not $y){{$y=(Get-Date).Year}}; $d=1..31|%{{ [datetime]::new($y,$m,$_)} } 2>$null; $days=$d|?{{$_.Month -eq $m}}; $first=$days[0].DayOfWeek.value__; $names='Su Mo Tu We Th Fr Sa'; Write-Output $names; $out='   '*$first; foreach($day in $days){{ $out+='{0,2} ' -f $day.Day; if($day.DayOfWeek.value__ -eq 6){{Write-Output $out; $out='' }}}; if($out){{Write-Output $out}}"