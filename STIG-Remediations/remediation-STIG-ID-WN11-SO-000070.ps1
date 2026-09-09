<#
.SYNOPSIS
    Sets the machine inactivity limit to 900 seconds (15 minutes) or less so
    the system locks automatically with the screensaver after inactivity.

.NOTES
    Author          : David Pena
    LinkedIn        : linkedin.com/in/darideivi/
    GitHub          : github.com/Darideivi
    Date Created    : 2026-09-09
    Last Modified   : 2026-09-09
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-SO-000070
    Vuln-ID         : V-253444
    CCI             : CCI-001133, CCI-002361
    Documentation   : https://stigaview.com/products/win11/v2r8/WN11-SO-000070/

.TESTED ON
    Date(s) Tested  :
    Tested By       : David Pena
    Systems Tested  :
    PowerShell Ver. :

.USAGE
    Run PowerShell as Administrator.
    Example syntax:
    PS C:\> .\remediation-STIG-ID-WN11-SO-000070.ps1

    Post-remediation verification:
    Get-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "InactivityTimeoutSecs"
    Expected value after remediation: 900 (or lower, non-zero) (Expected local configuration after remediation: COMPLIANT)
    A "gpupdate /force" is sufficient to apply this; no restart required.

    Rollback (returns the VM to a non-compliant / default state for lab evidence):
    Remove-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "InactivityTimeoutSecs" -ErrorAction SilentlyContinue
#>

$RegPath  = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System"
$RegName  = "InactivityTimeoutSecs"
$RegType  = "DWord"
$RegValue = 900

# Capture pre-remediation value as evidence. Do not assume the prior state.
$before = (Get-ItemProperty -Path $RegPath -Name $RegName -ErrorAction SilentlyContinue).$RegName
Write-Host "Pre-remediation value of '$RegName': $(if ($null -eq $before) { '<not configured>' } else { $before })"

if (-not (Test-Path $RegPath)) {
    New-Item -Path $RegPath -Force | Out-Null
}

New-ItemProperty -Path $RegPath -Name $RegName -Value $RegValue -PropertyType $RegType -Force | Out-Null

$after = (Get-ItemProperty -Path $RegPath -Name $RegName -ErrorAction SilentlyContinue).$RegName
Write-Host "Post-remediation value of '$RegName': $after"
Write-Host "Expected local configuration after remediation: COMPLIANT"
Write-Host "Tenable validation is required for final confirmation."
