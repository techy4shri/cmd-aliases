@echo off
:: Adds the folder containing this script to the PATH for the current user
set "HERE=%~dp0"
for %%I in ("%HERE:~0,-1%") do set "HERE=%%~fI"
echo Adding "%HERE%" to PATH for current user...
setx PATH "%PATH%;%HERE%"
echo Done. Open a new CMD window to use the commands.
