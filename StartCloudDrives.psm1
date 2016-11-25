Function Start-CloudDrives {
	$nl = [Environment]::NewLine
	$dropboxPath = "C:\Program Files (x86)\Dropbox\Client\Dropbox.exe"
	$oneDrivePath = "C:\Users\agric\AppData\Local\Microsoft\OneDrive\OneDrive.exe"
	$dropboxProcesses = Get-Process -Name *dropbox*
	$oneDriveProcesses = Get-Process -Name *onedrive*

	# Start Dropbox if it exists and is not running
	If ($dropboxProcesses.Count -gt 0) {
		Write-Host "Dropbox already running. Skipping ..."
		Write-Host $nl
	}
	Else {
		If (Test-Path $dropboxPath) {
			Write-Host "Attempting to start Dropbox ..."
			Start-Process -FilePath $dropboxPath -ArgumentList "/home" -ErrorAction Stop
			Write-Host $nl
		}
		Else {
			Write-Host "No Dropbox exe found on the given path. Skipping ..."
			Write-Host $nl
		}
	}

	#Start OneDrive if it exists and is not running
	If ($oneDriveProcesses.Count -gt 0) {
		Write-Host "OneDrive already running. Skipping ..."
		Write-Host $nl
	}
	Else {
		If (Test-Path $oneDrivePath) {
			Write-Host "Attempting to start OneDrive ..."
			Start-Process -FilePath $oneDrivePath -Credential ""
			Write-Host $nl
		}
		Else {
			Write-Host "No OneDrive exe found on the given path. Skipping ..."
			Write-Host $nl
		}
	}
}