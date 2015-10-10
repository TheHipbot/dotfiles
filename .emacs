(package-initialize)
(let ((default-directory "/usr/local/share/emacs/site-lisp/"))
  (normal-top-level-add-subdirs-to-load-path))
(require 'package)
  (add-to-list
   'package-archives
   '("melpa" . "http://melpa.org/packages/")
   t)
(require 'auto-complete)
(global-auto-complete-mode t)
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)
(setq neo-window-width 40)
