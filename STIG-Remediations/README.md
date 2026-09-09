# Windows 11 STIG Remediations

PowerShell remediation scripts for a Windows 11 DISA STIG lab project.
Researched against **DISA Windows 11 STIG V2R8**. Provisional baseline —
no Tenable scan has been provided yet, so status stays SCRIPT GENERATED
until locally/Tenable verified.

Author: David Pena
GitHub: https://github.com/Darideivi

| STIG ID | Description | Severity | Script | Status |
|---------|-------------|----------|--------|--------|
| WN11-CC-000315 | Disable Windows Installer "Always install with elevated privileges" | CAT I | [STIG-ID-WN11-CC-000315.ps1](STIG-ID-WN11-CC-000315.ps1) | SCRIPT GENERATED |
| WN11-CC-000180 | Disable AutoPlay for non-volume devices | CAT I | [STIG-ID-WN11-CC-000180.ps1](STIG-ID-WN11-CC-000180.ps1) | SCRIPT GENERATED |
| WN11-CC-000155 | Disable Solicited Remote Assistance | CAT I | [STIG-ID-WN11-CC-000155.ps1](STIG-ID-WN11-CC-000155.ps1) | SCRIPT GENERATED |
| WN11-CC-000330 | Disable Basic authentication for the WinRM client | CAT I | [STIG-ID-WN11-CC-000330.ps1](STIG-ID-WN11-CC-000330.ps1) | SCRIPT GENERATED |
| WN11-CC-000325 | Disable automatic sign-in after a system-initiated restart | CAT II | [STIG-ID-WN11-CC-000325.ps1](STIG-ID-WN11-CC-000325.ps1) | SCRIPT GENERATED |
| WN11-SO-000070 | Machine inactivity limit of 15 minutes or less | CAT II | [STIG-ID-WN11-SO-000070.ps1](STIG-ID-WN11-SO-000070.ps1) | SCRIPT GENERATED |
| WN11-SO-000275 | UAC must virtualize file and registry write failures to per-user locations | CAT II | [STIG-ID-WN11-SO-000275.ps1](STIG-ID-WN11-SO-000275.ps1) | SCRIPT GENERATED |
| WN11-CC-000165 | Restrict unauthenticated RPC clients | CAT II | [STIG-ID-WN11-CC-000165.ps1](STIG-ID-WN11-CC-000165.ps1) | SCRIPT GENERATED |
| WN11-CC-000326 | Enable PowerShell Script Block Logging | CAT II | [STIG-ID-WN11-CC-000326.ps1](STIG-ID-WN11-CC-000326.ps1) | SCRIPT GENERATED |
| WN11-CC-000066 | Include command line data in process creation events | CAT II | [STIG-ID-WN11-CC-000066.ps1](STIG-ID-WN11-CC-000066.ps1) | SCRIPT GENERATED |

## Status legend

- **RESEARCHED** — requirement understood, no script yet
- **SCRIPT GENERATED** — PowerShell remediation written, not yet verified
- **LOCALLY VERIFIED** — run on a test VM and confirmed compliant
- **TENABLE VERIFIED** — confirmed PASS by an actual Tenable scan

## Usage

Run as Administrator:

```powershell
PS C:\> .\STIG-ID-<STIG-ID>.ps1
```
