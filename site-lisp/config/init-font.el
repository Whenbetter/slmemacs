
(defun load-uint-setup()
;; 设置首选编码
(prefer-coding-system 'utf-8)
;; 默认保存为UTF-8，Unix换行
(setq-default buffer-file-coding-system 'utf-8-unix)
;; 文件名编码
(setq file-name-coding-system 'utf-8)
;; 语言环境
(set-language-environment "UTF-8")
;; 进程编码
(setq default-process-coding-system '(utf-8-unix . utf-8-unix))

)


(defun load-font-setup()
  (cond ((eq window-system 'pgtk)
         (set-face-attribute 'default nil :height 140 :family "WenQuanYi Micro Hei"))
        (t
         (let ((emacs-font-size 20)
               (chinese-font-name  "文泉驿等宽微米黑")
               english-font-name)
           (cond
            ((featurep 'cocoa)
             (setq english-font-name "Fira Code"))
            ((string-equal system-type "gnu/linux")
             (setq english-font-name "DejaVu Sans")))
           (when (display-grayscale-p)
             (set-frame-font (format "%s-%s" (eval english-font-name) (eval emacs-font-size)))
             (set-fontset-font (frame-parameter nil 'font) 'unicode (eval english-font-name))

             (dolist (charset '(kana han symbol cjk-misc bopomofo))
               (set-fontset-font (frame-parameter nil 'font) charset (font-spec :family (eval chinese-font-name))))
             )))))

(load-font-setup)
(load-uint-setup)

(provide 'init-font)

