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

;; always follow VC symlinks
(setq vc-follow-symlinks t)

(when window-system
  ;; enable wheelmouse support by default
  (mwheel-install)
  ;; use extended compound-text coding for X clipboard
  (set-selection-coding-system 'compound-text-with-extensions))

;;
;; pieps' additions
;;

(require 'package)
(add-to-list 'package-archives 
  '("marmalade" .
    "https://marmalade-repo.org/packages/"))
(add-to-list 'package-archives 
  '("melpa" .
    "https://melpa.org/packages/"))
(package-initialize)

;; Turn on Google magic
(if (file-exists-p "~/dotfiles/google.el")
		(load-file "~/dotfiles/google.el"))

(setq x-select-enable-clipboard)
;; Fire up Evil
(require 'evil)
(evil-mode 1)

;; Turn on Ace Jump
(require 'ace-jump-mode)

(if (file-exists-p "~/dotfiles/ace_evil_config.el")
		(load-file "~/dotfiles/ace_evil_config.el"))

(if (file-exists-p "/Users/pieps/dotfiles/ace_evil_config.el")
		(load-file "/Users/pieps/dotfiles/ace_evil_config.el"))

;; Turn off toolbar
;; (tool-bar-mode -1)

;; Column number mode
(setq column-number-mode t)

;; Always auto-revert buffers when they change on the filesystem
(global-auto-revert-mode)

;; Turn on midnight mode
(setq midnight-mode t)
(midnight-delay-set 'midnight-delay "3:00am")

(global-set-key "\C-x\C-r" 'revert-buffer)
(global-set-key "\C-x\C-l" 'goto-line)
(global-set-key [f5] 'google-compile)
(global-set-key [f6] 'next-error)
(global-set-key "\M-h" 'evil-window-left)
(global-set-key "\M-H" 'evil-window-move-far-left)
(global-set-key "\M-j" 'evil-window-down)
(global-set-key "\M-J" 'evil-window-move-very-bottom)
(global-set-key "\M-k" 'evil-window-up)
(global-set-key "\M-K" 'evil-window-move-very-top)
(global-set-key "\M-l" 'evil-window-right)
(global-set-key "\M-L" 'evil-window-move-far-right)
(global-set-key "\M-n" 'evil-ex-nohighlight)
(global-set-key "\C-x\C-o" 'rotate-windows)
(global-set-key "\C-e" 'move-end-of-line)

(defvar user-temporary-file-directory "/tmp/.emacs-autosaves" )

;; Put autosave files (ie #foo#) in one place, *not* scattered all over the
;; file system! (The make-autosave-file-name function is invoked to determine
;; the filename of an autosave file.)
(defvar autosave-dir "/tmp/.emacs-autosaves/")
(make-directory autosave-dir t)

(defun auto-save-file-name-p (filename)
  (string-match "^#.*#$" (file-name-nondirectory filename)))

(defun make-auto-save-file-name ()
  (concat autosave-dir
   (if buffer-file-name
      (concat "#" (file-name-nondirectory buffer-file-name) "#")
    (expand-file-name
     (concat "#%" (buffer-name) "#")))))

;; Put backup files (ie foo~) in one place too. (The backup-directory-alist
;; list contains regexp=>directory mappings; filenames matching a regexp are
;; backed up in the corresponding directory. Emacs will mkdir it if necessary.)
(defvar backup-dir "/tmp/.emacs-backups/")
(setq backup-directory-alist (list (cons "." backup-dir)))

;; Additions via Kai
(require 'compilation-colorization) ;; colorizes output of (i)grep

(setq auto-mode-alist (cons '("\\.js$" . java-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.tpl$" . html-mode) auto-mode-alist))
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(indent-tabs-mode nil))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
;; Proper indentation
(add-hook 'java-mode-hook (lambda () (c-set-offset 'arglist-cont-nonempty '++)))

;; Switch between cc and h
(add-hook 'c-mode-common-hook
  (lambda() 
    (local-set-key  (kbd "C-c o") 'ff-find-other-file)))
(add-hook 'c-mode-common-hook
  (lambda() 
    (local-set-key  (kbd "M-o") 'ff-find-other-file)))

;; stevey's rotate windows function
(defun rotate-windows ()
  "Rotate your windows"
  (interactive)
  (cond
   ((not (> (count-windows) 1))
    (message "You can't rotate a single window!"))
   (t
    (setq i 1)
    (setq numWindows (count-windows))
    (while  (< i numWindows)
      (let* (
             (w1 (elt (window-list) i))
             (w2 (elt (window-list) (+ (% i numWindows) 1)))
             (b1 (window-buffer w1))
             (b2 (window-buffer w2))
             (s1 (window-start w1))
             (s2 (window-start w2)))
        (set-window-buffer w1  b2)
        (set-window-buffer w2 b1)
        (set-window-start w1 s2)
        (set-window-start w2 s1)
        (setq i (1+ i)))))))

(if (file-exists-p "~/dotfiles/personal.el")
		(load-file "~/dotfiles/personal.el"))
