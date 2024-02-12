# .dotfiles
## Recommended fonts:
https://github.com/romkatv/powerlevel10k/blob/master/font.md

## Install
```sh
curl -o- https://raw.githubusercontent.com/fcolic89/.dotfiles/main/setup.sh | bash
```
### Install dotfiles without installing additional programs
```sh
curl -o- https://raw.githubusercontent.com/fcolic89/.dotfiles/main/setup.sh | PROGRAMS=0 bash
```
### Install dotfiles with ssh
```sh
curl -o- https://raw.githubusercontent.com/fcolic89/.dotfiles/main/setup.sh | GITHUB_SSH=1 bash
```
### Install dotfiles from a different branch
```sh
curl -o- https://raw.githubusercontent.com/fcolic89/.dotfiles/main/setup.sh | GITHUB_BRANCH=example bash
```
