@echo off
:: tr - translate or delete characters
:: Usage: tr SET1 SET2    (one-to-one map)
::    or: tr -d SET       (delete)
setlocal enabledelayedexpansion
if /I "%~1"=="-d" (
  set "del=%~2"
  powershell -NoLogo -NoProfile -Command "$del='%del%'; $map = @{}; $in = [Console]::In.ReadToEnd(); $out = -join ($in.ToCharArray() | Where-Object { $del.IndexOf($_) -lt 0 }); [Console]::Write($out)"
  exit /b
)
if "%~2"=="" (echo Usage: tr SET1 SET2 ^| tr -d SET  & exit /b 1)
powershell -NoLogo -NoProfile -Command "$a='%~1'; $b='%~2'; if($a.Length -ne $b.Length){ Write-Error 'tr: SET1 and SET2 must be same length'; exit 1 }; $map=@{}; for($i=0;$i -lt $a.Length;$i++){ $map[$a[$i]]=$b[$i] }; $in=[Console]::In.ReadToEnd(); $sb = New-Object System.Text.StringBuilder; foreach($ch in $in.ToCharArray()){ if($map.ContainsKey($ch)){ [void]$sb.Append($map[$ch]) } else { [void]$sb.Append($ch) } }; [Console]::Write($sb.ToString())"
endlocal