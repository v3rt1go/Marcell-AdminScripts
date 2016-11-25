$nl = [Environment]::NewLine
Import-Module C:\scripts\StopSQLServices.psm1
Import-Module C:\scripts\StopCloudDrives.psm1

Write-Host "Starting unmount process"
Write-Host $nl

Stop-SQLServices
Stop-CloudDrives