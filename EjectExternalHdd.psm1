# NOT WORKING - Do not use
Function Eject-ExternalHdd {
	$nl = [Environment]::NewLine

	Write-Host "Ejecting external HDD drive"
	$vol = Get-WmiObject -Class Win32_Volume | where{$_.Name -eq 'E:\'}
	$vol.DriveLetter = $null
	$vol.Put()
	$vol.Dismount($false, $false)
	Write-Host $nl
}

