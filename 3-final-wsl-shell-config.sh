#! /bin/bash
# First, read the script.

update_shell() {
    echo -e '\e[0;33mInstalling powerlvl10k\e[0m'
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
    wget https://gist.githubusercontent.com/ajsystem/d63dd73fc6f56e8f9de5723bf5b4e83d/raw/27fd82c14789074ffe00fb5aa3240117c94470c7/p10k.zsh -O ~/.p10k.zsh

    echo "Installing font: https://github.com/ryanoasis/nerd-fonts/releases/download/v2.2.2/FiraCode.zip"
    wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.2.2/FiraCode.zip
    unzip FiraCode.zip -d ~/.fonts
    fc-cache -fv
}

update_shell


echo 'All ready... the shell will restart'
reset