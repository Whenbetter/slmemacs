;;; init-rime.el --- Configuration for emacs-rime



;;;
(require 'rime)

(setq rime-user-data-dir "~/rime/rime-shuangpin-fuzhuma")

(setq rime-posframe-properties
      (list :background-color "#333333"
            :foreground-color "#dcdccc"
            :font "Noto Sans Mono-18"
            :internal-border-width 10))


(setq default-input-method "rime"
      rime-show-candidate 'posframe)

(setq rime-default-schema "moqi_wan_flypy")
(lazy-load-set-keys
 '(
   ("M-o" . rime--backspace)
   ("M-m" . rime--return)
   ("M-h" . rime--escape))
 rime-active-mode-map)




(provide 'init-rime)

;;; init-rime.el ends heredd

