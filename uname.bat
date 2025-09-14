@echo off
powershell -NoLogo -NoProfile -Command ^
  "$v=[System.Environment]::OSVersion.VersionString; $arch=$env:PROCESSOR_ARCHITECTURE; $host=(Get-CimInstance Win32_ComputerSystem).Model; Write-Output "Windows $v $arch ($host)""