# Publishes local changes in this repo to GitHub.
# Run by the "IT Projects - GitHub sync" scheduled task, or by hand: powershell -File tools\sync.ps1
$ErrorActionPreference = 'Continue'
$repo = Split-Path -Parent $PSScriptRoot
Set-Location $repo
$log = Join-Path $env:LOCALAPPDATA 'it-projects-sync.log'
function Log($m) { "$(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')  $m" | Add-Content $log; Write-Host $m }

git pull --rebase --autostash --quiet 2>&1 | Out-Null
if ($LASTEXITCODE -ne 0) { Log "pull failed (exit $LASTEXITCODE)"; exit 1 }

$changes = git status --porcelain
if (-not $changes) { Write-Host 'Nothing new to push - GitHub is up to date.'; exit 0 }

git add -A
git commit -m "Update project logs ($(Get-Date -Format 'yyyy-MM-dd'))" --quiet
git push --quiet 2>&1 | Out-Null
if ($LASTEXITCODE -eq 0) { Log "pushed: $($changes.Count) change(s)" } else { Log "push failed (exit $LASTEXITCODE)"; exit 1 }
