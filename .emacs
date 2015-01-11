;; Red Hat Linux default .emacs initialization file  ; -*- mode: emacs-lisp -*-

;; Set up the keyboard so the delete key on both the regular keyboard
;; and the keypad delete the character under the cursor and to the right
;; under X, instead of the default, backspace behavior.
(global-set-key [delete] 'delete-char)
(global-set-key [kp-delete] 'delete-char)

;; turn on font-lock mode
(global-font-lock-mode t)
;; enable visual feedback on selections
(setq-default transient-mark-mode t)

;; always end a file with a newline
(setq require-final-newline t)

;; stop at the end of the file, not just add lines
(setq next-line-add-newlines nil)

;; tabs look like 2 spaces
(setq default-tab-width 2)

(when window-system
  ;; enable wheelmouse support by default
  (mwheel-install)
  ;; use extended compound-text coding for X clipboard
  (set-selection-coding-system 'compound-text-with-extensions))

(setq x-select-enable-clipboard)

(require 'package)
(add-to-list 'package-archives 
  '("marmalade" .
    "https://marmalade-repo.org/packages/"))
(package-initialize)

;; Fire up Evil
(require 'evil)
(evil-mode 1)

;; turn on go-mode
(require 'go-mode)

;; Turn on yasnippet
(require 'yasnippet)

;; Turn on autocomplete
(require 'auto-complete-config)
;; Autocomplete for go
;;(add-to-list 'load-path (expand-file-name "~/src/golang/src/github.com/nsf/gocode/emacs/"))
;;(require 'go-autocomplete)

(add-to-list 'ac-modes 'go-mode)
;;(add-to-list 'ac-modes 'c-mode)
;;(add-to-list 'ac-modes 'c++-mode)

;; Autocomplete for C/C++
(add-to-list 'load-path "~/.emacs.d/auto-complete-clang-async")
(require 'auto-complete-clang-async)

(defun ac-cc-mode-setup ()
	(setq ac-clang-complete-executable "~/.emacs.d/auto-complete-clang-async/clang-complete")
	(setq ac-sources '(ac-source-clang-async))
	(ac-clang-launch-completion-process)
)

(defun my-ac-config ()
	(add-hook 'c-mode-common-hook 'ac-cc-mode-setup)
	(add-hook 'auto-complete-mode-hook 'ac-common-setup)
	(global-auto-complete-mode t))

(my-ac-config)
