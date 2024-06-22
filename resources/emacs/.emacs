

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)


;; Remove Gui
(tool-bar-mode 0) ;; Remove toolbar
(scroll-bar-mode -1) ;; Remove scrollbar
(menu-bar-mode 0) ;; Remove menubar
(save-place-mode 1)
(setq ring-bell-function 'ignore) ;; Remove the annoying ring bell sound



;; Save buffer's history
(setq history-length 25)
(savehist-mode 1)



;; Ensure the packages are installed.
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))



;; Enable Multicursors On Emacs
(use-package multiple-cursors :ensure t) ;; Install multiple-cursors


;; Window Management Shortcuts
(global-set-key (kbd "C-<tab>") 'other-window)
(global-set-key (kbd "C-q") 'delete-window)


;; Misc shortcuts
(global-set-key (kbd "C-ç") 'comment-line) ;; Comment line
(global-set-key (kbd "C-x C-k") 'project-switch-project)
(global-set-key (kbd "C-x C-p") 'project-find-file)


;; Treemacs shortcuts
(use-package treemacs
  :ensure t)

(setq treemacs-width 35) 
(setq treemacs-follow-after-init t) 
(setq treemacs-indentation 2) 
(setq treemacs-show-hidden-files nil) 
(setq treemacs-sorting 'alphabetic-asc) 
(setq treemacs-use-collapsed-directories 3)

(global-set-key (kbd "M-0") 'treemacs-select-window)
(global-set-key (kbd "C-x t 1") 'treemacs-delete-other-windows)
(global-set-key (kbd "C-\\") 'treemacs)
(global-set-key (kbd "C-x t B") 'treemacs-bookmark)
(global-set-key (kbd "C-x t C-t") 'treemacs-find-file)
;; (global-set-key (kbd "C-x C-p") 'projectile-find-file)


;; Ivy package
(use-package ivy :ensure t :config (ivy-mode 1)) ;; Install package
(setq ivy-use-virtual-buffers t
      ivy-count-format "%d/%d ")
(global-set-key (kbd "C-c C-b") 'ivy-resume)
(global-set-key (kbd "C-x b") 'ivy-switch-buffer)


;; ;; Helm Swoop Package
(use-package helm-swoop
  :ensure t
  :config (helm-mode 1))

(global-set-key (kbd "M-i") 'helm-swoop) ; search for text in current file.
(global-set-key (kbd "M-I") 'helm-swoop-back-to-last-point) ; return to last search result
(global-set-key (kbd "C-c M-i") 'helm-multi-swoop-all) ; search for text in multiple files



;; Smex Configuration
(use-package smex :ensure t) ;; Install Smex
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)


;; Autocomplete
(use-package auto-complete
  :ensure t
  :init
  (progn
    (ac-config-default)
    (global-auto-complete-mode t)))


;; Flycheck
(use-package flycheck
  :ensure t
  :init(global-flycheck-mode t))


;; Emacs's Font Configuration
(use-package ligature :ensure t) ;; Install Ligature
(ligature-set-ligatures 't '("->" "=>" "->>" "<-" "<-<" "==" "!=" "<=" ">=" ":=" "=:=" "!==" "&&" "||" "..." ".." "|||"))
(global-ligature-mode t)


;; Set the default font
(add-to-list 'default-frame-alist
             '(font . "Fira Code 14"))

(setq-default line-spacing 0.3)


;; Lsp Mode
(use-package lsp-mode
  :ensure t
  :hook (java-mode . lsp-deferred)
  :bind (("C-c d" . lsp-describe-thing-at-point)
	 ("C-c a" . lsp-execute-code-action)
	 :map lsp-mode-map
	 ("C-c l" . lsp-command-map))
  :custom
  (lsp-vetur-format-default-formatter-css "none")
  (lsp-vetur-format-default-formatter-html "none")
  (lsp-vetur-format-default-formatter-js "none")
  (lsp-vetur-validation-template nil))



;; Java LSP Server
;; (use-package lsp-java
;;   :ensure t
;;   :after lsp
;;   :config (add-hook 'java-mode-hook 'lsp)
;;   ;; The code below is required to LSP detect the lombok generated  methods
;;   (let ((lombok-file (substitute-in-file-name "$HOME/.m2/repository/org/projectlombok/lombok/1.18.26/lombok-1.18.26.jar")))
;;     (setq lsp-java-vmargs
;;           (list
;;            ;; "-noverify"
;;            ;; "-Xmx4G"
;;            ;; "-Xms100m"
;;            ;; "-XX:+UseG1GC"
;;            ;; "-XX:+UseStringDeduplication"
;;            ;; "-Dsun.zip.disableMemoryMapping=true"
;;            (concat "-javaagent:" lombok-file)))))


(use-package lsp-java
  :ensure t
  :init
  (defun jmi/java-mode-config ()
    (setq-local tab-width 4
                c-basic-offset 4)
    (toggle-truncate-lines 1)
    (setq-local tab-width 4)
    (setq-local c-basic-offset 4)
    (lsp))

  :config
  ;; Enable dap-java
  (require 'dap-java)

  ;; Support Lombok in our projects, among other things
  (setq lsp-java-vmargs
        (list "-noverify"
              "-Xmx2G"
              "-XX:+UseG1GC"
              "-XX:+UseStringDeduplication"
              (concat "-javaagent:" "/home/joaonotfound/.m2/repository/org/projectlombok/lombok/1.18.26/lombok-1.18.26.jar")
              (concat "-Xbootclasspath/a:" "/home/joaonotfound/.m2/repository/org/projectlombok/lombok/1.18.26/lombok-1.18.26.jar"))
        lsp-file-watch-ignored
        '(".idea" ".ensime_cache" ".eunit" "node_modules"
          ".git" ".hg" ".fslckout" "_FOSSIL_"
          ".bzr" "_darcs" ".tox" ".svn" ".stack-work"
          "build")

        lsp-java-import-order '["" "java" "javax" "#"]
        ;; Don't organize imports on save
        lsp-java-save-action-organize-imports nil

        ;; Formatter profile
        lsp-java-format-settings-url
        (concat "file://" jmi/java-format-settings-file))

  :hook (java-mode   . jmi/java-mode-config)

  :demand t
  :after (lsp lsp-mode dap-mode jmi-init-platform-paths))



;; Magit - Git Emacs Integration
(use-package magit
  :ensure t)



;; Company Mode
(use-package company
  :ensure t
  :hook ((emacs-lisp-mode . (lambda ()
			      (setq-local company-backends '(company-elips))))
	 (emacs-lisp-mode . company-mode))
  :config
  (setq company-idle-delay 0.1
	company-minimum-prefix-length 1)
  :init
  (global-company-mode)
  )



;; Golang
;; Go - lsp-mode
;; Set up before-save hooks to format buffer and add/delete imports.

(use-package go-mode
  :ensure t)


(use-package lsp-ui
  :config
  (setq lsp-ui-doc-enable nil
        lsp-ui-sideline-enable nil
        lsp-ui-flycheck-enable t)
  :after lsp-mode)

(use-package dap-mode
  :config
  (dap-mode t)
  (dap-ui-mode t))

(use-package yasnippet
  :ensure t)

(defun lsp-go-install-save-hooks ()
  (add-hook 'before-save-hook #'lsp-format-buffer t t)
  (add-hook 'before-save-hook #'lsp-organize-imports t t))
(add-hook 'go-mode-hook #'lsp-go-install-save-hooks)

;; Start LSP Mode and YASnippet mode
(add-hook 'go-mode-hook #'lsp-deferred)
(add-hook 'go-mode-hook #'yas-minor-mode)



;; Web Mode Configuration
(use-package web-mode
  :ensure t)
(add-to-list 'auto-mode-alist '("\\.vue\\'" . web-mode))



(setq web-mode-engines-alist
      '(("vue" . "\\.vue\\'")))




(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(doom-homage-black))
 '(custom-safe-themes
   '("38c0c668d8ac3841cb9608522ca116067177c92feeabc6f002a27249976d7434" "b1acc21dcb556407306eccd73f90eb7d69664380483b18496d9c5ccc5968ab43" "014cb63097fc7dbda3edf53eb09802237961cbb4c9e9abd705f23b86511b0a69" "5b9a45080feaedc7820894ebbfe4f8251e13b66654ac4394cb416fef9fdca789" "9b59e147dbbde5e638ea1cde5ec0a358d5f269d27bd2b893a0947c4a867e14c1" "c48551a5fb7b9fc019bf3f61ebf14cf7c9cdca79bcb2a4219195371c02268f11" "c8b3d9364302b16318e0f231981e94cbe4806cb5cde5732c3e5c3e05e1472434" "a44e2d1636a0114c5e407a748841f6723ed442dc3a0ed086542dc71b92a87aee" "df6dfd55673f40364b1970440f0b0cb8ba7149282cf415b81aaad2d98b0f0290" "c1d5759fcb18b20fd95357dcd63ff90780283b14023422765d531330a3d3cec2" "70e7f094987e3c6226c54078dd986e11cab7246ea1c9e58a9907afa90f3c10c9" "02d422e5b99f54bd4516d4157060b874d14552fe613ea7047c4a5cfa1288cf4f" "badd1a5e20bd0c29f4fe863f3b480992c65ef1fa63951f59aa5d6b129a3f9c4c" "bf798e9e8ff00d4bf2512597f36e5a135ce48e477ce88a0764cfb5d8104e8163" "eab123a5ed21463c780e17fc44f9ffc3e501655b966729a2d5a2072832abd3ac" "51ec7bfa54adf5fff5d466248ea6431097f5a18224788d0bd7eb1257a4f7b773" "3e200d49451ec4b8baa068c989e7fba2a97646091fd555eca0ee5a1386d56077" "524fa911b70d6b94d71585c9f0c5966fe85fb3a9ddd635362bfabd1a7981a307" "efcecf09905ff85a7c80025551c657299a4d18c5fcfedd3b2f2b6287e4edd659" "57a29645c35ae5ce1660d5987d3da5869b048477a7801ce7ab57bfb25ce12d3e" "4c56af497ddf0e30f65a7232a8ee21b3d62a8c332c6b268c81e9ea99b11da0d3" "830877f4aab227556548dc0a28bf395d0abe0e3a0ab95455731c9ea5ab5fe4e1" "fee7287586b17efbfda432f05539b58e86e059e78006ce9237b8732fde991b4c" "7f1d414afda803f3244c6fb4c2c64bea44dac040ed3731ec9d75275b9e831fe5" "7fd8b914e340283c189980cd1883dbdef67080ad1a3a9cc3df864ca53bdc89cf" "bbb13492a15c3258f29c21d251da1e62f1abb8bbd492386a673dcfab474186af" "c92a0fece9ad256d83a0ce85df1f15e1c9280eba91c0cc06f8879b9572a855c7" "4eb9462a8fff9153bfe88a9ef53aa043aec8b79c5298d2873e887e0c3a8b03de" "90a6f96a4665a6a56e36dec873a15cbedf761c51ec08dd993d6604e32dd45940" "f149d9986497e8877e0bd1981d1bef8c8a6d35be7d82cba193ad7e46f0989f6a" "3bd14b5c432f95aa1cd589d612151d5214c6cb4239b87dd1ffbda51b71d48393" "29b4f767c48da68f8f3c2bbf0dde2be58e4ed9c97e685af5a7ab7844f0d08b8b" "4c7228157ba3a48c288ad8ef83c490b94cb29ef01236205e360c2c4db200bb18" "13197101dbbab6dd1af33a589a2ba974d5db960c49fc46c5f19b024c620789ea" "e9d47d6d41e42a8313c81995a60b2af6588e9f01a1cf19ca42669a7ffd5c2fde" "36ca8f60565af20ef4f30783aa16a26d96c02df7b4e54e9900a5138fb33808da" "c9ddf33b383e74dac7690255dd2c3dfa1961a8e8a1d20e401c6572febef61045" "b9761a2e568bee658e0ff723dd620d844172943eb5ec4053e2b199c59e0bcc22" "8d8207a39e18e2cc95ebddf62f841442d36fcba01a2a9451773d4ed30b632443" "00cec71d41047ebabeb310a325c365d5bc4b7fab0a681a2a108d32fb161b4006" "88f7ee5594021c60a4a6a1c275614103de8c1435d6d08cc58882f920e0cec65e" "5f128efd37c6a87cd4ad8e8b7f2afaba425425524a68133ac0efd87291d05874" "0c83e0b50946e39e237769ad368a08f2cd1c854ccbcd1a01d39fdce4d6f86478" "10e5d4cc0f67ed5cafac0f4252093d2119ee8b8cb449e7053273453c1a1eb7cc" "c38363d290dc139853ae018ec595b5fa477769d828f350c4f93708e9591ba5de" "ebbd4bbb0f017cb09f7a3b1363b83dfde0c5f4970cda2705419457366cd2de91" "179936f522293a0963e57e17b1e8e09615dfb82cffebe32950f49c7cccb2fea6" "b62e6fde6217bbbff61c5f504a5205c6adfbb69ffa40153a0ff47f6a047f1008" "631c52620e2953e744f2b56d102eae503017047fb43d65ce028e88ef5846ea3b" "680f62b751481cc5b5b44aeab824e5683cf13792c006aeba1c25ce2d89826426" "8b148cf8154d34917dfc794b5d0fe65f21e9155977a36a5985f89c09a9669aa0" "aec7b55f2a13307a55517fdf08438863d694550565dee23181d2ebd973ebd6b8" "8c7e832be864674c220f9a9361c851917a93f921fedb7717b1b5ece47690c098" "a9eeab09d61fef94084a95f82557e147d9630fbbb82a837f971f83e66e21e5ad" "9e1cf0f16477d0da814691c1b9add22d7cb34e0bb3334db7822424a449d20078" "443e2c3c4dd44510f0ea8247b438e834188dc1c6fb80785d83ad3628eadf9294" "35c096aa0975d104688a9e59e28860f5af6bb4459fd692ed47557727848e6dfe" "28a104f642d09d3e5c62ce3464ea2c143b9130167282ea97ddcc3607b381823f" "013728cb445c73763d13e39c0e3fd52c06eefe3fbd173a766bfd29c6d040f100" "2078837f21ac3b0cc84167306fa1058e3199bbd12b6d5b56e3777a4125ff6851" "4b6cc3b60871e2f4f9a026a5c86df27905fb1b0e96277ff18a76a39ca53b82e1" "56044c5a9cc45b6ec45c0eb28df100d3f0a576f18eef33ff8ff5d32bac2d9700" "0d0936adf23bba16569c73876991168d0aed969d1e095c3f68d61f87dd7bab9a" "9f297216c88ca3f47e5f10f8bd884ab24ac5bc9d884f0f23589b0a46a608fe14" "6adeb971e4d5fe32bee0d5b1302bc0dfd70d4b42bad61e1c346599a6dc9569b5" "3cdd0a96236a9db4e903c01cb45c0c111eb1492313a65790adb894f9f1a33b2d" "2721b06afaf1769ef63f942bf3e977f208f517b187f2526f0e57c1bd4a000350" "9d29a302302cce971d988eb51bd17c1d2be6cd68305710446f658958c0640f68" "f5f80dd6588e59cfc3ce2f11568ff8296717a938edd448a947f9823a4e282b66" "a9dc7790550dcdb88a23d9f81cc0333490529a20e160a8599a6ceaf1104192b5" "2d035eb93f92384d11f18ed00930e5cc9964281915689fa035719cab71766a15" "f490984d405f1a97418a92f478218b8e4bcc188cf353e5dd5d5acd2f8efd0790" "47d5324dac28a85c1bb84b4c1dc3a8dc407cc7369db6e30d3244b16232b1eec4" default))
 '(package-selected-packages
   '(sublime-themes anki-editor web-mode vue-mode lsp-java solarized-theme spacemacs-theme ubuntu-theme atom-dark-theme material-theme space-theming nord-theme nothing-theme cyberpunk-theme ample-theme firecode-theme seti-theme darkmine-theme zweilight-theme yasnippet lsp-ui lsp-mode flycheck auto-complete vterm zeno-theme yabaki-theme uwu-theme soothe-theme smex simplicity-theme projectile poet-theme multiple-cursors ligature ivy helm-swoop doom-themes)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background nil)))))
