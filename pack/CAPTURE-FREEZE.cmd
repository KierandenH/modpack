@echo off
title Wild Realms freeze diagnostics
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%~dp0Capture-Freeze.ps1"
echo.
pause
