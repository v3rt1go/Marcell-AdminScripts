# Prepare system for external HDD mount/unmount

A collection of PowerShell scripts to stop/start SQL Server services and start/close cloud drives (eg. Dropbox, OneDrive)
Should be run befor unmounting the external HDD or after mountin it back on.

### StartCloudDrives.psm1
Starts Dropbox and OneDrive apps, if they are not already running.
To start OneDrive the current user credentials need to be provided.

### StopCloudDrives.psm1
Stops Dropbox and OneDrive apps if they are running

### StartSQLServices.psm1
Starts all SQL Server services that are not already running

### StopSQLServices.psm1
Stops all SQL Server services that are running

## Usage
Create shortcuts of the two .bat files and pin them to Start.

Before unmounting the external HDD run **UnmountHDD.bat** to close all services and apps that have their data stored on the external HDD

After mounting the external HDD run **MountHDD.bat** to start all services and apps that have their data stored on the external HDD

