@echo off
title Wild Realms missing mod repair
echo Close Minecraft and wait for CurseForge downloads to finish first.
echo This downloads missing pinned mods from CurseForge and checks their hashes.
echo Existing mods are not replaced or removed. Minecraft will not be launched.
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%~dp0Repair-Installation.ps1"
set "repair_result=%errorlevel%"
echo.
echo Repair finished with exit code %repair_result%. See the result above.
echo A copy of the output is saved as installation-repair.log in this profile.
pause
exit /b %repair_result%
