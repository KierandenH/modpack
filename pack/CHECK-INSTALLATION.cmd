@echo off
title Wild Realms installation check
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%~dp0Verify-Installation.ps1"
echo.
pause
