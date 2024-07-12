
(set-frame-font "Inconsolata 13")

(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
;; use`ibuffer' instead of `list-buffers'
(global-set-key (kbd "C-x C-b") 'ibuffer)
;; Shortens Emacs's yes or no question.
(fset 'yes-or-no-p 'y-or-n-p)

;; vertical completion of file and buffer names among other things
(fido-vertical-mode 1)

;; eLisp package repositories
(setq package-archives
        '(("gnu"          . "https://elpa.gnu.org/packages/")
          ("org"          . "https://orgmode.org/elpa/")
          ("melpa-stable" . "https://stable.melpa.org/packages/")
          ("melpa" . "https://melpa.org/packages/")
          ("nongnu" . "https://elpa.nongnu.org/nongnu/")))
(package-initialize)


;; Bootstrap the package bootstrapper...if and only if it is not already
;; bootstrapped.
;;
;; Thanks go to
;; http://cachestocaches.com/2015/8/getting-started-use-package/ for the trick.
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package)
  (package-install 'gnu-elpa-keyring-update) ; See https://elpa.gnu.org/packages/gnu-elpa-keyring-update.html
  (package-install 'delight))


;;;;;;;;;;;;;;;;;;;;;;;;
;; Download packages. ;;
;;;;;;;;;;;;;;;;;;;;;;;;
(use-package rebecca-theme)
(use-package magit'
  :config
  ;; This tells Emacs's package manager that it can upgrade built-in
  ;; packages. Magit suggested to do this in Emacs 28.2 to update
  ;; seq.
  (setq package-install-upgrade-built-in t)
  :bind ("C-c t g" . magit-status))

(use-package display-fill-column-indicator
  ;; Display-fill-column-indicator is built-in to Emacs; thus, downloading is not necessary.
  :ensure nil
  :hook (prog-mode . display-fill-column-indicator-mode))
(use-package ace-window
  ;; This allows you to rapidly switch windows by number.
  :bind ("C-c C-o" . ace-window))
(use-package which-key
  ;; which-key will help learn key-bindings in emacs by automatically
  ;; popping up after "hesitating"
  :config
  (which-key-mode 1))
(use-package winner
  ;; Winner is "back-button" for windows C-c <left> and everything else
  :config
  (winner-mode 1))
(use-package ruler-mode
  ;; Creates a horizontal ruler of text-mode buffers.
  :hook ((text-mode . ruler-mode)
	 (prog-mode . ruler-mode)))
(use-package smart-tab
  ;; Trying to enable smart-tab completion: tab will either complete
  ;; or indent depending on what part of the line it is. If you are at
  ;; the end of the line, it would try to complete. If you are at the
  ;; beginning, it will indent.
  :config
  (global-smart-tab-mode 1))
(use-package corfu
  ;; Corfu is a completion pop-up that uses the standard Emacs
  ;; machinery.
  :config
  (global-corfu-mode 1)

  ;; TAB-and-Go customizations
  :custom
  (corfu-cycle t "Enable cycling for `corfu-next/previous'") 
  (corfu-preselect 'prompt "Always preselect the prompt")
  (corfu-auto t "enable-autocompletion")

  ;; Use TAB for cycling, default is `corfu-complete'.
  :bind
  (:map corfu-map
        ("TAB" . corfu-next)
        ([tab] . corfu-next)
        ("S-TAB" . corfu-previous)
        ([backtab] . corfu-previous)))

(use-package kind-icon
  :after corfu
  ;:custom (kind-icon-blend-background t) (kind-icon-default-face
  ; 'corfu-default) ; only needed with blend-background
  :config
  (add-to-list 'corfu-margin-formatters #'kind-icon-margin-formatter))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(comment-style 'box)
 '(custom-enabled-themes '(rebecca))
 '(custom-safe-themes
   '("9724b3abaf500b227faa036dcf817abed9764802835ba6e8d1e475c877205157" default))
 '(display-fill-column-indicator-character nil)
 '(display-line-numbers t)
 '(electric-pair-mode t nil nil "Whenever typing a left-paranthesis, it will type a corresponding right parenthesis. The same applies for all other brackets. ")
 '(global-display-line-numbers-mode t)
 '(package-selected-packages
   '(seq kind-icon corfu smart-tab winner-mode which-key ace-window magit rebecca-theme))
 '(use-package-always-ensure t)
 '(visible-bell t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
