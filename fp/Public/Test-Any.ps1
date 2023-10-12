<#
.SYNOPSIS
Test-Anyは、指定された述語（条件）が配列のいずれかの要素に対してtrueであるかをテストします。

.DESCRIPTION
Test-Any関数は、指定された述語（条件関数）が配列のいずれかの要素に対してtrueを返すかどうかを評価します。
述語が少なくとも1つの要素に対してtrueを返す場合、関数は$trueを返します。それ以外の場合は$falseを返します。

.PARAMETER InputObject
パイプラインから受け取るオブジェクトです。このオブジェクトは、述語関数に一つずつ渡されます。

.PARAMETER Predicate
オブジェクトが条件を満たすかどうかをテストする関数です。この関数は、各InputObjectに対して実行され、
その結果（$trueまたは$false）が全体の結果に適用されます。

.EXAMPLE
```powershell
@(1, 2, 3) | Test-Any { $_ -gt 2 }
```
#>
function Test-Any {
    param(
        [Parameter(ValueFromPipeline)][object] $InputObject,
        [Parameter(Position = 0)][Func[object, bool]] $Predicate
    )
    begin {
        $Result = $false
    }
    process {
        $Result = $Result -or $Predicate.Invoke($InputObject)
    }
    end {
        $Result
    }
}