# dotfiles

This repository contains the my shell configuration. This is not intended is a framework for anyone, just my personal preferences.


## clone

This repository includes submodules, include them in the clone:

```sh
git clone --recurse-submodules ssh://git@github.com/jamescun/dotfiles.git
```

If I forgot, run:

```sh
git submodule update --init --recursive
```


## setup

[Homebrew](https://brew.sh) is required.

Use the [Homebrew Bundle](Brewfile) to install/update all of my tools.

```sh
brew bundle install
```

```sh
task setup
```
