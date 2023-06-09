### Terminal Setup & Config Files

git branch + time and working directory path

![syntax highlight](./shell.png)



![git branch](./shell-2.png)

### Terminal Emulator

- [Terminology](https://www.enlightenment.org/docs/apps/terminology.md)

### Unix Shell

- [Zsh](https://en.wikipedia.org/wiki/Z_shell)

### OS Environment

- [Arch Linux](https://archlinux.org)

### TODO

- [ ] Add more file dotfiles<sup id ="fn1">[1](#add-more-dotfiles)</sup> in this repo.
- [ ] Add global .gitignore file

<span id="fn1">1 </span> Add the following dotfiles [&#8617;](#fn1)

- .tmux.conf
- .vimrc
- ~~.zprofile~~
- .asciinema
- .gitconfig
- .todo.cfg

### Misc

#### List all .gitconfig parameters

```shell
$ git config --list
```

#### List just aliases

```shell
$ git config --get-regexp alias
```

Alias:**gsa**

### Reference

- [The best way to store your dotfiles: A bare Git repository](https://www.atlassian.com/git/tutorials/dotfiles)
- [Zsh Theme : Powerlevel10k](https://github.com/romkatv/powerlevel10k)
- [Inspiration](https://github.com/Powerlevel9k/powerlevel9k/wiki/Show-Off-Your-Config)
