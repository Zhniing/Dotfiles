# Instruction

[toc]

## Install dotfiles

### 1. Clone as a bare repository

```bash
git clone --bare git@github.com:Zhniing/Dotfiles.git $HOME/Projects/Dotfiles.git
```

### 2. Create an alias `dit` (**d**otfiles & g**it**)

After the `.zshrc` being sourced, you can interact with this bare repository
using `git` directly **when** your working directory is `$HOME`

```bash
alias dit="git --git-dir=$HOME/Projects/Dotfiles.git --work-tree=$HOME"
```

### 3. Ignore untracked files in `git status`

```bash
dit config --local status.showUntrackedFiles no
```

### 4. Restore files (will overwrite existing files):

```bash
dit checkout HEAD <FILE>  # Restore the specific file
dit reset --hard HEAD     # Restore all files
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

#### 1. zsh-autosuggestions

[zsh-users/zsh-autosuggestions: Fish-like autosuggestions for zsh](https://github.com/zsh-users/zsh-autosuggestions)

```bash
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

#### 2. fast-syntax-highlighting

[zdharma-continuum/fast-syntax-highlighting: Feature-rich syntax highlighting for ZSH](https://github.com/zdharma-continuum/fast-syntax-highlighting)

```bash
git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting
```

#### 3. fzf-tab

[Aloxaf/fzf-tab: Replace zsh's default completion selection menu with fzf!](https://github.com/Aloxaf/fzf-tab)

```bash
git clone https://github.com/Aloxaf/fzf-tab ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fzf-tab
```

#### 4. fzf-git.sh

[junegunn/fzf-git.sh: bash and zsh key bindings for Git objects, powered by fzf](https://github.com/junegunn/fzf-git.sh)

```bash
wget https://raw.githubusercontent.com/junegunn/fzf-git.sh/main/fzf-git.sh -O ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/fzf-git.zsh
```

## Fonts

1. Download the nerd fonts from [the latest release](https://github.com/ryanoasis/nerd-fonts/releases/latest)

2. Unzip and move the `.ttf` files to `$HOME/.local/share/fonts/`

3. Check the installed fonts via `fc-list`

## Neovim

### Install Neovim

#### 1. Install from source

```bash
git clone https://github.com/neovim/neovim.git
cd neovim
git checkout stable
sudo apt-get install ninja-build gettext cmake unzip curl
make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install
```

Refer to [Building Neovim](https://github.com/neovim/neovim/wiki/Building-Neovim)

#### 2. Install the symbolic links

```bash
nvim_bin="/usr/local/bin/nvim"
sudo update-alternatives --install /usr/bin/vi vi "$nvim_bin" 50
sudo update-alternatives --install /usr/bin/vim vim "$nvim_bin" 50
sudo update-alternatives --install /usr/bin/editor editor "$nvim_bin" 50
```

## Utilities

```bash
sudo apt install ranger  # File manager
sudo apt install highlight  # Syntax highlight when previewing
sudo apt install flameshot  # Screenshot
sudo apt install sxhkd  # Custom hotkey
sudo apt install picom  # Compositor
sudo apt install rofi  # Application launcher
sudo apt install betterlockscreen  # Lockscreen
```

### ueberzugpp

[jstkdng/ueberzugpp: Drop in replacement for ueberzug written in C++](https://github.com/jstkdng/ueberzugpp)

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install jstkdng/programs/ueberzugpp
```

## Modern unix commands

[ibraheemdev/modern-unix: A collection of modern/faster/saner alternatives to common unix commands.](https://github.com/ibraheemdev/modern-unix)

### 1. fzf

[junegunn/fzf: :cherry\_blossom: A command-line fuzzy finder](https://github.com/junegunn/fzf)

```bash
sudo apt install fzf
```

### 2. ag

[ggreer/the\_silver\_searcher: A code-searching tool similar to ack, but faster.](https://github.com/ggreer/the_silver_searcher)

```bash
sudo apt install silversearcher-ag
```

### 3. lsd

[lsd-rs/lsd: The next gen ls command](https://github.com/lsd-rs/lsd)

```bash
sudo apt isntall lsd
```

### 4. bat

[sharkdp/bat: A cat(1) clone with wings.](https://github.com/sharkdp/bat)

```bash
sudo apt install bat
```

### 5. delta

[dandavison/delta: A syntax-highlighting pager for git, diff, and grep output](https://github.com/dandavison/delta/releases/latest)

```bash
git config --global --add include.path "~/.config/delta.gitconfig"
```

### 6. zoxide

[ajeetdsouza/zoxide: A smarter cd command. Supports all major shells.](https://github.com/ajeetdsouza/zoxide)

```bash
curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash
```

### 7. procs

[dalance/procs: A modern replacement for ps written in Rust](https://github.com/dalance/procs/releases/latest)


### 8. duf

[muesli/duf: Disk Usage/Free Utility - a better 'df' alternative](https://github.com/muesli/duf)

```bash
sudo apt install duf
```

### 9. dust

[bootandy/dust: A more intuitive version of du in rust](https://github.com/bootandy/dust/releases/latest)

## WeChat

### Tweak DPI

```bash
WINEPREFIX=~/.deepinwine/Deepin-WeChat deepin-wine6-stable winecfg
```

⚠️ Unable to run when the WeChat is running

#### WeChat from Spark Store

```bash
echo 1.5 > "~/.deepinwine/Spark-weixin/scale.txt"
```

## Grub

### Font size is too small

Reduce the resolution to make the text larger in look

```bash
GRUB_GFXMODE=800x600
```

## Touchpad support

Write this to `/etc/X11/xorg.conf.d/30-touchpad.conf`

```conf
# vim: ft=conf

Section "InputClass"
    Identifier "touchpad"
    Driver "libinput"
    MatchIsTouchpad "on"

    # tap-to-click
    Option "Tapping" "on"

    # Map 1/2/3-finger taps to left/right/middle button
    Option "TappingButtonMap" "lrm"

    # Reverse scrolling
    Option "NaturalScrolling" "true"
EndSection
```

Refer to [Tapping button re-mapping](https://wiki.archlinux.org/title/Libinput#Tapping_button_re-mapping)

## WPS

WPS can be scaled with `QT_FONT_DPI=240 wps`

## Wifi stops working when an NTFS driver inserted

Workaround: connect to the 5G wifi instead of the 2.4G wifi

This [topic](https://forum.endeavouros.com/t/wifi-stops-working-while-doing-heavy-io-on-usb-3/11989) may help

## Bluetooth

If bluetooth disconnects immediately after connects, try to restart the service
or reload the modules

```bash
sudo systemctl restart bluetooth.service
sudo rmmod btusb  # and/or `btintel`
sudo modprobe btusb  # and/or `btintel`
```

## System-wide environment

- `/etc/environment`
- `/etc/profile`

## Okular

Fix: missing icons

Workaround: use `qt5ct` to config the icon theme [ref](https://askubuntu.com/a/1127263)

```bash
# Use qt5ct, not qt6ct
echo "QT_QPA_PLATFORMTHEME=qt5ct" | sudo tee -a /etc/environment > /dev/null
# Set the icon theme
qt5ct
```
