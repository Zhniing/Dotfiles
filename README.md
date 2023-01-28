# Instruction

## Install dotfiles

1. Clone as a bare repository

```bash
git clone --bare git@github.com:Zhniing/Dotfiles.git
```

2. Use the alias `cit` (combo of "config" and "git") to interact with the bare repository instead of the plain `git`

```bash
alias cit="git --git-dir=$HOME/Projects/Dotfiles.git --work-tree=$HOME"
```

3. Restore files (overwrite existing files):

```bash
cit checkout HEAD <FILE>  # Restore the specific file
cit reset --hard HEAD     # Restore all files
```

Resource: 
- [Dotfiles: Best Way to Store in a Bare Git Repository](https://www.atlassian.com/git/tutorials/dotfiles)
- [Hard reset of a single file](https://stackoverflow.com/a/7147320)

## Third-party plugins for zsh

### [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)

```bash
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

### [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)

```bash
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

**This plugin should be activated after all the other plugins.**

## Neovim

### Install the latest Neovim

1. Download from [the latest release](https://github.com/neovim/neovim/releases/tag/stable)

```bash
sudo apt install ./nvim-linux64.deb
```

2. Install the symbolic links

```bash
sudo update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 50
sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 50
sudo update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 50
```

### Install plugins

```vim
:PackerSync
```

### Install fonts

1. Download the [Nerd Fonts](https://www.nerdfonts.com/)

2. Unzip and move the `.ttf` files to `$HOME/.local/share/fonts/`

3. Check the installed fonts:

```bash
fc-list
```
