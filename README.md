# Nvim Config Files


This repo is a workspace to store, and update my personal nvim configuration. 

![Neovim Home](resources/neovim_home.png)

## Terminal and Shell Configuration
I personally use **Fish** as my default shell and **Alacritty** as my terminal. The configuration for both will be updated soon. 

## Text Editor or IDE
Arch Linux
```
sudo pacman -S neovim
```

Make sure to to have **neovim** at version 0.5.0 or higher

```
NVIM v0.7.0
Build type: Release
LuaJIT 2.1.0-beta3
Compiled by builduser

Features: +acl +iconv +tui
See ":help feature-compile"

   system vimrc file: "$VIM/sysinit.vim"
  fall-back for $VIM: "/usr/share/nvim"

Run :checkhealth for more info
```
This is the output of when I type 
```
nvim --version
```

Make sure the directory *~/.config/nvim* exist. If not make sure to make it.
```
mkdir ~/.config/nvim
```
Inside this directory is where we put the config file such as **init.vim** or **init.lua**. Neovim automatically looks at this directory for configuration file, and there must be an **init.vim** or **init.lua** in order for neovim to load those configurations.



## Nvim with Lua

I migrated my **init.vim** file to a better and more organized **lua** config system.
