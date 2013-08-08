Dotfiles
========

Collection of my . files.

Installation
------------

Setup your .bashrc to source the .dotfilesrc:

```bash
echo '[ -e "$HOME/.dotfilesrc" ] && source "$HOME/.dotfilesrc"' >> "$HOME/.bashrc"
```

You will then need to install the dotfiles repo:

```bash
git clone https://github.com/ryakad/dotfiles
cd dotfiles
make install
```

And you are done. You can either close and reopen your terminal for the changes
to take effect of you can simply source your bashrc manually with `. ~/.bashrc`

> Note: This will backup any existing files `$HOME/.dotfile_backup`. If you run
> the install often you may want to clean that directory from time to time.

Extras
------

My dotfiles repo also includes some scripts that can be used by adding the
dotfile's bin directory to your PATH. You can do this with:

```bash
echo '[ -d "$HOME/dotfiles/bin" ] && export PATH="$PATH:$HOME/dotfiles/bin"' >> "$HOME/.bashrc"
```
