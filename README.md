# Instruction

## Install dotfiles

1. Clone as a bare repository

```bash
git clone --bare git@github.com:Zhniing/Dotfiles.git $HOME/Projects/Dotfiles.git
```

2. Create an alias `cit` (**c**onfig & g**it**) to access this bare repository

After the `.zshrc` being sourced, you can access this repository using `git` straightforwardly **when** your working directory is `$HOME`

```bash
alias cit="git --git-dir=$HOME/Projects/Dotfiles.git --work-tree=$HOME"
```

3. Ignore untracked files in `git status`

```bash
cit config --local status.showUntrackedFiles no
```

4. Restore files (will overwrite existing files):

```bash
cit checkout HEAD <FILE>  # Restore the specific file
cit reset --hard HEAD     # Restore all files
```

Resources: 
- [Dotfiles: Best Way to Store in a Bare Git Repository](https://www.atlassian.com/git/tutorials/dotfiles)
- [Hard reset of a single file](https://stackoverflow.com/a/7147320)

## Zsh

### Choose a `.zshrc`

```bash
ln -s .omz.zshrc .zshrc  # Use Oh-My-Zsh
ln -s .grml.zshrc .zshrc  # Use grml-zsh-config
```

### Install oh-my-zsh

```bash
git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
```

### Install third-party plugins

1. [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)

```bash
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

2. [fast-syntax-highlighting](https://github.com/zdharma-continuum/fast-syntax-highlighting)

```bash
git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting
```

3. [fzf-tab](https://github.com/Aloxaf/fzf-tab)

```bash
git clone https://github.com/Aloxaf/fzf-tab ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fzf-tab
```

4. [fzf-git.sh](https://github.com/junegunn/fzf-git.sh)

```bash
wget https://raw.githubusercontent.com/junegunn/fzf-git.sh/main/fzf-git.sh -O ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/fzf-git.zsh
```

## Alacritty

### Install fonts

1. Download **Hack Nerd Font** from [the latest release](https://github.com/ryanoasis/nerd-fonts/releases/latest)

2. Unzip and move the `.ttf` files to `$HOME/.local/share/fonts/`

3. Check the installed fonts:

```bash
fc-list
```

## Neovim

### Install Neovim

1. Install from source

```bash
git clone https://github.com/neovim/neovim.git
cd neovim
git checkout stable
sudo apt-get install ninja-build gettext cmake unzip curl
make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install
```

Refer to [Building Neovim](https://github.com/neovim/neovim/wiki/Building-Neovim)

2. Install the symbolic links

```bash
nvim_bin="/usr/local/bin/nvim"
sudo update-alternatives --install /usr/bin/vi vi "$nvim_bin" 50
sudo update-alternatives --install /usr/bin/vim vim "$nvim_bin" 50
sudo update-alternatives --install /usr/bin/editor editor "$nvim_bin" 50
```

### Install plugins

```vim
:PackerSync
```

## Utilities

```bash
sudo apt install fzf
sudo apt install ranger  # File manager
sudo apt install highlight  # Syntax highlight when previewing
sudo apt install flameshot  # Screenshot
sudo apt install sxhkd  # Custom hotkey
sudo apt install picom  # Compositor
sudo apt install rofi  # Application launcher
sudo apt install betterlockscreen  # Lockscreen
sudo apt isntall lsd  # Enhanced ls

# Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install jstkdng/programs/ueberzugpp  # Preview images
```

