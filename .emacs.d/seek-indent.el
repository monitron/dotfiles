(require 'cl)

(define-key global-map [(meta shift ?n)] 'seek-forward-indentation)
(define-key global-map [(meta shift ?p)] 'seek-backward-indentation)
(define-key global-map [(meta shift ?u)] 'seek-up-indentation)
(define-key global-map [(meta shift ?d)] 'seek-down-indentation)

(defun blank-line-p()
  (save-excursion
    (beginning-of-line)
    (or (looking-at "^[[:space:]]*$")
        (and (boundp 'seek-blank-comments-regex) seek-blank-comments-regex
             (looking-at seek-blank-comments-regex)))))

(defun seek-back-to-indentation()
  (back-to-indentation)
  (when (or (member major-mode '(org-mode outline-mode))
            (var-safe 'outline-minor-mode))
    (condition-case nil
        (when (re-search-forward
               outline-regexp
               (save-excursion (end-of-line)(point)) t)
          (backward-char)
          (while (looking-at "\s") (backward-char))))))

(defun seek-indentation-amount (&optional line)
  (save-excursion
    (if line (forward-line line))
    (seek-back-to-indentation)
    (current-column)))

(defun seek-relative-indentation (forwardp match-op
                                  &optional abort-op
                                  ignore-if-contiguous-op
                                  continue-to-end-of-contiguous
                                  reset-if-unsuccessful
                                  seek-goal-column)
  ;; (push-mark)
  (save-restriction
    (widen)
    (let ((ding (if (boundp 'ding) ding t))
          (start (point))
          (indent (seek-indentation-amount))
          (ignoring-same (if ignore-if-contiguous-op t nil))
          (ignored-count-and-last '(0 . nil))
          (targeted nil))

      ;;seek across remaining lines in the buffer in the requested
      ;;direction until we find our target
      (while (and (not targeted)
                  (eq 0 (forward-line (if forwardp 1 -1))))

        (if (seek-longlines-line-p)
            ;;skip the contigous logic if we're in longlines mode
            (setq ignoring-same nil)
          (let ((cur-indent (seek-indentation-amount))
                (blank-line (blank-line-p)))

            (when blank-line
              ;;if we've skipped contiguous lines in the prior region
              (if (and (< 0 (car ignored-count-and-last))
                       ;;and those lines were what we were looking for
                       (and match-op
                            (save-excursion
                              (goto-char (cdr ignored-count-and-last))
                              (apply match-op cur-indent indent nil))))
                  (setq targeted (cdr ignored-count-and-last))
                  (setq ignoring-same nil)))

            ;;notice when we leave the current paragraph as defined by a
            ;;failure to match ignore-if-contiguous-op
            (when (and ignoring-same ignore-if-contiguous-op)
              (if (apply ignore-if-contiguous-op cur-indent indent nil)
                  (setq ignored-count-and-last
                        (cons (1+ (car ignored-count-and-last))
                              (point)))
                  (setq ignoring-same nil)))

            (cond ((and (not ignoring-same)
                        (not (zerop (car ignored-count-and-last))))
                   ;;we've ignored one or more contiguous lines; stop
                   ;;at the end of that section
                   (setq targeted (cdr ignored-count-and-last)))
                  (blank-line nil) ;;stop here
                  ((and abort-op (apply abort-op cur-indent indent nil))
                   ;;we didn't find what we were looking for in time
                   (setq targeted -1))
                  ((and (not ignoring-same)
                        (and match-op (apply match-op cur-indent indent nil)))
                   ;;found it
                   (setq targeted (point))))))) ;;end search loop

      (if (and targeted (/= -1 targeted))
          (progn (goto-char targeted)
                 (or (and seek-goal-column (move-to-column seek-goal-column))
                     (seek-back-to-indentation))
                 targeted)
          (progn
            (when ding (ding))
            (if reset-if-unsuccessful
                (goto-char start)
                (seek-back-to-indentation))
            nil)))))

(defun seek-longlines-line-p()
  "Determine if the beginning of the current line is preceded by
a longlines 'soft' carriage return."
  (when (var-safe 'longlines-mode)
    (save-excursion
      (beginning-of-line)
      (if (bobp) nil
          (progn
            (assert (eq (char-before (point)) ?\n) nil
                    "seek-longlines-line-p bug: no \\n after (point)")
            (not (assoc 'hard (text-properties-at (1- (point))))))))))

(defun seek-up-indentation (&optional prefix)
  (interactive "p")
  (seek-relative-indentation
   (if (eq 4 prefix) t nil) ;;backward unless C-u
   (if (blank-line-p) '= '<)
   nil nil nil t
   (if (>= prefix 16) (current-column) nil)))

(defun seek-down-indentation (&optional prefix)
  (interactive "p")
  (seek-relative-indentation
   (if (eq 4 prefix) nil t) ;;forward unless C-u
   (if (blank-line-p) '= '>)
   (if (blank-line-p) '< '<=)
   nil nil t
   (if (>= prefix 16) (current-column) nil)))

(defun seek-forward-indentation (&optional prefix)
  "Find the next line indented this same level."
  (interactive "p")
  (if (blank-line-p)
      (find-blank-line-forward)
      (seek-relative-indentation
       t '= '< '= nil nil
       (if (>= prefix 16) (current-column) nil))))

(defun seek-backward-indentation (&optional prefix)
  (interactive "p")
  (if (blank-line-p)
      (find-blank-line-backward)
      (seek-relative-indentation
       nil '= '< '= t nil
       (if (>= prefix 16) (current-column) nil))))

(defun find-blank-line
    (forwardp end-of-region-function &optional stop-at-first-contiguous)
  "Move in the direction of movement until a blank line preceded
by a non-blank line is found; tries to just do-what-you-mean(TM)
for easy paragraph skipping."
  (let ((non-blank-found nil))
    (loop do (progn (forward-line (if forwardp 1 -1))
                    (setq non-blank-found
                          (or non-blank-found (not (blank-line-p)))))
       until (or (funcall end-of-region-function)
                 ;;this looks nuts but it just eats contiguous blanks
                 (and (blank-line-p)
                      (or stop-at-first-contiguous
                          non-blank-found
                          (not (save-excursion
                                 (forward-line (if forwardp 1 -1))
                                 (blank-line-p)))))))))
(defun find-blank-line-forward() (find-blank-line t 'eobp))
(defun find-blank-line-backward() (find-blank-line nil 'bobp))

(provide 'seek-indent)
