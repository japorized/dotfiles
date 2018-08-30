# Japorized does Dotfiles
Opinionated configurations for this relatively new and under-educated power user

See also: [`japorized/bin`](https://gitlab.com/japorized/bin)

---

## Screenshots

### Antergos (base installation)

![antergos-base scrot](/screenshots/antergos-base.png?raw=true "antergos-base")

### macOS

![macOS scrot](/screenshots/macos-2018jan22.png?raw=true "macOS Screenshot")

---

## Setup

### Antergos (current main system)

* Installed base package
* WM: [ bspwm ](https://github.com/baskerville/bspwm)
* Hotkey daemon: [ sxhkd ](https://github.com/baskerville/sxhkd)
* Bar: [ lemonbar-xft ](https://github.com/krypt-n/bar) (inspiration from [here](https://www.reddit.com/r/unixporn/comments/6g5vx0/windowchef_comfy/))
* Terminal: [ st ](https://suckless.org), [ termite ](https://github.com/thestinger/termite/), urxvt
* AUR Package Manager: auracle
* Color scheme: [pywal](https://github.com/dylanaraps/pywal)

### macOS (secondary system)

* WM: [ chunkwm ](https://github.com/koekeishiya/chunkwm)
* Hotkey daemon: [ khd ](https://github.com/koekeishiya/khd)
* Terminal: [ iTerm ](https://iterm2.com/), [ kitty ](https://github.com/kovidgoyal/kitty)
* Utility Bar: [ Übersicht ](http://tracesof.net/uebersicht/) with customized [ nerdbar ](https://github.com/apierz/nerdbar.widget)
* Package Manager: [ Homebrew ](https://brew.sh)

---

## Applications

Here's a list of my commonly used applications:

* Shell: zsh
* Text Editors: **nvim**, Sublime Text
* Browser: **FF**, qutebrowser, surf
* Music: mpd + mpc + ncmpcpp
* Image/Graphics Editing: **Affinity Designer**, Gravit (learning), GIMP (learning; replacing Photoshop)
* Documents: **LaTeX** (not a pro but I can get by)

---

## Dotfiles Manager

I use Dotdrop to manage my dotfiles across different machines.

Check out the tool at https://github.com/deadc0de6/dotdrop.

---

## Installation Guide for dotfiles

**Note:** If you are on a completely new machine that does not have pip3 (or pip) do install python using your package manager first.

1. `git clone --recursive https://gitlab.com/japorized/dotfiles ~/dotfiles`
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
  
### antergos-base

Since I use [auracle](https://aur.archlinux.org/packages/auracle-git/), and I did not manually track packages that I have installed via it, 
they are, unfortunately, mixed into the list that I have (or shall) generated using [pacman](https://wiki.archlinux.org/index.php/Pacman). 
Please install packages via pacman as you would normally do, and just cherry-pick those that throws errors, and then install them via 
your favorite AUR package manager.

<sub><sup>Although, if you're not me and using Arch, you wouldn't want my dotfiles anyway :P</sup></sub>

### Ubuntu (or Windows)

---

### Possibly Relevant Links

1. [Why did you switch to Antergos/Arch Linux?](https://japorized.gitlab.io/technical/2018/02/27/making-the-move-to-linux.html)
