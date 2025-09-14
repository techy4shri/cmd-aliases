# CMD Linux-Like Toolkit (Batch + PowerShell)

A tiny set of batch scripts that make Windows CMD feel a bit more like Linux. I made these back when I started using wsl and in vs code terminals so feel free to modify them as you like to suit your system and needs :)
This has been extended to 50 commands now, and is more like a tiny GNU Core Util for Linux commands in Windows. We have both powershell and normal cmd terminal commands, although you are free to modify this as much as you like.

**Commands included:** 55 
**PowerShell-backed commands:** 8 (touch, head, tail, wc, df, du, uname, tee)

## Setup
1. Extract the zip to a folder, e.g. `C:\cmd-aliases\`  
2. Add the folder to PATH (run in a new CMD as admin or user):
   ```cmd
   setx PATH "%PATH%;C:\cmd-aliases"
   ```
3. Open a new CMD and run `ls`, `touch`, etc.


## Notes
- Some commands use **PowerShell** for accuracy/perf (available on Win10/11 by default).
- `grep` uses `findstr`; regex/flags differ from GNU grep.
- `cp -r` uses `robocopy` for reliable directory copy.
- `rm` refuses drive roots (safety).
- For full GNU coverage (`sed`, `awk`, etc.), consider pairing with **BusyBox for Windows** or **WSL**, while keeping this toolkit for quick CMD use.

## Future Plan for More Commands (restricted to my availability and time for this)
Planned additions: `sed`, `awk` (PowerShell-based shims), `sha256sum`, `sort`, `uniq`, `cut`, `tr`, `xargs`, `env`, `export` (shim), `date` (formatting), `cal`, `yes`, `printf`.

For License, check [LICENSE](./LICENSE)