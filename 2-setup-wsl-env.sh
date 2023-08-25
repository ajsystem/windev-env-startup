#! /bin/bash
# First, read the script.

install_shell() {
    echo -e '\e[0;33mConfiguring zsh as shell\e[0m'
    ## zsh
    sudo apt-get install zsh -y

    curl -L http://install.ohmyz.sh | sh
    sudo chsh -s /usr/bin/zsh ${USER}
    wget https://raw.githubusercontent.com/ajsystem/windev-env-startup/master/misc/zshrc -O ~/.zshrc
}

install_devtools() {
    echo -e '\e[0;33mInstalling devtools dev/runtimes/sdks\e[0m'

    ## Python
    read -p 'Install Python 3? (Y/n)' -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]
    then
        sudo add-apt-repository ppa:deadsnakes/ppa
        sudo apt update
        sudo apt install python3
        curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
        python get-pip.py
    fi

    ## NVM | Node Version Manager
    read -p '¿Install NVM? (Y/n)' -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]
    then
        curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash
    fi
}

install_git() {
    echo -e '\e[0;33mInstalling git\e[0m'
    sudo add-apt-repository ppa:git-core/ppa --yes
    sudo apt update
    sudo apt install git -y
    echo 'git --global configuration steps'
    echo 'Please input the requested info'
    read -r -p 'Name: ' nombre
    read -r -p 'Lastname: ' apellido
    read -r -p 'Email: ' email
    git config --global user.name "$nombre $apellido"
    git config --global user.email "$email"
    git config --global core.editor 'code --wait'
    git config --global diff.tool vscode
    git config --global merge.tool vscode
    git config --global mergetool.vscode.cmd 'code --wait $MERGED'
    git config --global difftool.vscode.cmd 'code --wait --diff $LOCAL $REMOTE'
    git config --global credential.helper '/mnt/c/Program\ Files/Git/mingw64/libexec/git-core/git-credential-manager.exe'
    git config --global alias.stats=shortlog -sn --all --no-merges
    git config --global alias.tree=log --all --graph --decorate --oneline
    echo '.gitconfig settings saved!'
}

echo -e '\e[0;33mPreparing installation...\e[0m'

#tmpDir=~/tmp/setup-base

#if [ ! -d "$tmpDir" ]; then
#    mkdir --parents $tmpDir
#fi

## General updates
sudo apt-get update
sudo apt-get upgrade -y

## Utilities
sudo apt-get install unzip curl wget fontconfig software-properties-common-y


install_shell
install_git
install_devtools



echo 'All ready... the shell will restart please continue with file named 3-final-wsl-shell-config.sh'
reset
#rm -rf $tmpDir