(add-to-list 'load-path "~/.emacs.d")

; First, avoid the evil:
(when (featurep 'xemacs)
  (error "This machine runs xemacs, install GNU Emacs first."))

(require 'color-theme)
(load-theme 'zenburn)
(color-theme-zenburn)


;; ===== Set standard indent to 2 rather that 4 ====
(setq standard-indent 4)

;; ========== Prevent Emacs from making backup files ==========
(setq make-backup-files nil) 

;; Show line-number in the mode line
(line-number-mode 1)

;; Show column-number in the mode line
(column-number-mode 1)
