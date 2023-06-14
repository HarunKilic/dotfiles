#!/bin/bash

WIN_LVIM_PATH="%USERPROFILE%/AppData/local/lvim"
LVIM_SYMLINK_PATH="%USERPROFILE%/Documents/Github/dotfiles/.config/lvim"
echo "$(realpath "$LVIM_SYMLINK_PATH")"

if [[ "$OSTYPE" == "msys" || "$OSTYPE" == "cygwin" ]]; then
  # create symlink for windows
  echo "Linking..."
  cmd.exe /C "mklink /D "%USERPROFILE%/AppData/local/lvim" "%USERPROFILE%/Documents/Github/dotfiles/.config/lvim""
  echo "Symlink created successfully!"
else
  echo "Error: This script is currently only intented for Windows only."
fi
