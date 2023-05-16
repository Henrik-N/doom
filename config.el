


;; Info
(setq
        user-full-name "Henrik Nilsson"
        user-mail-address "n.henrik.g.nilsson@gmail.com")
        ;; Some functionality uses this to identify you, e.g. GPG configuration, email
        ;; clients, file templates and snippets. It is optional.


;; Vim
(after! evil
        (setq
                evil-insert-state-cursor 'box
                evil-escape-key-sequence "kj"
                evil-split-window-below t
                evil-vsplit-window-right t))

;; Font
(setq
        ;; the primary font to use
        doom-font
        (font-spec
              :family (cond
                        (nil "ProggyVector")
                        (t "RobotoMono Nerd Font")
                        (nil "Press Start 2P")
                        (nil "Sudo")
                        (nil "JetBrains Mono")
                        (nil "Fira Code")
                        (nil "Hack"))
              ; :weight 'semi-light
              :size (cond
                     (nil 12)
                     (t 14)
                     (nil 16)
                     (nil 25))
              :fallback "monospace")

        ;; a non-monospace font (where applicable)
        doom-variable-pitch-font
        (font-spec
               :family "sans"))

        ;; Use 'M-x describe-font' to look up fonts if emacs can't find them.
        ;; Use 'M-x doom/reload-font' to refresh your font settings.
        ;;
        ;; See 'C-h v doom-font' for documentation and more examples of what parameters are available.


;; Company (code completition)
(use-package! company
  :config
  (map!
   ;; Complete with tab only
   :map company-active-map "<tab>" 'company-complete-selection
   :map company-active-map "RET" nil
   :map company-active-map "<return>" nil))


;; Maximize emacs on startup
;; (when (display-graphic-p)
;;   (toggle-frame-maximized))
;; (add-to-list 'default-frame-list '(fullscreen . maximized))


