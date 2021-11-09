# vim-config

My VIM setup

# Requirements

* neovim >= 0.5.0

    sudo add-apt-repository ppa:neovim-ppa/stable
    sudo apt-get update
    sudo apt-get install neovim

* NerdFont of your choice from https://www.nerdfonts.com/

    cd ~/.fonts

    wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Agave.zip; unzip Agave.zip; rm -f Agave.zip
    wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/CascadiaCode.zip; unzip CascadiaCode.zip; rm -f CascadiaCode.zip
    wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/DaddyTimeMono.zip; unzip DaddyTimeMono.zip; rm -f DaddyTimeMono.zip
    wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/JetBrainsMono.zip; unzip JetBrainsMono.zip; rm -f JetBrainsMono.zip
    wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Hack.zip; unzip Hack.zip; rm -f Hack.zip
    wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/SpaceMono.zip; unzip SpaceMono.zip; rm -f SpaceMono.zip
    wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/BitstreamVeraSansMono.zip; unzip BitstreamVeraSansMono.zip; rm -f BitstreamVeraSansMono.zip
    wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Monoid.zip; unzip Monoid.zip; rm -f Monoid.zip

    fc-cache -f

# Installation

    git clone https://github.com/sinisa-susnjar/vim-config.git

    cd vim-config

    git submodule update --init --recursive # for Vundle

    cd

    if [ -f .vimrc ]; then mv .vimrc .vimrc.bak; fi
    if [ -d .vim ]; then mv .vim .vim.bak; fi
    if [ -d .config/nvim ]; then mv .config/nvim .config/nvim.bak; fi

    ln -s $OLDPWD/vimrc ~/.vimrc
    ln -s $OLDPWD/vim ~/.vim
    ln -s $OLDPWD/nvim ~/.config/nvim

# Install Plugins for NeoVim

    :PluginInstall
    :UpdateRemotePlugins
