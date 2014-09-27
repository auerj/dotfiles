# Detect OS
UNAME_S := $(shell uname -s)

install: install-git install-zsh install-sublime

install-git:
	rm -f ~/.gitconfig
	ln -s `pwd`/git/gitconfig ~/.gitconfig

install-zsh:
	rm -f ~/.zshrc
	ln -s `pwd`/zsh/zshrc ~/.zshrc

install-sublime:
ifeq ($(UNAME_S),Darwin)
	rm -f ~/Library/Application\ Support/Sublime\ Text\ 2/Packages/User/Preferences.sublime-settings
	ln -s `pwd`/Sublime/Preferences.sublime-settings ~/Library/Application\ Support/Sublime\ Text\ 2/Packages/User/Preferences.sublime-settings
endif

install-vim:
ifeq ($(UNAME_S),Darwin)
	brew install vim
	brew install macvim --override-system-vim
	brew link macvim
endif
