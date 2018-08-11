(provide 'init-package-specific)

;; Use 'string' mode for regexes, instead of 'read' mode
;;  causing backslash hell
(setq reb-re-syntax 'string)

(use-package expand-region
  :bind ("C-=" . er/expand-region))

(use-package ace-window
  :bind ("C-x o" . ace-window))

;;; Autocomplete
;; (require 'auto-complete-config)
;; (setq-default ac-sources (add-to-list 'ac-sources 'ac-source-dictionary))
;; (global-auto-complete-mode t)
;; (setq ac-auto-start 2)
;; (setq ac-ignore-case nil)

(use-package avy
  :bind (("C-;" . avy-goto-char)
         ("C-:" . avy-goto-char-2)))

(use-package magit
  :ensure t
  :config
  ;; see https://github.com/magit/magit/issues/2541
  ;; (defun magit-display-buffer-traditional (buffer)
  ;;   "Display BUFFER the way this has traditionally been done."
  ;;   (display-buffer
  ;;    buffer (if (and (derived-mode-p 'magit-mode)
  ;;                    (not (memq (with-current-buffer buffer major-mode)
  ;;                               '(magit-process-mode
  ;;                                 magit-revision-mode
  ;;                                 magit-diff-mode
  ;;                                 magit-stash-mode
  ;;                                 magit-status-mode))))
  ;;               '(display-buffer-same-window)
  ;;             nil))) ; display in another window
  ;; (setq magit-display-buffer-function
  ;;     (lambda (buffer)
  ;;       (display-buffer buffer '(display-buffer-same-window))))
  )

;; Purpose
;; (use-package window-purpose
;;   :config
;;   (purpose-mode))
;; (use-package window-purpose-x
;;   :config
;;   (purpose-x-magit-multi-on))

;; ;; Artist Mode
;; (add-hook 'artist-mode-init-hook 
;; 	  (lambda ()
;; 	    (define-key artist-mode-map (kbd "C-c C-a C-o") 'artist-ido-select-operation)
;; 	    (define-key artist-mode-map (kbd "C-c C-a C-c") 'artist-ido-select-settings)))

;; ;; make sure headers in org-mode are not collapsed
;; ;; (global-set-key (kbd "C-<f1>") (lambda()
;; ;; 			        (interactive)
;; ;; 			        (show-all)
;; ;; 			        (artist-mode)))

;; (defun artist-ido-select-operation (type)
;;   "Use ido to select a drawing operation in artist-mode"
;;   (interactive (list (ido-completing-read "Drawing operation: " 
;;                                           (list "Pen" "Pen Line" "line" "straight line" "rectangle" 
;;                                                 "square" "poly-line" "straight poly-line" "ellipse" 
;;                                                 "circle" "text see-thru" "text-overwrite" "spray-can" 
;;                                                 "erase char" "erase rectangle" "vaporize line" "vaporize lines" 
;;                                                 "cut rectangle" "cut square" "copy rectangle" "copy square" 
;;                                                 "paste" "flood-fill"))))
;;   (artist-select-operation type))

;; (defun artist-ido-select-settings (type)
;;   "Use ido to select a setting to change in artist-mode"
;;   (interactive (list (ido-completing-read "Setting: " 
;;                                           (list "Set Fill" "Set Line" "Set Erase" "Spray-size" "Spray-chars" 
;;                                                 "Rubber-banding" "Trimming" "Borders"))))
;;   (if (equal type "Spray-size") 
;;       (artist-select-operation "spray set size")
;;     (call-interactively (artist-fc-get-fn-from-symbol 
;; 			 (cdr (assoc type '(("Set Fill" . set-fill)
;; 					    ("Set Line" . set-line)
;; 					    ("Set Erase" . set-erase)
;; 					    ("Rubber-banding" . rubber-band)
;; 					    ("Trimming" . trimming)
;; 					    ("Borders" . borders)
;; 					    ("Spray-chars" . spray-chars))))))))
;; ;; (add-hook 'artist-mode-hook
;; ;; 	  (lambda ()
;; ;; 	    (local-set-key (kbd "<f1>") 'org-mode)
;; ;; 	    (local-set-key (kbd "<f2>") 'artist-select-op-pen-line) ; f2 = pen mode
;; ;;             (local-set-key (kbd "<f3>") 'artist-select-op-line)     ; f3 = line
;; ;; 	    (local-set-key (kbd "<f4>") 'artist-select-op-square)   ; f4 = rectangle
;; ;; 	    (local-set-key (kbd "<f5>") 'artist-select-op-ellipse)  ; f5 = ellipse
;; ;; 	    (local-set-key (kbd "C-z") 'undo)
;; ;;             ))

;; ;; Helm
;; (use-package helm
;;   :ensure t
;;   :init
;;   (setq helm-M-x-fuzzy-match t
;; 	helm-mode-fuzzy-match t
;; 	helm-buffers-fuzzy-matching t
;; 	helm-recentf-fuzzy-match t
;; 	helm-locate-fuzzy-match t
;; 	helm-semantic-fuzzy-match t
;; 	helm-imenu-fuzzy-match t
;; 	helm-completion-in-region-fuzzy-match t
;; 	helm-candidate-number-list 150
;; 	helm-split-window-in-side-p t
;; 	helm-move-to-line-cycle-in-source t
;; 	helm-echo-input-in-header-line t
;; 	helm-autoresize-max-height 0
;; 	helm-autoresize-min-height 20)
;;   :config
;;   (helm-mode 1)
;;   :bind
;;   ("M-x" . helm-M-x)
;;   :bind*
;;   ("C-x C-f" . helm-find-files))
;; ;;(global-set-key (kbd "M-x") 'helm-M-x)

;; Ivy, Counsel, Swiper
(use-package counsel
  :after ivy
  :bind (("C-x C-f" . counsel-find-file)
         ("M-x" . counsel-M-x)
         ("M-y" . counsel-yank-pop)
         ("C-h f" . counsel-describe-function)))
(use-package ivy
  :defer 0.1
  :diminish (ivy-mode . "")
  :bind (("C-c C-r" . ivy-resume)
         ;;(:map ivy-mode-map)
         ("C-x b" . ivy-switch-buffer)
         ("C-x B" . ivy-switch-buffer-other-window)
         ("C-'" . ivy-avy))
  :custom
  ;; add ‘recentf-mode’ and bookmarks to ‘ivy-switch-buffer’.
  (ivy-use-virtual-buffers t)
  (ivy-height 10)
  (ivy-count-format "(%d/%d) ")
  (ivy-display-style 'fancy)
  ;; no regexp by default
  ;; (ivy-initial-inputs-alist nil)
  ;; configure regexp engine.
  (ivy-re-builders-alist
   ;; allow input not in order
   '((t   . ivy--regex-ignore-order)))
  :config
  (ivy-mode 1))
(use-package ivy-rich
  :after ivy
  :custom
  (ivy-virtual-abbreviate 'full
                          ivy-rich-switch-buffer-align-virtual-buffer t)
  (ivy-rich-path-style 'abbrev)
  :config
  (ivy-rich-mode 1)
  (ivy-set-display-transformer 'ivy-switch-buffer
                               'ivy-rich-switch-buffer-transformer))

(use-package swiper
  :after ivy
  :bind (("C-s" . swiper)
         ("C-r" . swiper)))

;; Projectile
(use-package projectile
  :ensure t
;;  :init
;;  (setq projectile-require-project-root nil)
  :config
  (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
  (projectile-mode +1))

;; Yas
(use-package yasnippet
  :ensure t
  :config
  (yas-global-mode 1))

(use-package multiple-cursors
  :bind (("C-S-c C-S-c" . mc/edit-lines)
         ("C->" . mc/mark-next-like-this)
         ("C-<" . mc/mark-previous-like-this)
         ("C-c C-<" . mc/mark-all-like-this)))

(defun my-flymd-browser-function (url)
  (let ((browse-url-browser-function 'browse-url-firefox))
    (browse-url url)))
(setq flymd-browser-open-function 'my-flymd-browser-function)

(use-package company
  :init
  (global-company-mode))
