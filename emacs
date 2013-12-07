(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If e is more than one, they won't work right.
 '(cua-enable-cua-keys t)
 '(cua-mode t nil (cua-base))
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(truncate-lines t)
 '(scroll-step 1)
 '(mouse-wheel-scroll-amount '(1))
 '(tab-width 4))

(setq font-lock-maximum-size 1000000)

(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )


;; Changes all yes/no questions to y/n type
(fset 'yes-or-no-p 'y-or-n-p)


;; Put autosave files (ie #foo#) in one place, *not*
;; scattered all over the file system!
(defvar autosave-dir
 (concat "/tmp/emacs_autosaves/" (user-login-name) "/"))

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
(defvar backup-dir (concat "/tmp/emacs_backups/" (user-login-name) "/"))
(setq backup-directory-alist (list (cons "." backup-dir)))



;; "(require 'cl)
;; 
;; ;; I keep all my emacs-related stuff under ~/emacs
;; (defvar emacs-root (if (or (eq system-type 'cygwin)
;; 			 (eq system-type 'gnu/linux)
;; 			 (eq system-type 'linux))
;; 		 "/home/stevey/" 		 "c:/home/stevey/")
;;  "My home directory — the root of my personal emacs load-path.")
;; 
;; ;; add all the elisp directories under ~/emacs to my load path
;; (labels ((add-path (p)
;; 	 (add-to-list 'load-path
;; 			(concat emacs-root p))))
;; 

(setq load-path (append '("~/.emacs.d/")  load-path ))


(require 'color-theme)
(color-theme-deep-blue)
;; (color-theme-arjen)
;;

(autoload 'ruby-mode "ruby-mode"
	  "Mode for editing ruby source files" t)
(setq auto-mode-alist
      (append '(("\\.rb$" . ruby-mode)) auto-mode-alist))
(setq interpreter-mode-alist (append '(("ruby" . ruby-mode))
				     interpreter-mode-alist))


(autoload 'run-ruby "inf-ruby"
	  "Run an inferior Ruby process")
(autoload 'inf-ruby-keys "inf-ruby"
	  "Set local key defs for inf-ruby in ruby-mode")
(add-hook 'ruby-mode-hook
	  '(lambda ()
	     (inf-ruby-keys)
	     ))

(setq auto-mode-alist 
      (append '(("\\.ml[iylp]?$" . tuareg-mode)) auto-mode-alist))
(autoload 'tuareg-mode "tuareg" "Major mode for editing Caml code" t)
(autoload 'camldebug "camldebug" "Run the Caml debugger" t)


;(add-hook 'haskell-mode-hook 'turn-on-haskell-ghci)

(setq auto-mode-alist
      (append auto-mode-alist
              '(("\\.[hg]s$"  . haskell-mode)
                ("\\.hi$"     . haskell-mode)
                ("\\.l[hg]s$" . literate-haskell-mode))))

(autoload 'haskell-mode "haskell-mode"
  "Major mode for editing Haskell scripts." t)


;;(set-frame-font "-*-Courier New-normal-r-*-*-10-*-*-*-c-*-iso8859-1")
;;(set-frame-font "-*-Courier New-normal-r-*-*-12-*-*-*-c-*-iso8859-1")

;; get rid of the scroll bars and tool bar to free up screen space
;; (I'm not ready to give up the menubar yet but the following commented
;; out line will do the trick if you want to)
;; (if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))


;; (global-set-key "\C-x\C-m" 'execute-extended-command)


(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-c\C-k" 'kill-region)

(global-set-key "\C-ct" 'beginning-of-buffer)
(global-set-key "\C-ce" 'end-of-buffer)

;;(global-set-key "\C-cr" 'comment-or-uncomment-region)


(defun jao-toggle-selective-display ()
  (interactive)
  (set-selective-display (if selective-display nil 1)))

(global-set-key [f1] 'jao-toggle-selective-display)
(global-set-key [(control tab)] 'next-buffer) ;; or other-window

(add-to-list 'load-path "/home/nimrodm/.emacs.d/clojure")

(require 'clojure-auto)

;; matlab syntax highlighting
(autoload 'matlab-mode "matlab" "Enter MATLAB mode." t)
(setq auto-mode-alist (cons '("\\.m\\'" . matlab-mode) auto-mode-alist))
(autoload 'matlab-shell "matlab" "Interactive MATLAB mode." t)
;;   (setq matlab-shell-command-swithes '("-nojvm"))
