<#
.SYNOPSIS
Test-Allは、指定された述語（条件）が配列のすべての要素に対してtrueであるかをテストします。

.DESCRIPTION
Test-All関数は、指定された述語（条件関数）が配列のすべての要素に対してtrueを返すかどうかを評価します。
述語がすべての要素に対してtrueを返す場合、関数はtrueを返します。それ以外の場合はfalseを返します。

.PARAMETER InputObject
パイプラインから受け取るオブジェクトです。このオブジェクトは、述語関数（Predicate）に一つずつ渡されます。

.PARAMETER Predicate
オブジェクトが条件を満たすかどうかをテストする関数です。この関数は、各InputObjectに対して実行され、
その結果（$trueまたは$false）が全体の結果に適用されます。

.EXAMPLE
```powershell
@(1, 2, 3) | Test-All { $_ -gt 0 }
```
#>
function Test-All {
    param(
        [Parameter(ValueFromPipeline)][object] $InputObject,
        [Parameter(Position = 0)][Func[object, bool]] $Predicate
    )
    begin {
        $Result = $true
    }
    process {
        $Result = $Result -and $Predicate.Invoke($InputObject)
    }
    end {
        $Result
    }
}