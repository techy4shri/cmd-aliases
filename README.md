# CMD Linux-Like Toolkit (Windows)

A tiny set of batch scripts that make Windows **CMD** feel a bit more like Linux.
I made these back when I started using wsl and in vs code terminals so feel free to modify them as you like to suit your system and needs :)

## Commands

- **touch** — Create a file if it doesn’t exist, or update its modified time.
  ```cmd
  touch file.txt
  touch a.txt b.txt c.txt
````

* **ls** — List files with a few familiar flags:

  * `-a` (show hidden/system)
  * `-l` (long listing: owner, timestamp)
  * `-al` / `-la` (combine)
  * `-R` (recursive)

  ```cmd
  ls
  ls -l
  ls -a
  ls -al C:\Windows
  ls -R .
  ```

* **cat** — Print one or more files. With no args, reads from stdin (end with `Ctrl+Z` then Enter).

  ```cmd
  cat file.txt
  cat a.txt b.txt
  type some_command_output | cat
  ```

* **clear** — Clear the console.

  ```cmd
  clear
  ```

* **ll** (optional) — Shortcut for `ls -al` in the current directory.

  ```cmd
  ll
  ```

## Installation

1. Create a folder for your scripts (recommended):

   ```
   C:\cmd-aliases\
   ```

2. Save these files into that folder:

   * `touch.bat`
   * `ls.bat`
   * `cat.bat`
   * `clear.bat`
   * (optional) `ll.bat`

3. Add the folder to your **PATH** (one-time):

   ```cmd
   setx PATH "%PATH%;C:\cmd-aliases"
   ```

   > Open a **new CMD window** after this step so the updated PATH is picked up.

4. Test:

   ```cmd
   touch hello.txt
   ls -al
   cat hello.txt
   clear
   ```

## Notes & Tips

* These scripts are designed for **CMD**. PowerShell users can create native functions/aliases instead.
* `touch.bat` uses PowerShell under the hood (available on Windows 10/11) to reliably update the modification time without altering file contents.
* `ls.bat` is intentionally minimal. Windows `dir` doesn’t exactly match Unix `ls` output formatting, but the common flags above are mapped to sensible `dir` switches.

## Uninstall

* Remove the `.bat` files and (optionally) remove `C:\cmd-aliases` from your PATH via **System Properties → Environment Variables**.


