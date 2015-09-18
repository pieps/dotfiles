(if (not (file-exists-p (expand-file-name "~/.at_work")))
    (progn
      ;; clang-format
      (load "/usr/local/share/clang/clang-format.el")
      (global-set-key [C-M-tab] 'clang-format-region)
      
			;; turn on go-mode
			(require 'go-mode)

			;; Turn on yasnippet
			;; (require 'yasnippet)

      ;; Irony
      (add-to-list 'load-path (expand-file-name "~/src/emacs/irony-mode/elisp/"))
      (require 'auto-complete)
      (require 'irony)
      (irony-enable 'ac)
      (defun my-c++-hooks ()
        (yas/minor-mode-on)
        (auto-complete-mode 1)
        (irony-mode 1))
      (add-hook 'c++-mode-hook 'my-c++-hooks)
      (add-hook 'c-mode-hook 'my-c++-hooks)

      ;; Autocomplete for go
      (add-to-list 'load-path (expand-file-name "~/src/golang/src/github.com/nsf/gocode/emacs/"))
      (require 'go-autocomplete)
      ;; Turn on autocomplete
      (require 'auto-complete-config)

      (global-auto-complete-mode t)
      (add-to-list 'ac-modes 'go-mode)
      (add-to-list 'ac-modes 'c-mode)
      (add-to-list 'ac-modes 'c++-mode)))
