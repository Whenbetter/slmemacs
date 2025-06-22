;;; ### Unset key ###
;;; --- 卸载按键
(lazy-load-unset-keys                   ;全局按键的卸载
 '("C-x C-f" "C-z" "C-q" "C-a" "s-W" "s-z" "M-h" "C-x C-c" "s-c" "M-n" "M-p" "s-x" "s-v"))

;;; ### 全局快捷键 ###

(lazy-load-set-keys
 '(
   ("C-c v" . split-window-vertically)   ;纵向分割窗口
   ("C-c h" . split-window-horizontally) ;横向分割窗口
   ("<f5>"  . emacs-session-save)	 ;退出emacs
  ;; ("C-q" . one-key-menu-org)		;Org-key
   ("C-c c". org-capture)		;Org-capture
   ("C-c a". org-agenda)		;Org-agenda		  		
   ("C-c l". org-store-link)		;Org-agenda		  		
   ("C-c f" . one-key-menu-directory)   ;目录打开菜单
   ("C-c r" . eval-buffer)   ;目录打开菜单
   ))

(lazy-load-global-keys
 '(
   ("M-n" . move-text-down)      ;把光标所在的整行文字(或标记)下移一行
   ("M-p" . move-text-up)        ;把光标所在的整行文字(或标记)上移一行
   )
 "move-text")



(lazy-load-global-keys
 '(
   ("C-z o" . duplicate-line-or-region-above) ;向上复制当前行或区域
   ("C-z l" . duplicate-line-or-region-below) ;向下复制当前行或区域
   ("C-z C-o" . duplicate-line-above-comment) ;复制当前行到上一行, 并注释当前行
   ("C-z C-l" . duplicate-line-below-comment) ;复制当前行到下一行, 并注释当前行
   ("C-:" . comment-or-uncomment-region+)     ;注释当前行
   )
 "duplicate-line")
(lazy-load-global-keys
 '(
   ("C-o" . open-newline-above)         ;在上面一行新建一行
   ("C-l" . open-newline-below)         ;在下面一行新建一行
   )
 "open-newline")



;;; ### Sort-Tab ###
;;; --- 多标签浏览
(lazy-load-global-keys
 '(
   ("M-9" . sort-tab-select-prev-tab)    ;选择前一个标签
   ("M-0" . sort-tab-select-next-tab)    ;选择后一个标签
;;   ("M-s-9" . sort-tab-select-first-tab) ;选择第一个标签
;;   ("M-s-0" . sort-tab-select-last-tab)  ;选择最后一个标签
   ("C-;" . sort-tab-close-current-tab)  ;关闭当前标签
   )
 "sort-tab")

;; ### Blink Search ###
;;; --- 最快的搜索框架
(lazy-load-global-keys
 '(
   ("C-x y" . blink-search)
   )
 "init-blink-search")

;;; ### Color-Rg ###
;;; --- 搜索重构
(lazy-load-global-keys
 '(
   ("C-x s" . color-rg-search-symbol)
   ("C-x S" . color-rg-search-input)
   ("C-x p" . color-rg-search-symbol-in-project)
   ("C-x P" . color-rg-search-input-in-project)
   ("C-x f" . color-rg-search-symbol-in-current-file)
   ("C-x F" . color-rg-search-input-in-current-file)
   )
 "color-rg")


;;; ### Thingh-edit ###
;;; --- 增强式编辑当前光标的对象
(lazy-load-global-keys
 '(
   ("M-t" . one-key-menu-thing-edit)  ;thing-edit 菜单
   )
 "init-thing-edit"
 )

;;; ### Dired ###
;;; --- Dired
(lazy-load-global-keys
 '(
   ("<f8>" . dired-jump)
   ("C-x C-f" . find-file)
   )
 "init-dired")

;;; ### Isearch ###
;;; --- 交互式搜索
(lazy-load-set-keys
 '(
   ("TAB" . isearch-complete)	     ;isearch补全
   ("C-s" . isearch-repeat-forward)  ;重复向前搜索, 第一次可以用来搜索上一次的历史哟
   ("C-r" . isearch-repeat-backward) ;重复向后搜索
   ("C-g" . isearch-abort)	     ;中止搜索
   ("C-w" . isearch-yank-word-or-char)	 ;粘帖光标后的词或字符作为搜索对象
   ("C-y" . isearch-yank-line)		 ;粘帖光标后的行作为搜索对象
   ("M-o" . isearch-delete-char)	 ;删除
   ("M-p" . isearch-ring-retreat)	 ;搜索历史向后
   ("M-n" . isearch-ring-adjust)	 ;搜索历史向前
   ("M-y" . isearch-yank-kill)		 ;从 kill ring 中粘帖最后一项到搜索对象后
   ("M-h" . isearch-yank-char)		 ;粘帖光标后的字符到搜索对象
   ("M-e" . isearch-edit-string)	 ;编辑搜索对象
   ("M-c" . isearch-toggle-case-fold)	 ;切换大小写
   ("M-r" . isearch-toggle-regexp)	 ;切换正则表达式
   ("M-w" . isearch-toggle-word)	 ;切换词
   ("M->" . isearch-beginning-of-buffer) ;跳转到buffer开头并重新搜索, 搜索最前面一个
   ("M-<" . isearch-end-of-buffer)	 ;跳转到buffer末尾并重新搜索, 搜索最后面一个
   ("M-%" . isearch-query-replace)	 ;替换
   ("M-d" . isearch-find-duplicate-word) ;查找重复的单词
   ("M-z" . isearch-find-duplicate-line) ;查找重复的行
   ("C-M-%" . isearch-query-replace-regexp) ;正则表达式替换
   )
 isearch-mode-map
 )


;;; Elisp
(lazy-load-set-keys				      ;
 '(						      ;
   ("RET" . comment-indent-new-line)		      ;自动换行并注释
   )						      ;
 emacs-lisp-mode-map				      ;
 )						      ;



(lazy-load-global-keys			      ;
 '(					      ;
   ("M-x" . smex+)			      ;
   ("C-c M-x" . execute-extended-command)     ;
   )                                          ;
 "init-smex")                                 ;


(provide 'init-key)
