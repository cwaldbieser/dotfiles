# My Dotfiles

- author: cwaldbieser
- dotfile manager: [dotdrop](https://dotdrop.readthedocs.io/en/latest/)

## Import a dotfile

Example - Import ~/.vimrc:

```shell
(dotenv) ~/home/user@example.org:~/dotfiles$ dotdrop import ~/.vimrc
(dotenv) ~/home/user@example.org:~/dotfiles$
```

## Compare dotfiles

```shell
(dotenv) ~/home/user@example.org:~/dotfiles$ dotdrop compare
(dotenv) ~/home/user@example.org:~/dotfiles$
```

## Install dotfiles

```shell
(dotenv) ~/home/user@example.org:~/dotfiles$ dotdrop install
(dotenv) ~/home/user@example.org:~/dotfiles$
```

## Supporting Files

- requirements-nvim.txt: A list of Python packages installed into the Python
  virtualenv I use for neovim.

## Neovim Configuration

Probably the most complicated configuration I have is for nvim.

### Treesitter setup

Install the treesitter-cli.  It uses node, so I typically use `nvm` for
managing node environments.  Just remember if you change the default node
environment, you need to install the treesitter cli into it:

```shell
$ npm install -g tree-sitter-cli
```
### Language servers

#### Typescript

If you change the default node environment remember to install the TypeScript
language server with:

```shell
$ npm install -g typescript-language-server
```
