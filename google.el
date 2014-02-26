;; Google-specific cruft
(load-file "/home/build/public/eng/elisp/google.el")
(load-file "/home/build/public/eng/elisp/google-coding-style.el")
(load-file "/home/build/public/eng/elisp/google-git.el")
(load "/home/build/public/eng/elisp/googlemenu.el")
;; Turn on Google magic
(require 'google)
(require 'google-imports)

;; Spin up Grok
(grok-init)

;; Woo autocomplete (https://wiki.corp.google.com/twiki/bin/view/Main/EmacsCodeComplete)
(require 'gcomplete)
(gcomplete-setup-flymake)
(gcomplete-setup-for-auto-complete)

;; Additions via Kai
(require 'googlemenu)               ;; handy Google menu bar
(require 'google3)                  ;; magically set paths for compiling google3 code
;(require 'gsearch)                  ;; Search the whole Google code base.
