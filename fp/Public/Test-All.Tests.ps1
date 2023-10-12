BeforeAll {
    . $PSCommandPath.Replace('.Tests.ps1', '.ps1')
}

Describe "#Test-All" {
    Context "入力が空のときは" {
        It "$true を返す" {
            @() `
            | Test-All { $false } `
            | Should -BeTrue
        }
    }
    Context "入力のすべてが条件に一致するときは" {
        It "$true を返す" {
            @(1, 2, 3) `
            | Test-All { $_ -gt 0 } `
            | Should -BeTrue
        }
    }
    Context "入力の一部が条件に一致しないときは" {
        It "$false を返す" {
            @(1, 2, 3) `
            | Test-All { ($_ % 2) -eq 0 }  `
            | Should -BeFalse
        }
    }
}