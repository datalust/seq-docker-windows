param (
    [string] $AcceptEula
)

if ($AcceptEula -ne 'Y') {
    throw 'The Seq End User License Agreement must be accepted in order to use this Docker image.';
}

Write-Output 'Starting Seq...'

$seqExe = 'C:/Program Files/Seq/Seq.exe'

# From Seq 4.2.*, this can all be replaced with:
# & $seqExe run --interactive

& $seqExe install
& $seqExe start

Write-Output "Running on:"

# Via https://github.com/serilog/serilog-docker/blob/master/seq/Dockerfile
Get-NetAdapter | Get-NetIPAddress | Where-Object AddressFamily -EQ 'IPv4' | Select-Object -ExpandProperty IPAddress 

Start-Sleep -Seconds 5;

Write-Output "Startup logs:"
Get-ChildItem C:/ProgramData/Seq/Logs | ForEach-Object{
    Get-Content $_.FullName
}

while ("$(& $seqExe status)".Contains("running")) {
    Start-Sleep -Seconds 30;
}
