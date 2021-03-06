(deftheme dichromacy-jas
  "Created 2013-10-23.")

(custom-theme-set-variables
 'dichromacy-jas
 '(ansi-color-names-vector ["black" "#d55e00" "#009e73" "#f8ec59" "#0072b2" "#cc79a7" "#56b4e9" "white"]))

(custom-theme-set-faces
 'dichromacy-jas
 '(cursor ((((class color) (min-colors 89)) (:background "black"))))
 '(fringe ((t (:background "gray22"))))
 '(highlight ((((class color) (min-colors 89)) (:foreground "#0072b2" :background "#e5e5e5"))))
 '(region ((((class color) (min-colors 89)) (:background "#666666" :foreground unspecified))))
 '(secondary-selection ((((class color) (min-colors 89)) (:background "#e5e5e5"))))
 '(isearch ((((class color) (min-colors 89)) (:foreground "white" :background "#d55e00"))))
 '(lazy-highlight ((((class color) (min-colors 89)) (:foreground "white" :background "#cc79a7"))))
 '(trailing-whitespace ((((class color) (min-colors 89)) (:background "#d55e00"))))
 '(mode-line ((((class color) (min-colors 89)) (:box (:line-width -1 :style released-button) :background "#e5e5e5" :foreground "black"))))
 '(mode-line-inactive ((((class color) (min-colors 89)) (:box (:line-width -1 :style released-button) :background "#b0b0b0" :foreground "black"))))
 '(minibuffer-prompt ((((class color) (min-colors 89)) (:weight bold :foreground "#0072b2"))))
 '(escape-glyph ((((class color) (min-colors 89)) (:foreground "#d55e00"))))
 '(error ((((class color) (min-colors 89)) (:weight bold :slant italic :foreground "#d55e00"))))
 '(warning ((((class color) (min-colors 89)) (:foreground "#e69f00"))))
 '(success ((((class color) (min-colors 89)) (:foreground "#009e73"))))
 '(font-lock-builtin-face ((((class color) (min-colors 89)) (:foreground "#0072b2"))))
 '(font-lock-comment-face ((((class color) (min-colors 89)) (:slant italic :foreground "#009e73"))))
 '(font-lock-constant-face ((((class color) (min-colors 89)) (:weight bold :foreground "#d55e00"))))
 '(font-lock-function-name-face ((((class color) (min-colors 89)) (:foreground "#d55e00"))))
 '(font-lock-keyword-face ((((class color) (min-colors 89)) (:weight bold :foreground "#56b4e9"))))
 '(font-lock-string-face ((((class color) (min-colors 89)) (:foreground "#848ea9"))))
 '(font-lock-type-face ((((class color) (min-colors 89)) (:weight bold :foreground "#0072b2"))))
 '(font-lock-variable-name-face ((((class color) (min-colors 89)) (:weight bold :foreground "#e69f00"))))
 '(link ((((class color) (min-colors 89)) (:underline t :foreground "#0072b2"))))
 '(link-visited ((((class color) (min-colors 89)) (:underline t :foreground "#cc79a7"))))
 '(gnus-group-news-1 ((((class color) (min-colors 89)) (:weight bold :foreground "#d55e00"))))
 '(gnus-group-news-1-low ((((class color) (min-colors 89)) (:foreground "#d55e00"))))
 '(gnus-group-news-2 ((((class color) (min-colors 89)) (:weight bold :foreground "#e69f00"))))
 '(gnus-group-news-2-low ((((class color) (min-colors 89)) (:foreground "#e69f00"))))
 '(gnus-group-news-3 ((((class color) (min-colors 89)) (:weight bold :foreground "#56b4e9"))))
 '(gnus-group-news-3-low ((((class color) (min-colors 89)) (:foreground "#56b4e9"))))
 '(gnus-group-news-4 ((((class color) (min-colors 89)) (:weight bold :foreground "#cc79a7"))))
 '(gnus-group-news-4-low ((((class color) (min-colors 89)) (:foreground "#cc79a7"))))
 '(gnus-group-news-5 ((((class color) (min-colors 89)) (:weight bold :foreground "#0072b2"))))
 '(gnus-group-news-5-low ((((class color) (min-colors 89)) (:foreground "#0072b2"))))
 '(gnus-group-news-low ((((class color) (min-colors 89)) (:foreground "#009e73"))))
 '(gnus-group-mail-1 ((((class color) (min-colors 89)) (:weight bold :foreground "#d55e00"))))
 '(gnus-group-mail-1-low ((((class color) (min-colors 89)) (:foreground "#d55e00"))))
 '(gnus-group-mail-2 ((((class color) (min-colors 89)) (:weight bold :foreground "#e69f00"))))
 '(gnus-group-mail-2-low ((((class color) (min-colors 89)) (:foreground "#e69f00"))))
 '(gnus-group-mail-3 ((((class color) (min-colors 89)) (:weight bold :foreground "#56b4e9"))))
 '(gnus-group-mail-3-low ((((class color) (min-colors 89)) (:foreground "#56b4e9"))))
 '(gnus-group-mail-low ((((class color) (min-colors 89)) (:foreground "#009e73"))))
 '(gnus-header-content ((((class color) (min-colors 89)) (:foreground "#cc79a7"))))
 '(gnus-header-from ((((class color) (min-colors 89)) (:weight bold :foreground "#0072b2"))))
 '(gnus-header-subject ((((class color) (min-colors 89)) (:foreground "#e69f00"))))
 '(gnus-header-name ((((class color) (min-colors 89)) (:foreground "#56b4e9"))))
 '(gnus-header-newsgroups ((((class color) (min-colors 89)) (:foreground "#d55e00"))))
 '(message-header-name ((((class color) (min-colors 89)) (:foreground "#56b4e9"))))
 '(message-header-cc ((((class color) (min-colors 89)) (:foreground "#d55e00"))))
 '(message-header-other ((((class color) (min-colors 89)) (:foreground "#009e73"))))
 '(message-header-subject ((((class color) (min-colors 89)) (:foreground "#e69f00"))))
 '(message-header-to ((((class color) (min-colors 89)) (:weight bold :foreground "#0072b2"))))
 '(message-cited-text ((((class color) (min-colors 89)) (:slant italic :foreground "#009e73"))))
 '(message-separator ((((class color) (min-colors 89)) (:weight bold :foreground "#cc79a7"))))
 '(flyspell-duplicate ((((class color) (min-colors 89)) (:weight unspecified :foreground unspecified :slant unspecified :underline "#e69f00"))))
 '(flyspell-incorrect ((((class color) (min-colors 89)) (:weight unspecified :foreground unspecified :slant unspecified :underline "#cc79a7"))))
 '(default ((((class color) (min-colors 89)) (:foreground "black" :background "white")))))

(provide-theme 'dichromacy-jas)
