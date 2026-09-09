<#
.SYNOPSIS
    Enables PowerShell Script Block Logging so the full text of executed
    script blocks (including obfuscated/dynamically generated code) is
    recorded to the PowerShell/Operational event log.

.NOTES
    Author          : David Pena
    LinkedIn        : linkedin.com/in/darideivi/
    GitHub          : github.com/Darideivi
    Date Created    : 2026-09-09
    Last Modified   : 2026-09-09
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000326
    Vuln-ID         : V-253414
    CCI             : CCI-000135
    Documentation   : https://stigaview.com/products/win11/v2r8/WN11-CC-000326/

.TESTED ON
    Date(s) Tested  :
    Tested By       : David Pena
    Systems Tested  :
    PowerShell Ver. :

.USAGE
    Run PowerShell as Administrator.
    Example syntax:
    PS C:\> .\remediation-STIG-ID-WN11-CC-000326.ps1

    Post-remediation verification:
    Get-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\PowerShell\ScriptBlockLogging" -Name "EnableScriptBlockLogging"
    Expected value after remediation: 1 (Expected local configuration after remediation: COMPLIANT)
    Run "gpupdate /force"; the setting applies to new PowerShell sessions opened
    after remediation, no restart required.

    Rollback (returns the VM to a non-compliant / default state for lab evidence):
    Remove-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\PowerShell\ScriptBlockLogging" -Name "EnableScriptBlockLogging" -ErrorAction SilentlyContinue
#>

$RegPath  = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\PowerShell\ScriptBlockLogging"
$RegName  = "EnableScriptBlockLogging"
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
