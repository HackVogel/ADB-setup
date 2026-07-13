$targetFolder = Read-Host "Enter the target folder for ADB (e.g., C:\ADB)"
$targetFolder = $targetFolder.Trim()

if (!(Test-Path -Path $targetFolder)) {
    New-Item -ItemType Directory -Path $targetFolder | Out-Null
    Write-Host "Directory '$targetFolder' has been created." -ForegroundColor Green
}

$zipUrl = "https://dl.google.com/android/repository/platform-tools-latest-windows.zip"
$tempZip = Join-Path $env:TEMP "platform-tools.zip"
$tempExtract = Join-Path $env:TEMP "platform-tools-extracted"

Write-Host "Downloading the latest Platform-Tools..." -ForegroundColor Cyan
Invoke-WebRequest -Uri $zipUrl -OutFile $tempZip

Write-Host "Extracting files..." -ForegroundColor Cyan
if (Test-Path -Path $tempExtract) { Remove-Item -Recurse -Force $tempExtract }
Expand-Archive -Path $tempZip -DestinationPath $tempExtract

Write-Host "Moving files to '$targetFolder'..." -ForegroundColor Cyan
Copy-Item -Path "$tempExtract\platform-tools\*" -Destination $targetFolder -Recurse -Force

Remove-Item -Path $tempZip -Force
Remove-Item -Recurse -Force $tempExtract

Write-Host "Adding folder to Windows PATH..." -ForegroundColor Cyan
$currentPath = [Environment]::GetEnvironmentVariable("Path", "User")

if ($currentPath -split ';' -contains $targetFolder) {
    Write-Host "The path is already present in your Windows PATH." -ForegroundColor Yellow
} else {
    $newPath = $currentPath + ";" + $targetFolder
    $newPath = $newPath -replace ';;', ';'
    [Environment]::SetEnvironmentVariable("Path", $newPath, "User")
    Write-Host "Successfully added to PATH!" -ForegroundColor Green
}

Write-Host "`nDone! Please restart your terminal (CMD or PowerShell) for the changes to take effect." -ForegroundColor Green
Write-Host "After restarting, you can run 'adb --version' from anywhere." -ForegroundColor Green