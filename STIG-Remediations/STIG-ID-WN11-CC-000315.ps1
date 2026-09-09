<#
.SYNOPSIS
    This PowerShell script disables the Windows Installer "Always install
    with elevated privileges" setting.

.NOTES
    Author          : David Pena
    LinkedIn        : linkedin.com/in/darideivi/
    GitHub          : github.com/Darideivi
    Date Created    : 2026-09-09
    Last Modified   : 2026-09-09
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000315
    Documentation   : https://stigaview.com/products/win11/v2r8/WN11-CC-000315/

.TESTED ON
    Date(s) Tested  :
    Tested By       :
    Systems Tested  :
    PowerShell Ver. :

.USAGE
    Run PowerShell as Administrator.
    Example syntax:
    PS C:\> .\STIG-ID-WN11-CC-000315.ps1
#>

# Define the registry path and value
$RegPath  = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Installer"
$RegName  = "AlwaysInstallElevated"
$RegValue = 0

# Check if the registry path exists, if not create it
if (-not (Test-Path $RegPath)) {
    New-Item -Path $RegPath -Force | Out-Null
}

# Set the value
Set-ItemProperty -Path $RegPath -Name $RegName -Value $RegValue -Type DWord

# Output success message
Write-Host "Registry value '$RegName' set to '$RegValue' at '$RegPath'."
