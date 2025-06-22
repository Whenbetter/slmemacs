;;; Require
(require 'blink-search)

;;; Code:

(setq blink-search-common-directory '(("REPO" "~/slm-emacs/site-lisp/extensions/")
                                      ("HOME" "~/")
                                      ("CONFIG" "~/slm-emacs/site-lisp/config/")
                                      ("EAF" "~/slm-emacs/site-lisp/extensions/emacs-application-framework/app/")
                                      ;;("Book" "/data/Book/")
                                      ;;("ChatGPT" "~/ChatGPT")
                                      ))

(setq blink-search-grep-pdf-search-paths "/data/Book")
(setq blink-search-grep-pdf-backend 'eaf-pdf-viewer)
(setq blink-search-pdf-backend 'eaf-pdf-viewer)

;; (setq blink-search-enable-posframe t)

(provide 'init-blink-search)
