@echo off
powershell -NoLogo -NoProfile -Command ^
  "Get-PSDrive -PSProvider FileSystem | Select-Object Name, @{n='Used(GB)';e={[math]::Round(($_.Used/1GB),2)}}, @{n='Free(GB)';e={[math]::Round(($_.Free/1GB),2)}} | Format-Table -AutoSize"