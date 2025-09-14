@echo off
:: rev - reverse lines from stdin or file
setlocal
if "%~1"=="" (
  powershell -NoLogo -NoProfile -Command "$in=[Console]::In.ReadToEnd().Split([Environment]::NewLine,[StringSplitOptions]::None); foreach($l in $in){ -join ($l.ToCharArray() | [Array]::Reverse([ref]($_=[char[]]$l)); $_) }"
) else (
  powershell -NoLogo -NoProfile -Command "Get-Content -- '%~1' | ForEach-Object { -join ($_.ToCharArray() | [Array]::Reverse([ref]($_=[char[]]$_)); $_) }"
)
endlocal