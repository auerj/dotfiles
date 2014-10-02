# Detect OS
UNAME_S := $(shell uname -s)

install: install-paketmanager install-git install-zsh install-sublime install-vim install-utils

install-paketmanager:
ifeq ($(UNAME_S),Darwin)
	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	brew update
	brew install caskroom/cask/brew-cask
endif

install-git:
ifeq ($(UNAME_S),Darwin)
	brew install git
else
	sudo apt-get install git
endif
	rm -f ~/.gitconfig
	ln -s `pwd`/git/gitconfig ~/.gitconfig

install-zsh:
ifeq ($(UNAME_S),Darwin)
else
	sudo apt-get install zsh
	chsh -s `which zsh`
endif
	wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh
	rm -f ~/.zshrc
	ln -s `pwd`/zsh/zshrc ~/.zshrc

install-sublime:
ifeq ($(UNAME_S),Darwin)
	brew cask install sublime-text
	rm -f ~/Library/Application\ Support/Sublime\ Text\ 2/Packages/User/Preferences.sublime-settings
	ln -s `pwd`/Sublime/Preferences.sublime-settings ~/Library/Application\ Support/Sublime\ Text\ 2/Packages/User/Preferences.sublime-settings
else
	sudo add-apt-repository ppa:webupd8team/sublime-text-2
	sudo apt-get update
	sudo apt-get install sublime-text
endif

install-vim:
ifeq ($(UNAME_S),Darwin)
	brew install vim
	brew install macvim --override-system-vim
	brew link macvim
else
	sudo apt-get install vim
endif

install-utils:
ifeq ($(UNAME_S),Darwin)
	brew cask install dropbox
	brew cask install vlc
	brew cask install skype
	brew cask install the-unarchiver
	brew cask install firefox
	brew cask install google-chrome
else
	sudo apt-get install nautilus-dropbox
	sudo apt-get install vlc
	sudo apt-get install skype
	wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
	sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
	sudo apt-get update
	sudo apt-get install google-chrome-stable
endif
