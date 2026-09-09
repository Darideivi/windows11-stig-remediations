# Windows 11 STIG Remediations

PowerShell remediation scripts for a Windows 11 DISA STIG lab project.
Research and scripts are built against **DISA Windows 11 STIG V2R8**
(the version currently served at `stigaview.com/products/win11/latest/`).
This is a provisional baseline — no Tenable scan has been provided yet, so
these are draft/candidate findings, not confirmed FAILED results from an
actual audit. The STIG version must be reconciled against the real Tenable
audit version once one is available.

Author: David Pena
GitHub: https://github.com/Darideivi
LinkedIn: https://www.linkedin.com/in/darideivi/

| STIG ID | Description | Severity | Script | Status |
|---------|-------------|----------|--------|--------|
| WN11-CC-000315 | Disable Windows Installer "Always install with elevated privileges" | CAT I | [remediation-STIG-ID-WN11-CC-000315.ps1](remediation-STIG-ID-WN11-CC-000315.ps1) | SCRIPT GENERATED |
| WN11-CC-000180 | Disable AutoPlay for non-volume devices | CAT I | [remediation-STIG-ID-WN11-CC-000180.ps1](remediation-STIG-ID-WN11-CC-000180.ps1) | SCRIPT GENERATED |
| WN11-CC-000155 | Disable Solicited Remote Assistance | CAT I | [remediation-STIG-ID-WN11-CC-000155.ps1](remediation-STIG-ID-WN11-CC-000155.ps1) | SCRIPT GENERATED |
| WN11-CC-000330 | Disable Basic authentication for the WinRM client | CAT I | [remediation-STIG-ID-WN11-CC-000330.ps1](remediation-STIG-ID-WN11-CC-000330.ps1) | SCRIPT GENERATED |
| WN11-CC-000325 | Disable automatic sign-in after a system-initiated restart | CAT II | [remediation-STIG-ID-WN11-CC-000325.ps1](remediation-STIG-ID-WN11-CC-000325.ps1) | SCRIPT GENERATED |
| WN11-SO-000070 | Machine inactivity limit of 15 minutes or less | CAT II | [remediation-STIG-ID-WN11-SO-000070.ps1](remediation-STIG-ID-WN11-SO-000070.ps1) | SCRIPT GENERATED |
| WN11-SO-000275 | UAC must virtualize file and registry write failures to per-user locations | CAT II | [remediation-STIG-ID-WN11-SO-000275.ps1](remediation-STIG-ID-WN11-SO-000275.ps1) | SCRIPT GENERATED |
| WN11-CC-000165 | Restrict unauthenticated RPC clients | CAT II | [remediation-STIG-ID-WN11-CC-000165.ps1](remediation-STIG-ID-WN11-CC-000165.ps1) | SCRIPT GENERATED |
| WN11-CC-000326 | Enable PowerShell Script Block Logging | CAT II | [remediation-STIG-ID-WN11-CC-000326.ps1](remediation-STIG-ID-WN11-CC-000326.ps1) | SCRIPT GENERATED |
| WN11-CC-000066 | Include command line data in process creation events | CAT II | [remediation-STIG-ID-WN11-CC-000066.ps1](remediation-STIG-ID-WN11-CC-000066.ps1) | SCRIPT GENERATED |

## Status legend

- **RESEARCHED** — requirement understood, no script yet
- **SCRIPT GENERATED** — PowerShell remediation written, not yet run/verified locally
- **LOCALLY VERIFIED** — remediation run on a test VM and confirmed compliant via `Get-ItemProperty`
- **TENABLE VERIFIED** — confirmed PASS by an actual Tenable compliance scan (never marked without user-provided evidence)

## Usage

Each script:
- Targets exactly one STIG ID / registry value.
- Captures the pre-remediation value before making any change.
- Is idempotent (safe to re-run).
- Requires Administrator privileges (HKLM writes).
- Prints "Expected local configuration after remediation: COMPLIANT" — this is
  **not** a Tenable result, only a local post-change check.

Run as Administrator:

```powershell
PS C:\> .\remediation-STIG-ID-<STIG-ID>.ps1
```
