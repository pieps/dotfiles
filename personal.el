(if (not (file-exists-p (expand-file-name "~/.at_work")))
    (progn
      ;; clang-format
      (load "/usr/local/share/clang/clang-format.el")
      (global-set-key [C-M-tab] 'clang-format-region)
      
			;; turn on go-mode
			(require 'go-mode)

			;; Turn on yasnippet
			;; (require 'yasnippet)

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

			(my-ac-config)))
