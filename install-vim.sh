set -e

if [ ! -n "$OH_MY_VIM" ]; then
  OH_MY_VIM=~/.oh-my-vim
fi

if [ -d "$OH_MY_VIM" ]; then
  echo "\033[0;33mYou already have Oh My Vim installed.\033[0m You'll need to remove $OH_MY_VIM if you want to install"
  exit
fi

echo "\033[0;34mCloning Oh My Vim...\033[0m"
hash git >/dev/null 2>&1 && /usr/bin/env git clone https://github.com/deonthomasgy/oh-my-dotfiles.git $OH_MY_VIM || {
  echo "git not installed"
  exit
}

echo "\033[0;34mLooking for an existing vim config...\033[0m"
if [ -f ~/.vimrc ] || [ -h ~/.vimrc ]; then
  echo "\033[0;33mFound ~/.vimrc.\033[0m \033[0;32mBacking up to ~/.vimrc.pre-oh-my-vim\033[0m";
  mv ~/.vimrc ~/.vimrc.pre-oh-my-vim;
fi

echo "\033[0;34mLooking for an existing vim folder...\033[0m"
if [ -f ~/.vimrc ] || [ -h ~/.vimrc ]; then
  echo "\033[0;33mFound ~/.vim.\033[0m \033[0;32mBacking up to ~/.vim.pre-oh-my-vim\033[0m";
  mv ~/.vim ~/.vim.pre-oh-my-vim;
fi


if [ ! -d "bundle" ]; then
    echo "\033[0;34mSetting up vim...\033[0m"
    cp -ra $OH_MY_VIM/.vim ~/
    ln -s ~/.vim/vimrc ~/.vimrc
    vim -c :BundleInstall
fi

echo "\033[0;32m"'  ____  __     __  _____  __  _   ________  ___  '"\033[0m"
echo "\033[0;32m"' / __ \/ /    /  |/  /\ \/ / | | / /  _/  |/  /  '"\033[0m"
echo "\033[0;32m"'/ /_/ / _ \  / /|_/ /  \  /  | |/ // // /|_/ /   '"\033[0m"
echo "\033[0;32m"'\____/_//_/ /_/  /_/   /_/   |___/___/_/  /_/    '"\033[0m"

echo "\n\n \033[0;32mPlease look over the ~/.vimrc file to select plugins, themes, and options.\033[0m"
echo "\n\n \033[0;32mThen open you vim and it will install plugins for you (BundleInstall).\033[0m"
echo "\n\n \033[0;32mEnjoy!.\033[0m"
