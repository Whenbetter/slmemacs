
;;; Require

;;; Code:

(with-eval-after-load 'org

  (setq org-startup-folded nil)                 ;默认展开内容
  (setq org-startup-indented t                  ;默认缩进内容
        org-pretty-entities t
        org-hide-emphasis-markers nil
        org-fontify-emphasized-text nil
        org-link-descriptive nil
        org-fontify-quote-and-verse-blocks t
        org-startup-with-inline-images t
        org-image-actual-width '(300))

  (setq org-ellipsis "⤵")

  (setq org-stuck-projects
        '("TODO={.+}/-DONE" nil nil "SCHEDULED:\\|DEADLINE:"))
  (setq org-agenda-inhibit-startup t) ;; ~50x speedup
  (setq org-agenda-span 'day)
  (setq org-agenda-use-tag-inheritance nil) ;; 3-4x speedup
  (setq org-agenda-window-setup 'current-window)
  (setq org-log-done t)

  ;; (setq org-emphasis-list)
          ;; ("/" my-org-emphasis-italic)
          ;; ("_" underline)
          ;; ("=" org-verbatim verbatim)
          ;; ("~" org-code verbatim)
          ;; ("+" (:strike-through t))))
 (setq org-emphasis-alist
          '(("*" my-org-emphasis-bold)
            ("/" my-org-emphasis-italic)
            ("_" underline)
            ("=" org-verbatim verbatim)
            ("~" org-code verbatim)
            ("+" (:strike-through t))))

;;  (defface my-org-emphasis-bold
;;    '((default :inherit bold)
;;      (((class color) (min-colors 88) (background light))
;;       :foreground "#a60000")
;;      (((class color) (min-colors 88) (background dark))
;;       :foreground "#ff8059"))
;;    "My bold emphasis for Org.")

;;  (defface my-org-emphasis-italic
;;    '((default :inherit italic)
;;      (((class color) (min-colors 55) (background light))
;;       :foreground "#972500")
;;      (((class color) (min-colors 55) (background dark))
;;       :foreground "#ef8b50"))
;;    "My italic emphasis for Org.")

 
   



  (setq org-todo-keywords
        (quote ((sequence "TODO(t)" "STAR(s@/!)" "|" "DONE(d!)")
                (sequence "WAIT(w)" "HOLD(h@)" "|" "CANC(c@)" "MEETING(m)" "PHONE(p)"))))

  ;; 自动记录状态变更日志并弹出输入
  (defun my/org-todo-state-change-log (old-state new-state)
    (when (not (equal old-state new-state))
      ;; 记录时间戳到 LOGBOOK 抽屉
      (org-add-log-setup 'state new-state old-state)
      ;; 弹出临时缓冲区输入内容
      (let ((buf (get-buffer-create "*Org State Note*")))
	(switch-to-buffer-other-window buf)
	(erase-buffer)
	(insert "# 输入备注内容后按 C-c C-c 保存\n\n")
	(org-mode)
	(local-set-key (kbd "C-c C-c")
                       (lambda ()
			 (interactive)
			 (let ((note (buffer-string)))
                           (with-current-buffer (org-base-buffer (current-buffer))
                             (unless (string-blank-p note)
                               (org-add-log-note note))
                             (kill-buffer buf))))))))

  ;; 可选：仅在特定状态触发
  ;; (when (member new-state '("WAIT" "HOLD"))
  ;;   (my/org-todo-state-change-log old-state new-state))

  (add-hook 'org-after-todo-state-change-hook #'my/org-todo-state-change-log)

  ;; 确保日志存入抽屉
  (setq org-log-into-drawer t)
  (setq org-log-state-notes-into-drawer t)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;; Org clock
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  (setq org-agenda-start-day "+0d")
  ;; Change task state to STARTED when clocking in
  (setq org-clock-in-switch-to-state 'next)
  ;; Save clock data and notes in the LOGBOOK drawer
  (setq org-clock-into-drawer t)
  ;; Removes clocked tasks with 0:00 duration
  (setq org-clock-out-remove-zero-time-clocks t)
  ;; Show the clocked-in task - if any - in the header line
  (setq org-tags-match-list-sublevels nil)


  (setf org-todo-keyword-faces '(("STAR" . (:foreground "white" :background "#FF5722"  :weight bold))
				 ("TODO" . (:foreground "white" :background "#95A5A6"   :weight bold))
				 ("WAIT" . (:foreground "white" :background "#2E8B57"  :weight bold))
				 ("HOLD" . (:foreground "white" :background "#2E8B57"  :weight bold))
				 ("CANC" . (:foreground "white" :background "#3498DB"  :weight bold))
				 ("DONE" . (:foreground "white" :background "#3498DB"  :weight bold))))

  
  (setq org-tag-alist '(("硬件" . ?h) ("软件" . ?s) ("调试" . ?t)))

  
  (setq-default org-agenda-dir "~/org-note")
  (setq org-agenda-file-note (expand-file-name "notes.org" org-agenda-dir))
  (setq org-agenda-file-gtd (expand-file-name "gtd.org" org-agenda-dir))
  ;;(setq org-agenda-file-meet (expand-file-name "meet.org" org-agenda-dir))
  (setq org-agenda-file-book (expand-file-name "book.org" org-agenda-dir))
  (setq org-agenda-file-blog (expand-file-name "blog.org" org-agenda-dir))
 
  (setq org-archive-location (concat org-agenda-dir "archive.org::"))
  (setq org-capture-templates
	'(("t" "Todo" entry (file+headline org-agenda-file-gtd "Workspace")
           "* TODO [#B] %?\n  %i\n %t"
	   :empty-lines 1)
	  ("n" "Notes" entry (file+headline org-agenda-file-note "Notes")
	   "* %?\n  %i\n "
	   :empty-lines 1)))
)
  ;; (setq org-capture-templates
  ;;       '(("t" "Todo" entry (file+headline org-agenda-file-gtd "Workspace")
  ;;          "* TODO [#B] %?\n  %i\n %U"
  ;;          :empty-lines 1)
  ;;         ("n" "notes" entry (file+headline org-agenda-file-note "Quick notes")
  ;;          "* %?\n  %i\n %U"
  ;;          :empty-lines 1)
  ;;         ("b" "Blog Ideas" entry (file+headline org-agenda-file-note "Blog Ideas")
  ;;          "* TODO [#B] %?\n  %i\n %U"
  ;;          :empty-lines 1)
  ;;        ("s" "Slipbox" entry  (file "inbox.org")
  ;;         "* %?\n")
  ;;        ("S" "Code Snippet" entry
  ;;         (file org-agenda-file-code-snippet)
  ;;         "* %?\t%^g\n#+BEGIN_SRC %^{language}\n\n#+END_SRC")
  ;;        ("w" "work" entry (file+headline org-agenda-file-work "Work")
  ;;         "* TODO [#A] %?\n  %i\n %U"
  ;;         :empty-lines 1)
  ;;        ("x" "Web Collections" entry
  ;;         (file+headline org-agenda-file-note "Web")
  ;;         "* %U %:annotation\n\n%:initial\n\n%?")
  ;;        ("p" "Protocol" entry (file+headline org-agenda-file-note "Inbox")
  ;;         "* %^{Title}\nSource: %u, %c\n #+BEGIN_QUOTE\n%i\n#+END_QUOTE\n\n\n%?")
  ;;	  ("L" "Protocol Link" entry (file+headline org-agenda-file-note "Inbox")
  ;;         "* %? [[%:link][%:description]] \nCaptured On: %U")
  ;;      ("c" "Chrome" entry (file+headline org-agenda-file-note "Quick notes")
  ;;     "* TODO [#C] %?\n %(zilongshanren/retrieve-chrome-current-tab-url)\n %i\n %U"
  ;;   :empty-lines 1)
  ;;          ("l" "links" entry (file+headline org-agenda-file-note "Quick notes")
  ;;         "* TODO [#C] %?\n  %i\n %a \n %U"
  ;;       :empty-lines 1)
  ;;    ("j" "Journal Entry"
  ;;    entry (file+datetree org-agenda-file-journal)
  ;;    "* %?"
  ;;   :empty-lines 1)))
  

    ;; mode specific major key
