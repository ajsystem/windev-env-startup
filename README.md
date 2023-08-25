# WINDEV-ENV

Hello! I'm [**ajsystem**](https://github.com/ajsystem/), and these are some scripts that I use to prepare developers' environments on a freshly installed Windows machine. Currently, they are working and tested on **Windows 11**.

#### Disclaimer:
*Please read all the file contents before execution. I am not responsible if they don't work for you or if they cause any issues on your system.*

## Files, in the order of execution
These files need to be run manually by you.

### 1-setup-windows-env
This file is a PowerShell script that performs the following tasks:
- Installs the Chocolatey package manager from [Chocolatey Software | Community](https://community.chocolatey.org/)
- Installs the following packages by default:
  - git: [Git (git-scm.com)](https://git-scm.com/)
  - vscode: [Visual Studio Code - Code Editing. Redefined](https://code.visualstudio.com/)
  - postman: [Postman](https://www.postman.com/)
  - 7zip: [7-Zip](https://www.7-zip.org/)
  - putty: [Download PuTTY - a free SSH and telnet client for Windows](https://putty.org/)
  - filezilla: [FileZilla - The free FTP solution (filezilla-project.org)](https://filezilla-project.org/)
  - firacodenf: [Nerd Fonts - Iconic font aggregator, glyphs/icons collection, & fonts patcher](https://www.nerdfonts.com/font-downloads)

  *(You can comment out these packages if you don't want some of them)*
- Requests some information to save in .gitconfig global
- Installs WSL2 and then restarts the machine

### 2-setup-wsl-env
This file is a bash script that needs to be executed on the freshly installed WSL after the initial configuration. It performs the following tasks:
- Updates dependencies of WSL Ubuntu
- Installs [Oh My Zsh - a delightful & open source framework for Zsh](https://ohmyz.sh/) and applies the configurations listed in `misc/zshrc`, which include:
  - A customized theme from [romkatv/powerlevel10k: A Zsh theme (github.com)](https://github.com/romkatv/powerlevel10k)
  - Node version manager configurations: [nvm-sh/nvm: Node Version Manager - POSIX-compliant bash script to manage multiple active node.js versions (github.com)](https://github.com/nvm-sh/nvm)
  - Python exports
  - A custom alias to retrieve the WSL IP
- Optionally installs Python
- Installs NVM
- Installs Git and prompts for basic information to configure .gitconfig globally

### 3-final-wsl-shell-config
This is the final file that updates the shell (zsh) to use powerlevel10k and custom fonts.

### Miscellaneous folder
This folder includes:
- p10k.zsh: Configuration file for the zsh theme.
- windows-terminal-theme.json: Theme file for the Windows Terminal.
- zshrc: Configuration file for zsh.

### Final thoughts
Feel free to use or fork this repository. If you notice anything that can be improved, please open a merge request or submit an issue. Your contributions are welcome!
