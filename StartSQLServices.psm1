Function Start-SQLServices {
	$nl = [Environment]::NewLine
	Write-Host "Scanning for stopped SQL Server services ..."

	# Get all stopped SQL Server and SQL related services
	$sqlServices = Get-service -displayname "*SQL*" | Where-Object {$_.status -eq "stopped" -and $_.Name -ne "MySQL"}

	Write-Host -NoNewline "Found" $sqlServices.Count "stopped SQL services."
	Write-Host $nl

	If ($sqlServices.Count -gt 0) {
		ForEach ($service in $sqlServices) {
			# Start each stopped SQL service found
			Write-Host -NoNewline "Attempting to start" $service "..."
			Try {
				Start-Service $service.Name -ErrorAction Stop
			}
			Catch {
				Write-Host $nl
				Write-Host $error[0].Exception -ForegroundColor Red -BackgroundColor Black
				Write-Host "Attempting to start the service forcefully. Please confirm ..."
				Start-Service $service.Name -Force -Confirm
			}
			Write-Host $nl
		}
	}
	Else {
		Write-Host "No stopped services to start. Exiting ..."
		Write-Host $nl
	}
}