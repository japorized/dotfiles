# Japorized does Dotfiles
Opinionated configurations for this relatively new and under-educated power user

---

## Setup

### macOS (current main system)

* WM: [ chunkwm ](https://github.com/koekeishiya/chunkwm)
* Hotkey daemon: [ khd ](https://github.com/koekeishiya/khd)
* Terminal: [ iTerm ](https://iterm2.com/), [ kitty ](https://github.com/kovidgoyal/kitty)
* Utility Bar: [ Übersicht ](http://tracesof.net/uebersicht/) with customized [ nerdbar ](https://github.com/apierz/nerdbar.widget)
* Other Utilities: Itsycal
* Package Manager: [ Homebrew ](https://brew.sh)

### Arch (current main VM)

* WM: awesomewm
* Terminal: [ termite ](https://github.com/thestinger/termite/)
* AUR Package Manager: cower

### Windows 10 WSL (pluggable and disposable system :P)

* WM: [ i3-gaps ](https://github.com/Airblader/i3)
* Terminal: termite

---

## Dotfile Manager

I use Dotdrop to manage my dotfiles across different machines.

Check out the tool at https://github.com/deadc0de6/dotdrop.

---

## Installation Guide for dotfiles

**Note:** If you are on a completely new machine that does not have pip3 (or pip) do install python using your package manager first.

1. `git clone --recursive https://github.com/japorized/dotfiles ~/dotfiles`
2. If your system does not have the dependencies for Dotdrop, do
  ```shell
  cd ~/dotfiles
  pip3 install -r ./dotdrop/requirements.txt
  ```
3. Get to know the host name of your machine, and add that to the `config.yaml` file, and specify the files that you wish to sync.
4. Assuming that you are still in the dotfiles directory, do
  ```shell
  ./dotdrop.sh install
  ```

#### Extra
If you wish to save yourself the trouble of having to run `~/dotfiles/dotdrop.sh` every time, do
```shell
ln -s ~/dotfiles/dotdrop.sh ~/.bin/dotdrop
```
and be sure to add `$HOME/.bin` to your `.bash_profile` (for bash) or `.zshenv` (for zsh).

---

## Installation Guide for packages (and applications)

### macOS

Simply run `$HOME/dotfiles/install/mac-bootstrap.sh`

The installation will include [Homebrew](https://brew.sh) and some packages that I use (please see `./install/brewPackages.txt`) and use 
zsh as the default shell, with [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh) installed.
  
### Arch

Since I use [cower](https://aur.archlinux.org/packages/cower/), and I did not manually track packages that I have installed via it, 
they are, unfortunately, mixed into the list that I have (or shall) generated using [pacman](https://wiki.archlinux.org/index.php/Pacman). 
Please install packages via pacman as you would normally do, and just cherry-pick those that throws errors, and then install them via 
your favorite AUR package manager.

<sub><sup>Although, if you're not me and using Arch, you wouldn't want my dotfiles anyway :P</sup></sub>

### Ubuntu (or Windows)

With WSL now being a thing, I find it necessary to put this down (to remind myself how to get things running on WSL).

##### This section is still in the works

#### Enable WSL

1. `Settings > Updates > Developer > Enable Developer Mode`
2. `Start > Enable Windows Features > [Tick] Windows Subsystem for Linux (Ubuntu)`
3. Restart machine
