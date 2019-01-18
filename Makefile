OS=osx
GIT_CONFIG=.gitconfig
SCRIPT_DIR := ${PWD}/osx/scripts/

# array files to symlink into home dir
refs = .profile \
	   .bash_profile \
	   .gitignore_global \
	   .tmux.conf \
	   .emacs.d

# ORDERED array of scripts to run
scripts = homebrew.sh \
		  node.sh \
		  bitcar.sh \
		  bash.sh \
		  rust.sh

-include ${OS}/Makefile

# Targets to create symlinks
symlinks: $(refs)

.PHONY: $(refs)
$(refs):
	@echo "linking $(PWD)/$@ to $(HOME)/$@" && \
	ln -fs $(PWD)/$@ $(HOME)/

.PHONY: gitconfig
gitconfig:
	@echo "linking $(PWD)/$@ to $(HOME)/$@" && \
	ln -fs $(PWD)/${GIT_CONFIG} $(HOME)/

# Targets to run setup scripts
scripts: $(scripts)

.PHONY: $(scripts)
$(scripts):
	@echo "running $@" && \
	$@

.PHONY: whole-shebang
whole-shebang: symlinks scripts gitconfig
	@echo install complete, be sure to re-source your .profile by running "source $$HOME/.profile" or starting a new terminal session

.DEFAULT_GOAL := whole-shebang