;;    (global-leader
;;      :major-modes
;;      '(org-mode t)
;;      ;;and the keymaps:
;;      :keymaps
;;      '(org-mode-map)
;;      "p" 'org-pomodoro
;;      "t" 'org-todo
;;      "e" 'org-set-effort
;;      ">" 'org-metaright
;;      "<" 'org-metaleft
;;      "J" 'org-metadown
;;      "K" 'org-metaup
;;      "Ts" 'org-set-tags-command
;;      "l" 'org-toggle-link-display
;;      "L" 'org-toggle-inline-images
;;      "I" 'org-clock-in
;;      "O" 'org-clock-out
;;      "P" 'org-set-property
;;      "s" 'org-schedule
;;      "+" 'org-increase-number-at-point
;;      "-" 'org-decrease-number-at-point
;;      "n" 'org-narrow-to-subtree
;;      "dc" 'org-download-clipboard
;;      "ds" 'org-download-screenshot
;;      "Tl" 'org-latex-preview
;;      "w" 'widen
;;      "of" 'org-roam-node-find
;;      "og" 'org-roam-graph
;;      "os" 'org-roam-db-sync
;;      "or" 'org-roam-node-random
;;      "oc" 'org-roam-capture
;;      "oi" 'org-roam-node-insert
;;      "ot" 'org-roam-tag-add
;;      "oa" 'org-roam-alias-add
;;      "oT" 'org-roam-buffer-toggle
;;      "oe" 'org-roam-extract-subtree
;;      "oI" 'org-id-get-create
;;      "od" 'org-roam-dailies-capture-today
;;      "oD" 'org-roam-dailies-find-today)

;;    (global-leader
;;      :major-modes
;;      '(org-agenda-mode t)
;;      ;;and the keymaps:
;;      :keymaps
;;      '(org-agenda-mode-map)
;;      "d" 'org-agenda-day-view
;;      "w" 'org-agenda-week-view
;;      "," 'org-agenda-priority
;;      "e" 'org-agenda-set-effort
;;      ":" 'org-agenda-set-tags
;;      "T" 'org-agenda-show-tags
;;      "p" 'org-pomodoro);



;; 为 org-mode 启用 valign-mode
(dolist
    (hook
     (list 'org-mode-hook))
  (add-hook hook #'valign-mode))

;; 绑定 Org 模式快捷键和菜单
(add-hook 'org-mode-hook
          (lambda ()
            (lazy-load-set-keys 
             '(
            ("C-q" . one-key-menu-org)
            )
            org-mode-map
            )
            (one-key-create-menu
             "org"
             '( (("t" . "todo") . org-todo)
                (("b" . "tag") . org-set-tags-command)
                (("x" . "切换head状态") . org-toggle-checkbox)
                (("i" . "添加head") . org-insert-todo-heading)
		)

	     t)))

;; 配置 org-super-agenda（确保在 org-mode-hook 中）
(add-hook 'org-mode-hook  ; 修正为直接使用 'org-mode-hook
          (lambda ()
            (require 'org-super-agenda)
            (org-super-agenda-mode 1)
            (setq org-super-agenda-groups
                  '( (:name "重要任务" :tag "重要" :priority "A")
                     (:name "今日截止" :deadline today)
                     (:name "待办事项" :todo "TODO")
                     (:name "进行中" :todo "DOING")
                     (:auto-parent t)
                     (:discard (:anything t)) ))
            (setq org-agenda-custom-commands
                  '( ("c" "超级议程视图"
                      ((agenda "" ((org-super-agenda-groups '((:name "今日任务" :time-grid t))))
                       (alltodo "" ((org-super-agenda-groups org-super-agenda-groups))))))))
            (setq org-agenda-files '("~/org-notes/gtd.org"))))




(provide 'init-org)

;;; init-org.el ends here
