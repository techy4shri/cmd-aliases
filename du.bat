@echo off
set "p=."
if not "%~1"=="" set "p=%~1"
powershell -NoLogo -NoProfile -Command ^
  "$p='%p%'; $s=(Get-ChildItem -LiteralPath $p -Recurse -Force -ErrorAction SilentlyContinue | Measure-Object -Property Length -Sum).Sum; if(!$s){$s=0};" ^
  "function Human($b){$u='B,KB,MB,GB,TB,PB'.Split(',');$i=0;while($b -ge 1024 -and $i -lt $u.Length-1){$b=[math]::Round($b/1024,2);$i++};"$b $($u[$i])"};" ^
  "Write-Output "$(Human $s)  `t$p""