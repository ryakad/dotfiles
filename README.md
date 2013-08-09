```text
 _____          __     ___  __  __
|     \ .-----.|  |_ .'  _||__||  |.-----..-----.
|   x  ||  o  ||   _||   _||  ||  ||  x__||__ --|
|_____/ |_____||____||__|  |__||__||_____||_____|
```

Installation
------------

First setup your ~/.bashrc to source the ~/.dotfilesrc and source your ~/.bashrc
from your ~/.bash_profile (or ~/.profile) so that it is run when a terminal
is opened:

```bash
echo '[ -e "$HOME/.dotfilesrc" ] && source "$HOME/.dotfilesrc"' >> "$HOME/.bashrc"
echo '[ -e "$HOME/.bashrc" ] && source "$HOME/.bashrc"' >> "$HOME/.bash_profile"
```

You will then need to install the dotfiles repo:

```bash
git clone https://github.com/ryakad/dotfiles && cd dotfiles
make install
```

You can now either close and reopen your terminal for the changes to take
effect or you can simply source your ~/.bashrc manually with `. ~/.bashrc`

> Note: Running `make install` will backup any existing files to
> ~/.dotfile_backup. If you run the install often you may want to
> clean that directory from time to time.

Extras
------

My dotfiles repo also includes some scripts that can be used by adding the
dotfile's bin directory to your PATH. You can do this with:

```bash
echo '[ -d "$HOME/dotfiles/bin" ] && export PATH="$PATH:$HOME/dotfiles/bin"' >> "$HOME/.bashrc"
```

If you want the dotfiles functions loaded in non-interactive terminals you
can the following to your .bash_profile:

```bash
export BASH_ENV="$HOME/.bashrc"
```
