Task Test {
    Invoke-Pester
}

Task Install {
    $ModuleFolder = $Env:PSModulePath -split ";" | Select-Object -First 1
    $thisModule = (Get-Item $PSScriptRoot)
    New-Item -Force -Type Junction -Target $ThisModule.FullName -Path (Join-Path $ModuleFolder $ThisModule.BaseName)
}