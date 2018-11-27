SCRIPT_DIR := ${PWD}/osx/scripts/

# array files to symlink into home dir
refs = .profile \
	   .bash_profile \
	   .gitconfig \
	   .gitignore_global \
	   .tmux.conf \
	   .emacs.d

# ORDERED array of scripts to run
scripts = homebrew.sh \
		  node.sh \
		  bitcar.sh \
		  bash.sh

# init:
# 	git submodule init && \
# 	git submodule update

# Targets to create symlinks
symlinks: init $(refs)

.PHONY: $(refs)
$(refs):
	@echo "linking $(PWD)/$@ to $(HOME)/$@" && \
	ln -fs $(PWD)/$@ $(HOME)/$@

# Targets to run setup scripts
scripts: $(scripts)

.PHONY: $(scripts)
$(scripts):
	@echo "running ${SCRIPT_DIR}$@" && \
	${SCRIPT_DIR}$@

.PHONY: whole-shebang
whole-shebang: symlinks scripts
	@echo install complete, be sure to resource your .bash_profile by running "source $$HOME/.bash_profile" or starting a new terminal session

.DEFAULT_GOAL := whole-shebang