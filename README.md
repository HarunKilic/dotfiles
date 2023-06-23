# Dotfiles

### Installation

Clone the repository:

```bash
git clone https://github.com/HarunKilic/dotfiles.git
```

##### Alacritty

```bash
# Windows
mklink /D "%USERPROFILE%/AppData/Roaming/alacritty" "%USERPROFILE%/Documents/Github/dotfiles/.config/alacritty"
```

##### AstroNvim

```bash
# Windows
mklink /D "%USERPROFILE%/AppData/Local/nvim/lua/user" "%USERPROFILE%/Documents/Github/dotfiles/.config/nvim/lua/user"
```

##### Lvim

```bash
# Windows
mklink /D "%USERPROFILE%/AppData/local/lvim" "%USERPROFILE%/Documents/Github/dotfiles/.config/lvim"
```

##### Nvim

```bash
# Windows
mklink /D "%USERPROFILE%/AppData/local/nvim" "%USERPROFILE%/Documents/Github/dotfiles/.config/nvim"

# Linux
ln -s ~/Documents/GitHub/dotfiles/.config/nvim ~/.config/nvim

```

