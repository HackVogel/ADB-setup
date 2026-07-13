# Windows ADB Installer & Path Configurator

A simple, automated PowerShell script to download, extract, and globally configure the latest Android Debug Bridge (ADB) / Platform-Tools on Windows.

## Features
- **Always Up-to-Date**: Downloads the official, latest build of Google's Platform-Tools directly from Android's servers.
- **Custom Location**: Allows you to specify your own installation directory (e.g., `C:\ADB`).
- **Automatic Directory Creation**: Automatically creates your folder of choice if it does not exist yet.
- **Persistent Global Path Access**: Permanently appends the destination folder to your Windows User Environment `PATH` variable, enabling you to run `adb` commands from any folder or terminal session.
- **Self-Cleaning**: Safely removes all temporary ZIP archives and extraction folders once the setup is finished.

## Usage Instructions

1. **Download the Script**:
   Download and save `setup-adb.ps1` to your computer.

2. **Open PowerShell**:
   Press `Win + X` and click on **Windows PowerShell** or **Terminal**.

3. **Bypass Execution Policy**:
   By default, Windows blocks script execution. To allow running this script in your active PowerShell window, run:
   ```powershell
   Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process
   ```
