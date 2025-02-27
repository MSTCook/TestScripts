#requires -version 2
<#
.SYNOPSIS
  Test script for Intune push

.DESCRIPTION
  This script writes to a file on the client computer and is intended to be pushed through Intune to
  test funcitonality.

.COMPONENT 
    No PowerShell modules required.

.LINK 

.PARAMETER Uninstall
 Removes the log file.

.INPUTS
  None

.OUTPUTS
  %programdata%\Microsoft\IntuneManagementExtension\Logs\_AllClientsTest.txt

.NOTES
  Version:        1.2
  Author:         Thomas Cook
  Creation Date:  2025.02.27
  Purpose/Change: Added Uninstall switch
  
.EXAMPLE
  AllClientsTest.ps1
  AllClientsTest.ps1 -Uninstall
#>

#---------------------------------------------------------[Initialisations]--------------------------------------------------------
param(
    [switch]$Uninstall
)
$date = get-date

#----------------------------------------------------------[Declarations]----------------------------------------------------------
$RootPath = "$ENV:ProgramData"
$LogFolder = "Microsoft\IntuneManagementExtension\Logs"
$FullPath = "$RootPath\$LogFolder"
$OutputFileName = "_AllClientsTest.log"


#-----------------------------------------------------------[Execution]------------------------------------------------------------

if ($Uninstall) {
  Remove-Item -Path "$FullPath\$OutputFileName"
}
else{
  if(-not (Test-Path $FullPath)){
    New-Item -Path $RootPath -Name $LogFolder -ItemType "directory"
  }
  
  Set-Content -Path "$FullPath\$OutputFileName" -Value $Date
}
