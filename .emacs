(require 'ido)
(ido-mode t)
(setq load-path (cons "~/.emacs.d/" load-path))

(require 'psvn)

(defun var-safe (v)
 (when (boundp v) (symbol-value v)))

(load "~/.emacs.d/seek-indent.el")

(add-to-list 'load-path "~/.emacs.d/coffee-mode")
(require 'coffee-mode)

;(add-to-list 'auto-mode-alist '("\\.js$" . espresso-mode))
;(add-to-list 'auto-mode-alist '("\\.js.erb$" . espresso-mode))
;(add-to-list 'auto-mode-alist '("\\.json$" . espresso-mode))

(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.handlebars\\'" . html-mode))
(add-to-list 'auto-mode-alist '("\\.hbs\\'" . html-mode))
(add-to-list 'auto-mode-alist '("\\.less\\'" . css-mode))


(setq-default indent-tabs-mode nil)
(setq c-basic-indent 2)
(setq js-indent-level 2)
(setq css-indent-offset 2)
(setq coffee-indent-offset 2)
(setq-default c-basic-offset 2)
(setq-default tab-width 2)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("e2e837fefe7cf7913c605f02d62fba12d9a6ad33aabcae3ab983c165c50967c6" "7345bbdc4312f073ac751730f027867a7dd252d844a21883ef4e23101fb63a7f" default)))
 '(erc-modules (quote (autojoin button completion fill irccontrols match menu netsplit noncommands readonly ring scrolltobottom stamp track)))
 '(idle-update-delay 0.2)
 '(inhibit-startup-screen t)
 '(ns-command-modifier (quote meta))
 '(sql-mysql-program "/usr/local/mysql/bin/mysql"))

(transient-mark-mode 1)
(tool-bar-mode 0)
(menu-bar-mode 0)
(column-number-mode 1)
(scroll-bar-mode -1)

(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)

(iswitchb-mode 1)

(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
(add-hook 'haml-mode-hook
          '(lambda ()
             (setq indent-tabs-mode nil)))

;;; nxml (HTML ERB template support)
;;(load "~/.emacs.d/nxhtml/autostart.el")
;;(load "~/.emacs.d/nxhtml/nxhtml/nxhtml-mode.el")
;;(load-library "autostart")
;;(setq
;; nxhtml-global-minor-mode t
;; mumamo-chunk-coloring 'submode-colored
;; nxhtml-skip-welcome t
;; indent-region-mode t
;; rng-nxml-auto-validate-flag nil
;; nxml-degraded t)
;;(add-to-list 'auto-mode-alist '("\\.html\\.erb\\'" . eruby-nxhtml-mumamo-mode))
(add-to-list 'load-path "~/.emacs.d/rhtml")
(require 'rhtml-mode)


;(global-set-key [return] 'newline-and-indent)
(add-hook 'ruby-mode-hook
 '(lambda() (define-key ruby-mode-map [return] 'newline-and-indent)))
(add-hook 'css-mode-hook
 '(lambda() (define-key css-mode-map [return] 'newline-and-indent)))
(add-hook 'javascript-mode-hook
 '(lambda() (define-key javascript-mode-map [return] 'newline-and-indent)))
(add-hook 'nxhtml-mode-hook
 '(lambda() (define-key nxhtml-mode-map [return] 'newline-and-indent)))
(add-hook 'rhtml-mode-hook
 '(lambda() (define-key rhtml-mode-map [return] 'newline-and-indent)))
(add-hook 'org-mode-hook
 '(lambda() (define-key org-mode-map [return] 'newline-and-indent)))

(defun jas-newline()
  (interactive)
  (move-end-of-line 1)
  (newline-and-indent))
(global-set-key [S-return] 'jas-newline)
(add-hook 'nxhtml-mode-hook
 '(lambda() (define-key nxhtml-mode-map [S-return] 'jas-newline)))

(defun mac-toggle-max-window ()
  (interactive)
  (set-frame-parameter nil 'fullscreen (if (frame-parameter nil 'fullscreen)
                                           nil
                                           'fullboth))) 

(define-key global-map [M-return] 'mac-toggle-max-window)

(setq explicit-bash-args (list "--noediting" "-i" "-l"))

(defun jas-prev-window()
  (interactive)
  (other-window -1))

(global-set-key [(control x) (p)] 'jas-prev-window)

(define-key global-map [(control shift r)] 'comint-previous-matching-input-from-input)
(define-key global-map [(control shift s)] 'comint-next-matching-input-from-input)

(winner-mode 1)


(put 'narrow-to-region 'disabled nil)

(global-set-key "\C-w" 'clipboard-kill-region)
(global-set-key "\M-w" 'clipboard-kill-ring-save)
(global-set-key "\C-y" 'clipboard-yank)

(when (or (string= (system-name) "Hiro.local")
					(string= (system-name) "jstreufert-mba"))
  (set-default-font "-apple-Inconsolata-medium-normal-normal-*-18-*-*-*-m-0-iso10646-1")
  (ns-toggle-fullscreen))


(require 'package)
(add-to-list 'package-archives
 '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

(load-theme 'dichromacy-jas)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "black" :foreground "white" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 180 :width normal :foundry "apple" :family "Inconsolata")))))


(require 'smex)
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)

(add-to-list 'load-path "~/.emacs.d/elpa/neotree-20140810.1926/")
(require 'neotree)
