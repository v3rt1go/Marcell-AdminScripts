Function Stop-CloudDrives {
	$nl = [Environment]::NewLine
	$dropboxProcess = Get-Process -Name *dropbox*
	$oneDriveProcesses = Get-Process -Name *onedrive* #onedrive usually has more processes

	# Stop Dropbox if it exists and is running
	If ($dropboxProcess.Count -gt 0) {
		Try {
			Write-Host "Attempting to stop Dropbox process ..."
			Stop-Process -Name $dropboxProcess.Name -ErrorAction Stop
			Write-Host $nl
		}
		Catch {
			Write-Host $error[0].Exception -ForegroundColor Red -BackgroundColor Black
			Write-Host "Error closing Dropbox. Please close manually ..."
			Write-Host $nl
		}
	}
	Else {
		Write-Host "Dropbox not running. Skipping ..."
		Write-Host $nl
	}

	# Stop OneDrive if it exists and is running
	If ($oneDriveProcesses.Count -gt 0) {
		Try {
			Write-Host "Attempting to stop OneDrive process ..."
			Stop-Process -Name $oneDriveProcesses.Name -ErrorAction Stop
			Write-Host $nl
		}
		Catch {
			Write-Host $error[0].Exception -ForegroundColor Red -BackgroundColor Black
			Write-Host "Error closing OneDrive. Please close manually ..."
			Write-Host $nl
		}
	}
	Else {
		Write-Host "OneDrive not running. Skipping ..."
		Write-Host $nl
	}
}
