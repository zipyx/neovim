# Neovim

For instructions on getting started using `Lua` for Neovim. The following guide is useful:
- https://github.com/nanotee/nvim-lua-guide

Other useful information related to my setup.
- Fonts (https://aur.archlinux.org/packages/nerd-fonts-git)
```bash
# Paru is the package manager used to install nerd-fonts-git
paru nerd-fonts-git
```

- Language Servers (https://microsoft.github.io/language-server-protocol/implementors/servers/)
- Window Buffers (https://github.com/c60cb859/bufMov.nvim/blob/main/doc/bufMov.txt)
- Sending HTTP Requests (https://github.com/rest-nvim/rest.nvim)
- SQL Server Protocol (https://github.com/joe-re/sql-language-server)
- Databases (https://github.com/dinhhuy258/vim-database)

Other useful commands to check against your neovim configuration.
- Check all keymaps currently in use (inclusive plugin keymaps)

First command
```bash
# Run command in command mode
# Hit enter after each line of command
:redir! > vim_keys.txt
```
Second command
```bash
:silent verbose map
```

Third command
```bash
:redir END
```

## Installation (Linux)
Brief workflow on installing `Neovim` if for the first time.

### Clone The Repository
```bash
git clone https://github.com/zipyx/neovim.git
```

Copy the following files to your local directory
```bash
# Create directory
mkdir ~/.config/nvim
# Copy files into the created directory
cp -rf neovim/* ~/.config/nvim/
```

### Install Manager
The `neovim` configuration files use `packer` as the plugin manager.
- Option 1 (Unix, Linux installation)
```bash
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

- Option 2 (Windows Powershell installation)
```powershell
git clone https://github.com/wbthomason/packer.nvim "$env:LOCALAPPDATA\nvim-data\site\pack\packer\start\packer.nvim"
```

- Option 3 (Arch Linux option - AUR package)
```bash
paru packer
```

### Install Packages
Open the `plugins.lua` file and run the following command.
```bash
nvim ~/.config/nvim/luga/zipyx/plugins.lua
```

Run the following command in `command` mode within neovim
```bash
:PackerInstall
```

### Treesitter
Use the following command to display a list of languages we can install
```bash
# Run within command mode of neovim
:TSInstallInfo
```

Use the following command to install the languages
```bash
# Run within command mode of neovim
:TSInstall <language_to_install>
```

### Language Servers
```bash
# Select and install your language server 
# Run in command mode within neovim
:Mason
```
