# vim-env

### Vimrc
- https://github.com/amix/vimrc

### Colorshemes:
- https://github.com/flazz/vim-colorschemes

### Resources:
- https://www.fullstackpython.com/vim.html
- https://dougblack.io/words/a-good-vimrc.html

### Powerline config:
source: https://askubuntu.com/a/283909

Check powerline location path

    $ pip show powerline-status
    
    Name: powerline-status
    Version: 2.6
    Summary: The ultimate statusline/prompt utility.
    Home-page: https://github.com/powerline/powerline
    Author: Kim Silkebaekken
    Author-email: kim.silkebaekken+vim@gmail.com
    License: MIT
    Location: ~/anaconda3/lib/python3.6/site-packages
    Requires: 

Replace {Location} with location from pip powerline-status.

Vim statusline:
Add following to your ~/.vimrc or /etc/vim/vimrc:

    set rtp+={Location}/powerline/bindings/vim/

    " Always show statusline
    set laststatus=2

    " Use 256 colours (Use this setting only if your terminal supports 256 colours)
    set t_Co=256

Bash prompt:
Add the following line to your ~/.bashrc or /etc/bash.bashrc:

    if [ -f {Location}/powerline/bindings/bash/powerline.sh ]; then
        source {Location}/powerline/bindings/bash/powerline.sh
    fi

Zsh prompt:
Add the following line to your ~/.zshrc or /etc/zsh/zshrc:

    if [[ -r {Location}/powerline/bindings/zsh/powerline.zsh ]]; then
        source {Location}/powerline/bindings/zsh/powerline.zsh
    fi

Tmux statusline:
Add the following line to your ~/.tmux.conf:

    source {Location}/powerline/bindings/tmux/powerline.conf
    set-option -g default-terminal "screen-256color"

If your terminal supports 256 colours, Set TERM environment variable to xterm-256color by modifying ~/.bashrc or /etc/bash.bashrc and adding following line:

    export TERM=xterm-256color

To check if your terminal supports 256 colours check the documentation of your terminal or google it. Most popular terminals support 256 colours.
