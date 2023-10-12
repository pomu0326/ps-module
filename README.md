# My Custom PowerShell Modules

このリポジトリには、私が作成したカスタムPowerShellモジュールが含まれています。これらのモジュールは、特定のタスクを簡単かつ効率的に行うためのものです。どなたでも自由に利用、改変、配布することができます。

## モジュール一覧

### fp

**fp**は、PowerShellで関数型プログラミングをサポートするモジュールです。関数型プログラミングのコンセプトとテクニックをPowerShellスクリプトに取り入れることができます。

### pict

**pict**は、[MicrosoftのPICTツール](https://github.com/microsoft/pict)をPowerShellから利用するためのモジュールです。

## インストール方法

1. PSakeモジュールをインストールします。
    ```powershell
    Install-Module psake
    ```
2. リポジトリをクローンします。
   ```powershell
   git clone https://github.com/pomu0326/ps-module
   ```
3. モジュールをインストールします。
   ```powershell
   cd ps-module\[インストールしたいモジュール]
   Invoke-psake -buildFile "$((Get-Item .).BaseName).build.ps1" Install
   ```
