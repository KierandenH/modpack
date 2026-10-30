param([string]$InstancePath = $PSScriptRoot, [int]$TargetProcessId = 0, [string]$JcmdPath)
# User-run diagnostics only: does not launch, close or change Minecraft.
$ErrorActionPreference = 'Stop'
try {
    $root = [IO.Path]::GetFullPath($InstancePath).TrimEnd('\')
    if (-not $JcmdPath) { $JcmdPath = Join-Path $env:USERPROFILE 'curseforge/minecraft/Install/runtime/java-runtime-gamma/windows-x64/java-runtime-gamma/bin/jcmd.exe' }
    if (-not (Test-Path -LiteralPath $JcmdPath)) { throw 'Java diagnostic tool not found. Supply -JcmdPath from a Java 17 installation.' }
    $candidates = @(Get-CimInstance Win32_Process -Filter "Name='java.exe' OR Name='javaw.exe'" | Where-Object {
        $_.CommandLine -and $_.CommandLine.IndexOf($root, [StringComparison]::OrdinalIgnoreCase) -ge 0 -and
        (-not $TargetProcessId -or $_.ProcessId -eq $TargetProcessId)
    })
    if ($candidates.Count -ne 1) { throw "Found $($candidates.Count) Java processes matching this profile; keep the affected game open and run from its profile folder. No process was touched." }
    $target = $candidates[0].ProcessId
    $output = Join-Path $root ('freeze-reports/' + (Get-Date -Format 'yyyyMMdd-HHmmss') + '-' + [guid]::NewGuid().ToString('N').Substring(0,6))
    New-Item -ItemType Directory -Path $output -Force | Out-Null
    "Profile: $root`r`nProcess ID: $target`r`nCaptured: $(Get-Date -Format o)`r`nNo game command line or account tokens captured." | Set-Content (Join-Path $output 'summary.txt')
    foreach ($sample in 1..3) {
        Write-Output "Capturing thread sample $sample of 3..."
        $out = Join-Path $output "threads-$sample.txt"
        $err = Join-Path $output "threads-$sample-errors.txt"
        $job = Start-Process -FilePath $JcmdPath -ArgumentList @("$target",'Thread.print','-l') -WindowStyle Hidden -PassThru -RedirectStandardOutput $out -RedirectStandardError $err
        if (-not $job.WaitForExit(15000)) {
            $job.Kill() # Stop only our stalled diagnostic helper, never the game.
            throw "Java attachment timed out. Partial report: $output"
        }
        $job.WaitForExit()
        # Windows PowerShell can return a null exit code for a fast redirected
        # process; require a real thread dump as well as any available exit code.
        if (($null -ne $job.ExitCode -and $job.ExitCode -ne 0) -or (Get-Content -LiteralPath $out -Raw) -notmatch 'Full thread dump') { throw "Thread capture failed. See $err" }
        if ($sample -lt 3) { Start-Sleep -Seconds 3 }
    }
    Write-Output "Saved three thread samples: $output"
    Write-Output 'Send that folder with latest.log privately. Nothing was uploaded. You may close the frozen game now.'
    exit 0
} catch { Write-Output ('Capture failed: ' + $_.Exception.Message); exit 1 }
