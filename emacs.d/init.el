(setq dotfiles-dir (file-name-directory
                    (or (buffer-file-name) load-file-name)))

(add-to-list 'load-path dotfiles-dir)
(add-to-list 'load-path (concat dotfiles-dir "/ruby"))  ;; nimrod: added

;; Ruby ;;

(autoload 'ruby-mode "ruby-mode" "Major mode for ruby files" t)
(add-to-list 'auto-mode-alist '("\\.rb$" . ruby-mode))
(add-to-list 'interpreter-mode-alist '("ruby" . ruby-mode))

(autoload 'run-ruby "inf-ruby" "Run an inferior Ruby process")
(autoload 'inf-ruby-keys "inf-ruby" "Set local key defs for inf-ruby in ruby-mode")
(add-hook 'ruby-mode-hook
   '(lambda () 
         (setq comint-prompt-read-only t)
         (setq comint-process-echoes t)
         (inf-ruby-keys)))

(require 'color-theme)
(color-theme-deep-blue)

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(c-basic-offset 4)
 '(cua-enable-cua-keys t)
 '(cua-mode t nil (cua-base))
 '(indent-tabs-mode nil)
 '(inhibit-splash-screen t)
 '(mouse-wheel-scroll-amount (quote (1)))
 '(scroll-step 1)
 '(tab-width 4)
 '(truncate-lines t))

(normal-erase-is-backspace-mode 1)

(setq backup-directory-alist `(("." . "~/tmp")))


;; Changes all yes/no questions to y/n type
(fset 'yes-or-no-p 'y-or-n-p)

;; get rid of the scroll bars and tool bar to free up screen space
;; (I'm not ready to give up the menubar yet but the following commented
;; out line will do the trick if you want to)
;; (if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))

;;(set-frame-font "-*-Courier New-normal-r-*-*-10-*-*-*-c-*-iso8859-1")
;;(set-frame-font "-*-Courier New-normal-r-*-*-12-*-*-*-c-*-iso8859-1")
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )

(global-auto-revert-mode 1)
(set-frame-height (selected-frame) 60)
(set-frame-width (selected-frame) 120)

;; move between windows using shift-up/dn/left-right
;; note: c-x c-q makes buffer read only
(windmove-default-keybindings)

