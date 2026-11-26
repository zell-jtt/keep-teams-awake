# Remove previously compiled versions (if they exist)
Remove-Item "firefox.xpi" -ErrorAction SilentlyContinue
Remove-Item "chrome.zip" -ErrorAction SilentlyContinue

# Go into the source directory
Set-Location "src"

# Create chrome.zip from contents of src
Compress-Archive -Path * -DestinationPath "chrome.zip" -Force

# Duplicate and rename for Firefox
Copy-Item "chrome.zip" "firefox.xpi"

# Move files back to project root
Move-Item "chrome.zip" "..\chrome.zip" -Force
Move-Item "firefox.xpi" "..\firefox.xpi" -Force

Write-Host "Build complete: chrome.zip and firefox.xpi created."
