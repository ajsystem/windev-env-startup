
# First, read the script.
# Second change execution police
# Windows 11: Settings app >> Privacy & security >> For developers >> PowerShell -> Check execution box and apply
# Windows 10: Settings app >> Update & security >> For developers >> PowerShell -> Check execution box and apply

# Install Chocolatey -- https://chocolatey.org/
function Install-Chocolatey {
    Set-ExecutionPolicy Bypass -Scope Process -Force;
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072;
    iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
}

# Install package $PackageName
function Install-FromChocolatey {
    param(
        [string]
        [Parameter(Mandatory = $true)]
        $PackageName
    )
    Set-ExecutionPolicy Bypass -Scope Process -Force;
    choco install $PackageName --yes
    Write-Host "$PackageName installed"
}

# Install PowerShell modules -- https://www.powershellgallery.com/
function Install-PowerShellModule {
    param(
        [string]
        [Parameter(Mandatory = $true)]
        $ModuleName,

        [ScriptBlock]
        [Parameter(Mandatory = $true)]
        $PostInstall = {}
    )

    if (!(Get-Command -Name $ModuleName -ErrorAction SilentlyContinue)) {
        Write-Host "Installing $ModuleName"
        Install-Module -Name $ModuleName -Scope CurrentUser -Confirm $true
        Import-Module $ModuleName -Confirm

        Invoke-Command -ScriptBlock $PostInstall
    } else {
        Write-Host "$ModuleName was already installed, skipping"
    }
}

# Init
Install-Chocolatey

# Install basic packages
# Packages from https://community.chocolatey.org/packages
Install-FromChocolatey 'git'
Install-FromChocolatey 'vscode'
Install-FromChocolatey 'postman'
Install-FromChocolatey '7zip'
Install-FromChocolatey 'putty.install'
Install-FromChocolatey 'filezilla'
Install-FromChocolatey 'firacodenf'
Install-FromChocolatey 'heidisql'
Install-FromChocolatey 'devtoys'
Install-FromChocolatey 'powertoys'

WRITE-Host "All packages installed"
WRITE-Host "git --global configuration steps"
WRITE-Host "Please input the requested info"

$Nombre = Read-Host -Prompt 'Name: '
$Apellido = Read-Host -Prompt 'Lastname: '
$Email = Read-Host -Prompt 'email: '

Set-Content $env:USERPROFILE\.gitconfig @"
[user]
	name = $Nombre $Apellido
	email = $Email
[core]
	editor = code --wait
[diff]
	tool = vscode
[merge]
	tool = vscode
[mergetool "vscode"]
	cmd = code --wait $MERGED
[difftool "vscode"]
	cmd = code --wait --diff $LOCAL $REMOTE
[credential]
	helper = manager
"@

WRITE-Host ".gitconfig settings saved!"
WRITE-Host "WSL2 Installer will begin"
wsl --install
Restart-Computer -Confirm