(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t)
 '(show-paren-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "black" :foreground "white" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 113 :width normal :foundry "unknown" :family "Ubuntu Mono")))))

;; copy and paste
(cond (window-system
   (setq x-select-enable-clipboard t)))

(show-paren-mode t)
(setq initial-frame-alist
      (append (list
               '(foreground-color . "white")
	       '(background-color . "black")
               '(border-color . "black")
               '(mouse-color . "white")
               '(cursor-color . "white")
               '(width . 170)
               '(height . 60)
               '(top . 0)
               '(left . 0)
               '(alpha . (90 100 100 100))
               )
              initial-frame-alist))

;; ctrl-h becomes "backspace"
(global-set-key "\C-h" 'delete-backward-char)

;; python-mode setting up
(add-to-list 'load-path "~/emacs/elisp")
(setq auto-mode-alist
      (cons '("\\.py$" . python-mode) auto-mode-alist))
(autoload 'python-mode "python-mode" "Python editing mode." t)
(add-to-list 'interpreter-mode-alist'("python" . python-mode))
(require 'python-mode)

;; Hide tool bar
(tool-bar-mode -1)

;; Hide scroll bar
(toggle-scroll-bar nil)			

;; showing index of column
(require 'linum)
(global-linum-mode)

;; y or n question
(defalias 'yes-or-no-p 'y-or-n-p)


;; auto-install によってインストールされるemacs lisp をload-path に加える
;; デフォルトは ~/.emacs.d/auto-install/
(add-to-list 'load-path "~/.emacs.d/auto-install/")
(require 'auto-install)
;; 起動時にemacswikiのページ名を補完候補に加える
;(auto-install-update-emacswiki-package-name t)
;; install-elisp.el互換モードにする
;(auto-install-compatibility-setup)
;; ediff関連のbufferを一つにまとめる
(setq ediff-window-setup-function 'ediff-setup-windows-plain)


;;; anything-startup.el --- anything.el startup file

;;; $Id: anything-startup.el,v 1.10 2010-02-04 19:57:31 rubikitch Exp $

;;;; Installation

;;; anything.el is just a framework and predefined configuration is in
;;; anything-config.el. You need install both to use anything
;;; practically.
;;; 
;;; Note: anything-config.el loads anything.el.
(require 'anything-config)

;;; anything-match-plugin.el extends pattern matching. Some Anything
;;; Applications requires it. It is a must-have plugin now.
;;; 
(require 'anything-match-plugin)

;;; If you use Japanese, you should install Migemo and anything-migemo.el.
;;;
;;; Migemo  http://0xcc.net/migemo/
(and (equal current-language-environment "Japanese")
     (require 'anything-migemo nil t))

;;; anything-complete.el replaces various completion with anything
;;; (like Icicles). Use Anything power for normal completion.
(when (require 'anything-complete nil t)
  ;; Automatically collect symbols by 150 secs
  (anything-lisp-complete-symbol-set-timer 150)
  (define-key emacs-lisp-mode-map "\C-\M-i" 'anything-lisp-complete-symbol-partial-match)
  (define-key lisp-interaction-mode-map "\C-\M-i" 'anything-lisp-complete-symbol-partial-match)
  ;; Comment if you do not want to replace completion commands with `anything'.
  (anything-read-string-mode 1)
  )

;;; anything-show-completion.el shows current selection prettily.
(require 'anything-show-completion)

;;; anything-auto-install.el integrates auto-install.el with anything.
(require 'anything-auto-install nil t)

;;; descbinds-anything.el replaces describe-bindings with anything interface.
(when (require 'descbinds-anything nil t)
  ;; Comment if you do not want to replace `describe-bindings' with `anything'.
  (descbinds-anything-install)
  )

;;; `anything-grep' replaces standard `grep' command.
(require 'anything-grep nil t)

(provide 'anything-startup)

;; How to save (DO NOT REMOVE!!)
;; (progn (magit-push) (emacswiki-post "anything-startup.el"))
;;; anything-startup.el ends here





;;Yasnippet!!!

(add-to-list 'load-path
	     "~/emacs/elisp")
(require 'yasnippet-bundle)


;; Haskell Mode

;;;;(load "/usr/share/emacs23/site-lisp/haskell-mode/haskell-site-file")
;;(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
;;;;(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
;;(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
;;(add-hook 'haskell-mode-hook 'turn-on-haskell-simple-indent)


;;php-mode
;;(load-library "php-mode")
;;(require 'php-mode)

;;auto-complete
(add-to-list 'load-path "~/emacs/elisp/")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/emacs/elisp//ac-dict")
(ac-config-default)

;;python completion
(add-to-list 'load-path "~/emacs/elisp/")
(require 'ac-python)
;;(add-to-list 'ac-modes 'python-2-mode)


;; scroll each line
(setq scroll-conservatively 35
      scroll-margin 0
      scroll-step 1)
(setq comint-scroll-show-maximum-output t) ;for shell

;; popwin
(add-to-list 'load-path "~/emacs/elisp/")
(require 'popwin)
(setq display-buffer-function 'popwin:display-buffer)
;; anything popup
(setq anything-samewindow nil)
(push '("*anything*" :height 20) popwin:special-display-config)




;; gdb
;;; 有用なバッファを開くモード
(setq gdb-many-windows t)
;;; 変数の上にマウスカーソルを置くと値を表示
(add-hook 'gdb-mode-hook '(lambda () (gud-tooltip-mode t)))
;;; I/O バッファを表示
(setq gdb-use-separate-io-buffer t)
;;; t にすると mini buffer に値が表示される
(setq gud-tooltip-echo-area nil)


;; smart-compile
(add-to-list 'load-path "~/emacs/elisp/")
(require 'smart-compile)


(add-to-list 'backup-directory-alist
	   (cons "." "~/emacs/backup"))
(setq auto-save-file-name-transforms
      `((".*" ,(expand-file-name "~/emacs/backup"))))

(setq auto-save-timeout 15)
 ;; バックアップ作成までのタイプ間隔
(setq auto-save-interval 60)


;;ipython
(setq ipython-command "/usr/local/bin/ipython")
(require 'ipython)
