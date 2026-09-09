<#
.SYNOPSIS
    Configures process creation audit events to include the command line
    used to start the process, giving investigators visibility into how a
    process was launched.

.NOTES
    Author          : David Pena
    LinkedIn        : linkedin.com/in/darideivi/
    GitHub          : github.com/Darideivi
    Date Created    : 2026-09-09
    Last Modified   : 2026-09-09
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000066
    Vuln-ID         : V-253367
    CCI             : CCI-000135
    Documentation   : https://stigaview.com/products/win11/v2r8/WN11-CC-000066/

.TESTED ON
    Date(s) Tested  :
    Tested By       : David Pena
    Systems Tested  :
    PowerShell Ver. :

.USAGE
    Run PowerShell as Administrator.
    Example syntax:
    PS C:\> .\remediation-STIG-ID-WN11-CC-000066.ps1

    NOTE: This registry value only controls WHETHER command-line data is
    included in process creation events. It has no effect unless the
    "Audit Process Creation" audit subcategory is also enabled (a separate
    STIG control). That subcategory is intentionally NOT touched by this
    script to keep it scoped to WN11-CC-000066 only.

    Post-remediation verification:
    Get-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\Audit" -Name "ProcessCreationIncludeCmdLine_Enabled"
    Expected value after remediation: 1 (Expected local configuration after remediation: COMPLIANT)
    Run "gpupdate /force"; effective for process creation events generated after remediation.

    Rollback (returns the VM to a non-compliant / default state for lab evidence):
    Remove-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\Audit" -Name "ProcessCreationIncludeCmdLine_Enabled" -ErrorAction SilentlyContinue
#>

$RegPath  = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\Audit"
$RegName  = "ProcessCreationIncludeCmdLine_Enabled"
$RegType  = "DWord"
$RegValue = 1

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
