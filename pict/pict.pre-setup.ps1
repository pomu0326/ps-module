<#
pict.exeがなければダウンロードする
#>

$pictIsExists = Test-Path "$PSScriptRoot\Bin\pict.exe"
if ($pictIsExists) {
    return
}

$pictVersion =
if ($env:PICT_VERSION) {
    $env:PICT_VERSION
}
else {
    "3.7.4"
}

$DownloadParam = @{
    Uri     = "https://github.com/microsoft/pict/releases/download/v${pictVersion}/pict.exe"
    OutFile = "$((New-Item -Force -Type Directory "$PSScriptRoot\Bin").FullName)\pict.exe"
}
Invoke-WebRequest @DownloadParam