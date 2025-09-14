@echo off
:: paste FILE1 FILE2  (tab-delimited)
if "%~2"=="" (echo Usage: paste ^<file1^> ^<file2^> & exit /b 1)
powershell -NoLogo -NoProfile -Command "$a=Get-Content -- '%~1'; $b=Get-Content -- '%~2'; $m=[Math]::Max($a.Count,$b.Count); for($i=0;$i -lt $m;$i++){ $x=''; $y=''; if($i -lt $a.Count){$x=$a[$i]}; if($i -lt $b.Count){$y=$b[$i]}; Write-Output ($x + \"`t\" + $y) }"