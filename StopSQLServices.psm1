Function Stop-SQLServices {
	$nl = [Environment]::NewLine
	Write-Host "Scanning for running SQL Server services ..."

	# Get all running SQL Server and SQL related services
	$sqlServices = Get-service -displayname "*SQL*" | Where-Object {$_.status -eq "Running"}

	Write-Host -NoNewline "Found" $sqlServices.Count "running SQL services."
	Write-Host $nl

	If ($sqlServices.Count -gt 0) {
		ForEach ($service in $sqlServices) {
			# Stop each running SQL service found
			Write-Host -NoNewline "Attempting to stop" $service "..."
			Try {
				Stop-Service $service.Name -ErrorAction Stop
			}
			Catch {
				Write-Host $nl
				Write-Host $error[0].Exception -ForegroundColor Red -BackgroundColor Black
				Write-Host "Attempting to stop the service forcefully. Please confirm ..."
				Stop-Service $service.Name -Force -Confirm
			}
			Write-Host $nl
		}
	}
	Else {
		Write-Host "No running services to stop. Exiting ..."
		Write-Host $nl
	}
}

