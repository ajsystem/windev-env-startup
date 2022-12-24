#! /bin/bash
# First, read the script.

update_shell() {
    echo -e '\e[0;33mInstalling powerlvl10k\e[0m'
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
    wget https://raw.githubusercontent.com/ajsystem/windev-env-startup/master/misc/p10k.zsh -O ~/.p10k.zsh

    echo "Installing font: https://github.com/ryanoasis/nerd-fonts/releases/download/v2.2.2/FiraCode.zip"
    wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.2.2/FiraCode.zip
    unzip FiraCode.zip -d ~/.fonts
    fc-cache -fv
}

update_shell


echo 'All ready... the shell will restart'
reset