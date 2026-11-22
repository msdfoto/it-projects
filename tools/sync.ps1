# Publishes local changes in this repo to GitHub.
# Run by the "IT Projects - GitHub sync" scheduled task (hidden), or by hand: powershell -File tools\sync.ps1
# Only contacts GitHub when something in this folder has changed.
$ErrorActionPreference = 'Continue'
$repo = Split-Path -Parent $PSScriptRoot
Set-Location $repo
$log = Join-Path $env:LOCALAPPDATA 'it-projects-sync.log'
function Log($m) { "$(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')  $m" | Add-Content $log; Write-Host $m }

# Local check only - no network access unless there's something to push
$changes  = git status --porcelain
$unpushed = git log '@{u}..' --oneline 2>$null   # commits left over from a failed push
if (-not $changes -and -not $unpushed) { Write-Host 'Nothing new to push - GitHub is up to date.'; exit 0 }

if ($changes) {
    git add -A
    git commit -m "Update project logs ($(Get-Date -Format 'yyyy-MM-dd'))" --quiet
}
git pull --rebase --quiet 2>&1 | Out-Null
if ($LASTEXITCODE -ne 0) { git rebase --abort 2>$null; Log "pull failed (exit $LASTEXITCODE) - changes are committed locally, will retry next run"; exit 1 }
git push --quiet 2>&1 | Out-Null
if ($LASTEXITCODE -eq 0) { Log "pushed: $($changes.Count) change(s)" } else { Log "push failed (exit $LASTEXITCODE) - will retry next run"; exit 1 }
