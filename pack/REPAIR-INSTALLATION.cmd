@echo off
title Wild Realms missing mod repair
echo Close Minecraft and wait for CurseForge downloads to finish first.
echo This downloads missing pinned mods from CurseForge and checks their hashes.
echo Existing mods are not replaced or removed. Minecraft will not be launched.
pause
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%~dp0Repair-Installation.ps1"
echo.
pause
