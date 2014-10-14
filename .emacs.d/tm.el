; Taxi Magic

(defun tm-start-ccp()
  (interactive)
  (start-process-shell-command "server-ccp" "*ccp server*" ". ~/.taxi_magic_rc; ~/tm/repos/prod/ccp/trunk/script/server -p 3001")
  (switch-to-buffer "*ccp server*"))

(defun tm-start-rips()
  (interactive)
  (start-process-shell-command "server-rips" "*rips server*" ". ~/.taxi_magic_rc; ~/tm/repos/prod/rips/trunk/script/server -p 3002")
  (switch-to-buffer "*rips server*"))

(defun tm-start-rc()
  (interactive)
  (start-process-shell-command "server-rc" "*rc server*" ". ~/.taxi_magic_rc; ~/tm/repos/prod/rc/trunk/script/server")
  (switch-to-buffer "*rc server*"))

(defun tm-start-all()
  (interactive)
  (tm-start-ccp)
  (split-window-vertically)
  (tm-start-rips)
  (split-window-vertically)
  (tm-start-rc)
  (balance-windows))

(defun tm-stop-all()
  (interactive)
  ; Disconnect processes from buffers so that the buffers can be killed without prompt
  (set-process-buffer (get-process "server-ccp") nil)
  (set-process-buffer (get-process "server-rc") nil)
  (set-process-buffer (get-process "server-rips") nil)
  (kill-process "server-ccp")
  (kill-process "server-rc")
  (kill-process "server-rips")
  (kill-buffer "*ccp server*")
  (kill-buffer "*rc server*")
  (kill-buffer "*rips server*"))
