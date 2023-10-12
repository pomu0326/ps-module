task Install {
    $ModuleFolder = $env:PSModulePath -split ";" | Select-Object -First 1
    $ThisModule = (Get-Item $PSScriptRoot)
    New-Item -Force -Type Junction -Target $ThisModule.FullName -Path (Join-Path $ModuleFolder $ThisModule.BaseName)
}