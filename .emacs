; add an easier binding for replace
(global-set-key (kbd "M-r") 'replace-string)

(global-set-key (kbd "C-l") 'goto-line)
(put 'downcase-region 'disabled nil)

(global-set-key (kbd "C-c d") 'duplicate-start-of-line-or-region)
(defun duplicate-start-of-line-or-region ()
  (interactive)
  (if mark-active
      (duplicate-region)
    (duplicate-start-of-line)))

(defun duplicate-start-of-line ()
  (let ((text (buffer-substring (point)
                                (beginning-of-thing 'line))))
    (forward-line)
    (push-mark)
    (insert text)
    (open-line 1)))

(defun duplicate-region ()
  (let* ((end (region-end))
         (text (buffer-substring (region-beginning)
                                 end)))
    (goto-char end)
    (insert text)
    (push-mark end)
    (setq deactivate-mark nil)
    (exchange-point-and-mark)))