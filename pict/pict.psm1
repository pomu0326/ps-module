function Invoke-Pict {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory, Position = 0)][System.IO.FileInfo] $ModelFile,
        [Parameter()][char] $Delimiter = ',',
        [Parameter()][char] $DelimiterAlias = '|',
        [Parameter()][switch] $Random,
        [Parameter()][int] $RandomSeed = $null,
        [Parameter()][switch] $CaseSensitive
    )

    $PICT = "$pSScriptRoot\Bin\pict.exe"
    $Argument = @(
        $ModelFile.FullName
        "/d:$Delimiter"
        "/a:$DelimiterAlias"
        if ($Random -and ($RandomSeed -eq $null)) { "/r" }
        if ($Random -and ($RandomSeed -ne $null)) { "/r:$RandomSeed" }
        if ($CaseSensitive) { "/c" }
    )

    $OutputTemporary = New-TemporaryFile
    Try {
        Start-Process -Wait -NoNewWindow -RedirectStandardOutput $OutputTemporary.FullName -FilePath $PICT -ArgumentList $Argument
        Get-Content -Raw $OutputTemporary.FullName | ConvertFrom-Csv -Delimiter "`t"
    }
    Finally {
        Remove-Item -Force $OutputTemporary.FullName
    }
}

Export-ModuleMember -Function "Invoke-Pict"