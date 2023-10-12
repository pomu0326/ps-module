$PublicScriptFile = Get-ChildItem -Recurse -Path "$PSScriptRoot\Public" -Filter "*.ps1" -Exclude "*.Tests.ps1"

# スクリプトファイルの読み込み
@(
    $PublicScriptFile
) `
| ForEach-Object { . $_.FullName }

# Functionの公開
Export-ModuleMember -Function $PublicScriptFile.BaseName