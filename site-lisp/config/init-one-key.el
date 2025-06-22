;;;Require
(require 'eaf)
(require 'eaf-file-manager)

;;; Code:

(one-key-create-menu
 "DIRECTORY"
 '(
   (("h" . "Home") . (lambda () (interactive) (eaf-open-in-file-manager "~/")))
   (("n" . "Note") . (lambda () (interactive) (eaf-open-in-file-manager "~/org-note")))
   (("w" . "Work") . (lambda () (interactive) (eaf-open-in-file-manager "/mnt/c/home")))
  ;; (("c" . "Code") . (lambda () (interactive) (eaf-open-in-file-manager "/mnt/e/work")))
  ;; (("d" . "Done") . (lambda () (interactive) (eaf-open-in-file-manager "/mnt/d")))

;;   (("j" . "Picture") . (lambda () (interactive) (eaf-open-in-file-manager "/data/Picture")))
;;   (("m" . "Music") . (lambda () (interactive) (eaf-open-in-file-manager "/data/Music")))
;;   (("c" . "Config") . (lambda () (interactive) (eaf-open-in-file-manager lazycat-emacs-config-dir)))
;;   ((";" . "Extension") . (lambda () (interactive) (eaf-open-in-file-manager "/home/andy/lazycat-emacs/site-lisp/extensions")))
;;   (("o" . "EAF") . (lambda () (interactive) (eaf-open-in-file-manager "/home/andy/lazycat-emacs/site-lisp/extensions/emacs-application-framework")))
;;   (("l" . "LazyCat") . (lambda () (interactive) (eaf-open-in-file-manager "/home/andy/microserver")))
   )
 t)

(provide 'init-one-key)

;;; init-one-key.el ends here
