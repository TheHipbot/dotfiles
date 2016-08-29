;; global variables
(setq
  inhibit-startup-screen t
  create-lockfiles nil
  make-backup-files nil
  column-number-mode t
  scroll-error-top-bottom t
  use-package-always-ensure t
  sentence-end-double-space nil)

(show-paren-mode t)
(global-linum-mode t)

(setq my-packages '(auto-complete git-gutter go-mode
                    haskell-mode multiple-cursors neotree
                    clojure-mode popup solarized-theme
                    alchemist erlang tern tern-auto-complete
                    intero flymake-go go-errcheck multiple-cursors
                    exec-path-from-shell yaml-mode))

;; repositories
(setq
 package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                    ("org" . "http://orgmode.org/elpa/")
                    ("melpa" . "http://melpa.org/packages/")
                    ("melpa-stable" . "http://stable.melpa.org/packages/")))

;; the package manager
(require 'package)
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

(use-package folding
  :ensure t)

;; modes

(electric-indent-mode 0)

;; go mode
(use-package go-mode
  :ensure t
  :mode "\\.go\\'"
  :init
  (defun go-mode-custom-hook ()
    ;; Call Gofmt before saving
    (add-hook 'before-save-hook 'gofmt-before-save)
    ;; Customize compile command to run go build
    (if (not (string-match "go" compile-command))
        (set (make-local-variable 'compile-command)
             "go build -v && go test -v && go vet"))
             ;; Godef jump key binding
             (local-set-key (kbd "M-.") 'godef-jump))
  :config
  (add-hook 'go-mode-hook 'go-mode-custom-hook))

;; intero for haskell mode
(use-package intero
  :ensure t
  :mode ("\\.hs\\'" . haskell-mode)
  :config
  (add-hook 'haskell-mode-hook 'intero-mode))

;; groovy mode
(use-package groovy-mode
  :ensure t
  :mode "\\.groovy\\'\\|\\.gradle\\'")

;; python mode
(use-package python
  :mode ("\\.py'" . python-mode)
  :init
  (progn
    (defalias 'python2-mode 'python-mode)
    (defalias 'python3-mode 'python-mode)))

;; yaml mode
(use-package yaml-mode
  :ensure t
  :mode "\\.ya?ml\\'")

;; markdown mode
(use-package markdown-mode
  :ensure t
  :mode (("\\.md\\'" . markdown-mode)
         ("\\.mdwn\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init
  (setq markdown-command "~/.config/emacs/markdown"))

;; dockerfile mode
(use-package dockerfile-mode
  :ensure t
  :mode "/Dockerfile\\'")

;; js mode
(use-package js2-mode
  :ensure t
  :mode "\\.js\\'"
  :interpreter "node"
  :init
  (folding-add-to-marks-list 'js2-mode "// {{{" "// }}}" nil t))

;; scala mode
(use-package ensime
  :pin melpa-stable)


;; additional plugins

(use-package auto-complete
  :ensure t
  :config
  (global-auto-complete-mode t)

  (use-package go-autocomplete
    :pin melpa-stable
    :demand t
    :config
    (defun auto-complete-for-go ()
      (auto-complete-mode 1))
    (add-hook 'go-mode-hook 'auto-complete-for-go)))

;; neotree
(use-package neotree
  :ensure t
  :config
  (global-set-key [f8] 'neotree-toggle)
  (setq neo-window-width 40))

;; multiple cursors setup
;; TODO figure out how to map C-S from terminal
(use-package multiple-cursors
  :ensure t
  :bind (("C-* l" . mc/edit-lines)
         ("C-* n" . mc/mark-next-like-this)
         ("C-* p" . mc/mark-previous-like-this)
         ("C-* C-*" . mc/mark-all-like-this)
         ("C-c C-* C-*" . mc/mark-more-like-this)

         ("C-* i" . mc/insert-numbers)
         ("C-* s" . mc/sort-regions)
         ("C-* r" . mc/reverse-regions)
         ("M-<mouse-1>" . mc/add-cursor-on-click))
  :init
  (global-unset-key (kbd "M-<down-mouse-1>"))
  :config
  (require 'mc-extras))

(use-package mc-extras
  :ensure t
  :commands (mc/compare-chars mc/compare-chars-backward mc/compare-chars-forward
                              mc/cua-rectangle-to-multiple-cursors
                              mc/remove-current-cursor mc/remove-duplicated-cursors)
  :config
  (progn
    (bind-keys :map mc/keymap
               ("C-. C-d" . mc/remove-current-cursor)
               ("C-. d" . mc/remove-duplicated-cursors)
               ("C-. =" . mc/compare-chars))
    (eval-after-load 'cua-base
      '(bind-key "C-. C-," 'mc/cua-rectangle-to-multiple-cursors cua--rectangle-keymap))))

;; git-gutter
(use-package git-gutter
  :ensure t
  :config
  (global-git-gutter-mode t))


;; misc

;; tabbing
(setq-default indent-tabs-mode nil)
(setq tab-width 4)
(setq-default tab-width 4)
(defvaralias 'c-basic-offset 'tab-width)
(setq-default tab-always-indent t)

;; Copy and Paste
(defun copy-from-osx ()
  (shell-command-to-string "pbpaste"))

(defun paste-to-osx (text &optional push)
  (let ((process-connection-type nil))
    (let ((proc (start-process "pbcopy" "*Messages*" "pbcopy")))
      (process-send-string proc text)
      (process-send-eof proc))))

(setq interprogram-cut-function 'paste-to-osx)
(setq interprogram-paste-function 'copy-from-osx)