;; Other
(setq
        ;; Line numbers and scroll margin
        display-line-numbers-type 'relative
        scroll-margin 10

        ;; Org
        org-directory "~/org/" ;; must be set before org loads

        ;; Projectile (projects)
        projectile-project-search-path '("~/dev/")

        ;; LSP
        lsp-zig-zls-executable (cond
                                ((eq system-type 'gnu/linux) "/usr/bin/zls")
                                ;; ((eq system-type 'windows-nt) "C:/...")
                                (t "")))

;; No rainbow brackets in Zig
(after! zig-mode
  (remove-hook 'zig-mode-hook #'rainbow-delimiters-mode))


;; Theme
(setq
        doom-theme 'doom-gruvbox
        doom-themes-enable-bold t
        doom-themes-enable-italic t
        doom-gruvbox-dark-variant "medium")
        ;;doom-gruvbox-padded-modeline t
        ;;
        ;; There are two ways to load a theme. Both assume the theme is installed and
        ;; available. You can either set `doom-theme' or manually load a theme with the
        ;; `load-theme' function. This is the default:

(use-package! tree-sitter
  :custom-face
  (tree-sitter-hl-face:attribute ((t)))
  (tree-sitter-hl-face:comment ((t)))
  (tree-sitter-hl-face:constant ((t)))
  (tree-sitter-hl-face:constant.builtin ((t)))
  (tree-sitter-hl-face:constructor ((t)))
  (tree-sitter-hl-face:doc ((t)))
  (tree-sitter-hl-face:embedded ((t)))
  (tree-sitter-hl-face:escape ((t)))
  (tree-sitter-hl-face:function ((t)))
  (tree-sitter-hl-face:function.builtin ((t)))
  (tree-sitter-hl-face:function.call ((t)))
  (tree-sitter-hl-face:function.macro ((t)))
  (tree-sitter-hl-face:function.method ((t)))
  (tree-sitter-hl-face:function.method.call ((t)))
  (tree-sitter-hl-face:function.special ((t)))
  (tree-sitter-hl-face:keyword ((t)))
  (tree-sitter-hl-face:label ((t)))
  (tree-sitter-hl-face:method ((t)))
  (tree-sitter-hl-face:method.call ((t)))
  (tree-sitter-hl-face:noise ((t)))
  (tree-sitter-hl-face:number ((t)))
  (tree-sitter-hl-face:operator ((t)))
  (tree-sitter-hl-face:property ((t)))
  (tree-sitter-hl-face:property.definition ((t)))
  (tree-sitter-hl-face:punctuation ((t)))
  (tree-sitter-hl-face:punctuation.bracket ((t)))
  (tree-sitter-hl-face:punctuation.delimiter ((t)))
  (tree-sitter-hl-face:punctuation.special ((t)))
  (tree-sitter-hl-face:string ((t)))
  (tree-sitter-hl-face:string.special ((t)))
  (tree-sitter-hl-face:tag ((t)))
  (tree-sitter-hl-face:type ((t)))
  (tree-sitter-hl-face:type.argument ((t)))
  (tree-sitter-hl-face:type.builtin ((t)))
  (tree-sitter-hl-face:type.parameter ((t)))
  (tree-sitter-hl-face:type.super ((t)))
  (tree-sitter-hl-face:type.variable ((t)))
  (tree-sitter-hl-face:type.variable.builtin ((t)))
  (tree-sitter-hl-face:type.variable.parameter ((t)))
  (tree-sitter-hl-face:type.variable.special ((t))))



;; This one looks sooooooooooooo goood with zig. Making a copy as I'm trying to
;; adjust it for Rust
;;
;; Gruvbox
;; (custom-theme-set-faces! 'doom-gruvbox
;;   ;;`(tree-sitter-hl-face:attribute)
;;   ;; tree-sitter-hl-face:embedded
;;   ;; (tree-sitter-hl-face:escape
;;   ;;
;;   ;; tree-sitter-hl-face:function.macro
;;   ;; tree-sitter-hl-face:function.method
;;   ;; tree-sitter-hl-face:function.method.call
;;
;;   ;; tree-sitter-hl-face:label
;;   ;; tree-sitter-hl-face:method
;;   ;; tree-sitter-hl-face:method.call
;;   ;; tree-sitter-hl-face:noise
;;
;;   `(tree-sitter-hl-face:property                :foreground                                            ,(doom-color 'dark-cyan))
;;   `(tree-sitter-hl-face:property.definition     :foreground                                 ,(doom-color 'dark-cyan))
;;
;;   `(tree-sitter-hl-face:constant                :foreground                                            ,(doom-color 'violet))
;;   `(tree-sitter-hl-face:constant.builtin        :foreground                                    ,(doom-color 'orange))
;;
;;   `(tree-sitter-hl-face:comment                 :foreground                                             ,(doom-color 'grey) :italic t)
;;   `(tree-sitter-hl-face:doc                     :foreground                                                 ,(doom-color 'grey))
;;
;;   `(tree-sitter-hl-face:function                :foreground                                            ,(doom-color 'green) :bold t)
;;   `(tree-sitter-hl-face:function.builtin        :foreground                                    ,(doom-color 'orange))
;;   `(tree-sitter-hl-face:function.call           :foreground                                       ,(doom-color 'green) :bold t)
;;
;;   `(tree-sitter-hl-face:keyword                 :foreground ,(doom-color 'red) :italic t)
;;   `(tree-sitter-hl-face:function.special        :foreground ,(doom-color 'red))
;;
;;   `(tree-sitter-hl-face:number                  :foreground ,(doom-color 'violet))
;;   `(tree-sitter-hl-face:operator                :foreground ,(doom-color 'dark-blue))     ; *, **, .*, .?, ?
;;   `(tree-sitter-hl-face:punctuation             :foreground ,(doom-color 'fg))
;;   `(tree-sitter-hl-face:punctuation.bracket     :foreground ,(doom-color 'fg))            ; [], (), {}, |
;;   `(tree-sitter-hl-face:punctuation.delimiter   :foreground ,(doom-color 'white))         ; '.', ',', ':', ';'
;;   `(tree-sitter-hl-face:punctuation.special     :foreground ,(doom-color 'white))         ; '..' '...'
;;
;;   `(tree-sitter-hl-face:string                  :foreground ,(doom-color 'dark-green))
;;   `(tree-sitter-hl-face:string.special          :foreground ,(doom-color 'green) :italic t :bold t)
;;   ;; tree-sitter-hl-face:tag
;;   ;;`(tree-sitter-hl-face:type                  :foreground ,(doom-color 'teal))
;;
;;   `(tree-sitter-hl-face:type                    :foreground ,(doom-color 'yellow))
;;   ;; `(tree-sitter-hl-face:type.argument        :foreground ,(doom-color 'red))
;;   `(tree-sitter-hl-face:type.builtin            :foreground ,(doom-color 'dark-yellow))
;;   `(tree-sitter-hl-face:variable.parameter      :foreground ,(doom-color 'blue))
;;   ;; `(tree-sitter-hl-face:type.parameter       :foreground ,(doom-color 'red))
;;   ;; tree-sitter-hl-face:type.super
;;   ;;`(tree-sitter-hl-face:variable              :foreground ,(doom-color 'blue)) ;; blue-gray
;;   `(tree-sitter-hl-face:variable                :foreground ,(doom-color 'blue)) ;; blue ;; blue-gray
;;   ;; tree-sitter-hl-face:type.variable
;;   `(tree-sitter-hl-face:type.variable.builtin   :foreground ,(doom-color 'orange)))


(custom-theme-set-faces! 'doom-gruvbox
  ;;`(tree-sitter-hl-face:attribute)
  ;; tree-sitter-hl-face:embedded
  ;; (tree-sitter-hl-face:escape
  ;;
  ;; tree-sitter-hl-face:function.macro
  ;; tree-sitter-hl-face:function.method
  ;; tree-sitter-hl-face:function.method.call

  ;; tree-sitter-hl-face:label
  ;; tree-sitter-hl-face:method
  ;; tree-sitter-hl-face:method.call
  ;; tree-sitter-hl-face:noise

  `(tree-sitter-hl-face:property                :foreground                                            ,(doom-color 'dark-cyan))
  `(tree-sitter-hl-face:property.definition     :foreground                                 ,(doom-color 'dark-cyan))

  `(tree-sitter-hl-face:constant                :foreground                                            ,(doom-color 'violet))
  `(tree-sitter-hl-face:constant.builtin        :foreground                                    ,(doom-color 'orange))

  `(tree-sitter-hl-face:comment                 :foreground                                             ,(doom-color 'grey) :italic t)
  `(tree-sitter-hl-face:doc                     :foreground                                                 ,(doom-color 'grey))

  `(tree-sitter-hl-face:function                :foreground                                            ,(doom-color 'green) :bold t)
  `(tree-sitter-hl-face:function.builtin        :foreground                                    ,(doom-color 'orange))
  `(tree-sitter-hl-face:function.call           :foreground                                       ,(doom-color 'green) :bold t)

  `(tree-sitter-hl-face:keyword                 :foreground ,(doom-color 'red) :italic t)
  `(tree-sitter-hl-face:function.special        :foreground ,(doom-color 'red))

  `(tree-sitter-hl-face:number                  :foreground ,(doom-color 'violet))
  `(tree-sitter-hl-face:operator                :foreground ,(doom-color 'dark-blue))     ; *, **, .*, .?, ?
  `(tree-sitter-hl-face:punctuation             :foreground ,(doom-color 'fg))
  `(tree-sitter-hl-face:punctuation.bracket     :foreground ,(doom-color 'fg))            ; [], (), {}, |
  `(tree-sitter-hl-face:punctuation.delimiter   :foreground ,(doom-color 'white))         ; '.', ',', ':', ';'
  `(tree-sitter-hl-face:punctuation.special     :foreground ,(doom-color 'white))         ; '..' '...'

  `(tree-sitter-hl-face:string                  :foreground ,(doom-color 'dark-green))
  `(tree-sitter-hl-face:string.special          :foreground ,(doom-color 'green) :italic t :bold t)
  ;; tree-sitter-hl-face:tag
  ;;`(tree-sitter-hl-face:type                  :foreground ,(doom-color 'teal))

  `(tree-sitter-hl-face:type                    :foreground ,(doom-color 'yellow))
  ;; `(tree-sitter-hl-face:type.argument        :foreground ,(doom-color 'red))
  `(tree-sitter-hl-face:type.builtin            :foreground ,(doom-color 'dark-yellow))
  `(tree-sitter-hl-face:variable.parameter      :foreground ,(doom-color 'blue))
  ;; `(tree-sitter-hl-face:type.parameter       :foreground ,(doom-color 'red))
  ;; tree-sitter-hl-face:type.super
  ;;`(tree-sitter-hl-face:variable              :foreground ,(doom-color 'blue)) ;; blue-gray
  `(tree-sitter-hl-face:variable                :foreground ,(doom-color 'blue)) ;; blue ;; blue-gray
  ;; tree-sitter-hl-face:type.variable
  `(tree-sitter-hl-face:type.variable.builtin   :foreground ,(doom-color 'orange)))




  ;; `(tree-sitter-hl-face:type.variable.parameter :foreground ,(doom-color 'red)))
  ;; tree-sitter-hl-face:type.variable.special



;; TODO remove this line (keeping it line just in case) -- (define-key company-active-map [tab] 'company-complete-selection) ;; Use tab to pick the selection rather than scrolling with it
;; TODO Change tab with TAB and S-TAB when in normal mode without interferring with company complete in insert mode

; (use-package! centaur-tabs-mode
;   :config
;   (evil-define-key 'normal centaur-tabs-forward-tab-map [tab] 'centaur-tabs-forward))




;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
;; (setq display-line-numbers-type t)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!

;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
