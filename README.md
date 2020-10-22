My Dotfiles
===========

- author: cwaldbieser
- dotfile manager: [dotdrop](https://dotdrop.readthedocs.io/en/latest/)

Import a dotfile
----------------

Example - Import ~/.vimrc:

    (dotenv) ~/home/user@example.org:~/dotfiles$ dotfile import ~/.vimrc
    (dotenv) ~/home/user@example.org:~/dotfiles$

Compare dotfiles
----------------

    (dotenv) ~/home/user@example.org:~/dotfiles$ dotfile compare
    (dotenv) ~/home/user@example.org:~/dotfiles$

Install dotfiles
----------------

    (dotenv) ~/home/user@example.org:~/dotfiles$ dotfile install
    (dotenv) ~/home/user@example.org:~/dotfiles$

Supporting Files
----------------

- requirements-nvim.txt: A list of Python packages installed into the Python
  virtualenv I use for neovim.
