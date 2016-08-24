;; global variables
(setq
  inhibit-startup-screen t
  create-lockfiles nil
  make-backup-files nil
  column-number-mode t
  scroll-error-top-bottom t
  use-package-always-ensure t
  sentence-end-double-space nil)

(require 'cl)
(setq my-packages '(auto-complete git-gutter go-autocomplete go-mode
                    haskell-mode multiple-cursors neotree
                    clojure-mode popup solarized-theme
                    alchemist erlang tern tern-auto-complete
                    intero flymake-go go-errcheck multiple-cursors
                    exec-path-from-shell yaml-mode))

(package-initialize)
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))

(defun my-packages-installed-p ()
  (loop for p in my-packages
        when (not (package-installed-p p)) do (return nil)
        finally (return t)))


(unless (my-packages-installed-p)
  ;; check for new packages (package versions)
  (package-refresh-contents)
  ;; install the missing packages
  (dolist (p my-packages)
    (when (not (package-installed-p p))
      (package-install p))))

(show-paren-mode t)
(global-linum-mode t)

(require 'git-gutter)
(global-git-gutter-mode t)
(require 'auto-complete)
(require 'flymake-go)

(global-auto-complete-mode t)
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)
(setq neo-window-width 40)

;; modes
(electric-indent-mode 0)

;; tabbing
(setq-default indent-tabs-mode nil)
(setq tab-width 4)
(setq-default tab-width 4)
(defvaralias 'c-basic-offset 'tab-width)
(add-hook 'haskell-mode-hook 'intero-mode)
(setq-default tab-always-indent t)

(require 'tern-auto-complete)
(autoload 'tern-mode "tern.el" nil t)

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

;; Multiple cursors setup
;; TODO figure out how to map C-S from terminal
(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;; Call gofmt on save for go code
(setq exec-path (cons "/usr/local/go/bin" exec-path))
(add-to-list 'exec-path "/Users/jeremychambers/go/bin")

(defun go-mode-custom-hook ()
  ;; Call Gofmt before saving
  (add-hook 'before-save-hook 'gofmt-before-save)
  ;; Customize compile command to run go build
  (if (not (string-match "go" compile-command))
      (set (make-local-variable 'compile-command)
           "go build -v && go test -v && go vet"))
  ;; Godef jump key binding
  (local-set-key (kbd "M-.") 'godef-jump))
(add-hook 'go-mode-hook 'go-mode-custom-hook)
