$nl = [Environment]::NewLine
Import-Module C:\scripts\StartSQLServices.psm1
Import-Module C:\scripts\StartCloudDrives.psm1

Write-Host "Starting mount process"
Write-Host $nl

Start-SQLServices
Start-CloudDrives