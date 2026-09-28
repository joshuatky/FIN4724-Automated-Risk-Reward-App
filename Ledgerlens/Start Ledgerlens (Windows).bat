@echo off
title Ledgerlens
cd /d "%~dp0"
powershell -NoProfile -ExecutionPolicy Bypass -File "launcher\serve.ps1"
if errorlevel 1 (
  echo Could not start the local server. Opening the app file directly instead.
  start "" "%~dp0index.html"
  pause
)
