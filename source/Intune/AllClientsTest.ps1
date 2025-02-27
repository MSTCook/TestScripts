#requires -version 2
<#
.SYNOPSIS
  Test script for Intune push

.DESCRIPTION
  This script writes to a file on the client computer and is intended to be pushed through Intune to
  test funcitonality.

.PARAMETER <Parameter_Name>
  None

.INPUTS
  None

.OUTPUTS
  AllClientsTest.txt

.NOTES
  Version:        1.1
  Author:         Thomas Cook
  Creation Date:  2025.02.27
  Purpose/Change: Initial script development
  
.EXAMPLE
  _AllClientsTest.ps1
#>

#---------------------------------------------------------[Initialisations]--------------------------------------------------------
$date = get-date

#----------------------------------------------------------[Declarations]----------------------------------------------------------
$RootPath = "$ENV:ProgramData"
$LogFolder = "Microsoft\IntuneManagementExtension\Logs"
$OutputFileName = "_AllClientsTest.log"


#-----------------------------------------------------------[Execution]------------------------------------------------------------

$FullPath = "$RootPath\$LogFolder"
if(-not (Test-Path $FullPath)){
  New-Item -Path $RootPath -Name $LogFolder -ItemType "directory"
}

Set-Content -Path "$FullPath\$OutputFileName" -Value $Date
