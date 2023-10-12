BeforeAll {
    . $PSCommandPath.Replace('.Tests.ps1', '.ps1')
}

Describe "#Test-Any" {
    Context "入力が空のときは" {
        It "$false を返す" {
            @() `
            | Test-Any { $true } `
            | Should -BeFalse
        }
    }
    Context "入力の一部が条件に一致するときは" {
        It "$true を返す" {
            @(1, 2, 3) `
            | Test-Any { ($_ % 2) -eq 0 } `
            | Should -BeTrue
        }
    }
}