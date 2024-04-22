;; use`ibuffer' instead of `list-buffers'
(global-set-key (kbd "C-x C-b") 'ibuffer)
;; Shortens Emacs's yes or no question.
(fset 'yes-or-no-p 'y-or-n-p)
;; eLisp package repositories
(setq package-archives
        '(("gnu"          . "https://elpa.gnu.org/packages/")
          ("org"          . "https://orgmode.org/elpa/")
          ("melpa-stable" . "https://stable.melpa.org/packages/")
          ("melpa" . "https://melpa.org/packages/")
          ("nongnu" . "https://elpa.nongnu.org/nongnu/")))
(package-initialize)

;;;;;;;;;;;;;;;;;;;;;;;;
;; Download packages. ;;
;;;;;;;;;;;;;;;;;;;;;;;;
(use-package rebecca-theme)
(use-package magit
  :bind ("C-c t g" . magit-status))

(use-package display-fill-column-indicator
  ;; Display-fill-column-indicator is built-in to Emacs; thus, downloading is not necessary.
  :ensure nil
  :hook (prog-mode . display-fill-column-indicator-mode))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(comment-style 'box)
 '(custom-enabled-themes '(rebecca))
 '(custom-safe-themes
   '("9724b3abaf500b227faa036dcf817abed9764802835ba6e8d1e475c877205157" default))
 '(display-fill-column-indicator-character 9615)
 '(display-line-numbers t)
 '(electric-pair-mode t nil nil "Whenever typing a left-paranthesis, it will type a corresponding right parenthesis. The same applies for all other brackets. ")
 '(global-display-line-numbers-mode t)
 '(package-selected-packages '(magit rebecca-theme))
 '(use-package-always-ensure t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :extend nil :stipple nil :background "#292a44" :foreground "#f1eff8" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight regular :height 133 :width normal :foundry "DAMA" :family "Inconsolata")))))
