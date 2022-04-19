
install:
	cp $(HOME)/.vimrc $(HOME)/.vimrc.bkp
	cp .vimrc $(HOME)/.vimrc
	vim -es -u $(HOME)/.vimrc -i NONE -c "PlugInstall" -c "qa"

