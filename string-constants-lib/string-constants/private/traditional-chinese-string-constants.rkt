#|

When modifying the string constants files,
please adhere to these guidelines:

- All the entries in english-string-constants.rkt have the same format
  (name string).  If the purpose of an entry you are adding to the
  file is not clear from just the name and string, put a comment next
  to the entry explaining what the string is going to be used for and
  in what context.
  That's especially true for strings that contain things like "~a".
  Systematically describe what the "~a" is going to be replaced with.
  When we have to translate strings like "deleting ~a", we translators
  need to know what "~a" is going to be (in particular, in some
  languages like French, we need to know whether the "~a" is going to
  be a masculine or feminine word, or whether it's going to be
  singular or plural, etc).

- When adding a bunch of new entries, put together in a section the
  entries that logically belong together.  Give a title to your
  section, so we have an idea of what the strings are for.  Don't mix
  in the same section strings that have nothing to do with each other,
  that's only going to confuse us.  Do not start a new section if
  there's already one that deals with the same thing.  Dumping all the
  new entries in random order at the end of the file is not a good way
  to have your new entries translated in a timely manner...

- Before adding strings for your new pet tool, check whether you can't
  re-use strings that already exist.  There's no need for yet another
  "Ok" string...

- If you modify an existing string in english-string-constants.rkt, go
  through all the *-string-constants.rkt files for the other languages,
  comment out the old version of the modified string in each of these
  files, and put a short comment there telling us the English string
  has changed and needs to be re-translated.  Do not erase the old
  version, it might help us translate the new one.  Do not move it
  either.  Just comment it out and add the short comment.  After the
  next git update DrRacket will automatically tell us translators that
  a new string needs to be translated, we will find your comment in
  the file, and know what to do.
	Some evil evil people might think that, since DrRacket automatically
  informs us of new strings to be translated, an easier thing to do
  when modifying an existing string would be to simply rename it at
  the same time.  This works, except that if you do that, we
  translators will get two warnings from DrRacket:
		language english had but french does not:
		(new-name "New String")
		language french had but english does not:
		(old-name "Old String")
  then we translators will be left to wonder whether the two things
  are related or not, and whether we can safely base our translation
  of "New String" on the translation of "Old String" (since the two
  strings are likely to be close in meaning).  Worse, we might not
  even realize the two strings are related and translate "New String"
  from scratch, just to realize later that it's only a variation of
  "Old String".  I can tell you that nothing pisses off a translator
  more than having to translate pretty much the same string twice
  just because *you* were too lazy to inform us that it was just a
  slight modification to an existing string rather than an entirely
  new one.  Conclusion: do not change the name of a string unless you
  have some really good reason to do so.

- Please think hard before choosing a string and make sure it means
  what you want it to mean.  That way you won't have to change it
  later, and we won't have to retranslate it.

- Please think hard before choosing the name for a string.  Use
  meaningful names.  "error" or "ok" are not meaningful names.  Prefix
  all related names with a common prefix (the name of your tool or
  module).  String names are not the right place to save on typing.

- If, for some reason, you really have to change the name of a string
  (like, because the original name you gave it really sucked...),
  change the name of the string in *ALL* the *-string-constants.rkt
  files.  That's a modification you can do without the help of a
  translator, so do it yourself.  It's not the job of the translators
  to clean up your naming mess for you.  Besides, you are the one who
  knows what you changed, so leaving the translators having to guess
  what you did is Not Nice(tm).

- If, for some reason, you need to remove a string (i.e. you changed
  your code and don't need the string anymore), remove the string in
  *ALL* the *-string-constants.rkt files.  Again, you don't need the
  help of a translator to do that.  If you're not sure whether you
  might need the string in the future or not, just comment it out in
  *ALL* the files.

|#

(module traditional-chinese-string-constants "string-constant-lang.rkt"
  ;;; when translating this constant, substitute name of actual language for `English'
  (is-this-your-native-language "你的母語是繁體中文嗎？")

  (#:define drr "DrRacket")

  (are-you-sure-you-want-to-switch-languages
   "這會更改圖形介面的語言，並需要重新啟動 DrRacket。確定要進行嗎？")

  (interact-with-drscheme-in-language "以繁體中文與 DrRacket 互動")

  ;; these two should probably be the same in all languages except English.
  ;; they are the button labels (under macos and windows, respectively)
  ;; that go the with the string above.
  (accept-and-quit "接受並結束")
  (accept-and-exit "接受並結束")

  ;;; general purpose (DrRacket is hereby a word in every language, by decree of Robby :)
  (plt "PLT")
  (drscheme drr)
  (drracket drr)
  (ok "確定")
  (cancel "取消")
  (abort "中止")
  (untitled "未命名")
  (untitled-n "未命名 ~a")
  (warning "警告")
  (error "錯誤")
  (close "關閉") ;; as in, close an open window or tab. must match close-menu-item
  ;; in the sense that, when the &s have been stripped from
  ;; close-menu-item, it must be the same string as this.
  (close-window "關閉視窗")
  (stop "停止")
  (&stop "停止(&S)") ;; for use in button and menu item labels, with short cut.
  (are-you-sure-delete? "確定要刪除「~a」嗎？") ;; ~a is a filename or directory name
  (are-you-sure-replace? "確定要取代「~a」嗎？") ;; ~a is a filename or directory name
  (ignore "忽略")
  (revert "還原")

  ;; label for a generic check box, often supported on dialogs
  ;; that ask a binary choice of the user. If checked, the
  ;; dialog isn't going to be shown again.
  ;; One version for always using the current choice:
  (dont-ask-again-always-current "不再詢問（一律使用目前選擇）")
  ;; One generic version (ie, on the Quit DrRacket dialog)
  (dont-ask-again                "不再詢問")

  ;;; important urls
  (web-materials "相關網站") ;; menu item title
  (tool-web-sites "工具網站")   ;; menu item title
  (plt-homepage "Racket")
  (pbd-homepage "Program by Design")

  ;; having an issue (replaces the bug report form, whose string constants are below)
  (have-an-issue? "遇到問題嗎？…")
  (use-github-or-the-mailing-list-for-issues
   "如果你發現了 Racket 或 DrRacket 的錯誤，請到 GitHub 建立 issue。\n\n"
   "如果你遇到不合理的行為，但不確定是否為錯誤，請到郵件論壇詢問。")
  (visit-mailing-lists "前往郵件論壇") ;; button in dialog
  (visit-github "前往 GitHub") ;; button in dialog, goes to 'open issue' page

  ;;; bug report form
  (cancel-bug-report? "取消回報錯誤？")
  (are-you-sure-cancel-bug-report?
   "確定要取消送出這份錯誤回報嗎？")
  (do-you-want-to-discard-or-save-this-bug-report
   "要放棄還是儲存這份錯誤回報？")
  (discard "放棄") ;; a button label for a dialog box with the above question
  (bug-report-form "錯誤回報表")
  (bug-report-field-name "你的姓名")
  (bug-report-field-email "電子郵件")
  (bug-report-field-summary "摘要")
  (bug-report-field-severity "嚴重程度")
  (bug-report-field-class "類別")
  (bug-report-field-description "描述")
  (bug-report-field-reproduce1 "重現")
  (bug-report-field-reproduce2 "步驟")
  (bug-report-field-environment "環境")
  (bug-report-field-docs-installed "已安裝文件")
  (bug-report-field-collections "程式集")
  (bug-report-field-links "連結")  ;; from 'raco link'
  (bug-report-field-human-language "介面語言")
  (bug-report-field-memory-use "記憶體使用量")
  (bug-report-field-version "版本")
  (bug-report-synthesized-information "彙整資訊")  ;; dialog title
  (bug-report-show-synthesized-info "顯示彙整資訊")
  (bug-report-submit "送出")
    ;; button in bug report dialog, next to cancel and bug-report-submit
  (close-and-save-bug-report "關閉並儲存")
  ;; same as above, but used when there are saved bug reports
  (bug-report-submit-menu-item "送出錯誤回報…")
  ;; in Help Menu, submenu title
  (saved-bug-reports-menu-item "已儲存的錯誤回報")
  ;; menu item: only shows up when there is more than one saved bug report
  (disacard-all-saved-bug-reports "放棄所有已儲存的錯誤回報")
  ;; an info message that shows up as a disabled menu item when no saved bug reports are around
  (no-saved-bug-reports "沒有已儲存的錯誤回報")
  ;; button label the user sees when there are saved bug reports,
  ;; but the user asks to save another one.
  (new-bug-report "新增錯誤回報")
  ;; button on the bottom of the bug report form
  (close-and-save "關閉並儲存")
  (saved-unsubmitted-bug-reports "已儲存但未送出的錯誤回報：")
  ;; the above string constant is next to previous line in same dialog, followed by
  ;; list of bug report subjects (as buttons)
  (error-sending-bug-report "錯誤回報傳送失敗")
  (error-sending-bug-report-expln
   "傳送這份錯誤回報時發生錯誤。"
   " 如果你的網路連線正常，請造訪：\n\n"
   "    https://github.com/racket/racket/issues/new\n\n"
   "並透過 GitHub 回報。造成不便，敬請見諒。\n\n錯誤訊息如下：\n~a")
  (illegal-bug-report "不合法的錯誤回報")
  (pls-fill-in-field "請填寫「~a」欄位")
  (malformed-email-address "電子郵件地址格式錯誤")
  (pls-fill-in-either-description-or-reproduce
   "請填寫「描述」欄位或「重現步驟」欄位其一。")

  ;;; check syntax
  (check-syntax "語法檢查")
  (cs-italic "斜體")
  (cs-bold "粗體")
  (cs-underline "底線")
  (cs-smoothing-default "預設")
  (cs-smoothing-partial "部分平滑")
  (cs-smoothing-full "平滑")
  (cs-smoothing-none "不平滑")
  (cs-change-color "變更顏色")
  (cs-foreground-color "前景色")
  (cs-background-color "背景色")
  (cs-tack/untack-arrow "釘選/取消釘選箭頭")
  (cs-tack-crossing-arrows "釘選交叉箭頭")
  (cs-jump-to-next-bound-occurrence "跳到下一個繫結位置")
  (cs-jump-to-previous-bound-occurrence "跳到上一個繫結位置")
  (cs-jump-to-binding "跳到繫結位置")
  (cs-jump-to-definition "跳到定義（於其他檔案）")
  (cs-open-defining-file "開啟定義所在檔案")
  (cs-error-message "錯誤訊息")
  (cs-open-file "開啟 ~a")
  (cs-rename-var "重新命名 ~a")
  (cs-rename-id "重新命名識別字")
  (cs-rename-var-to "將「~a」重新命名為：")
  (cs-name-duplication-error
   "你選擇的新名稱 ~s 與此作用域中既有名稱衝突。")
  (cs-rename-anyway "仍要重新命名")
  (cs-status-init "語法檢查：初始化使用者程式環境")
  (cs-status-coloring-program "語法檢查：染色標示程式")
  (cs-status-eval-compile-time "語法檢查：求值編譯期")
  (cs-status-expanding-expression "語法檢查：展開運算式")
  (cs-status-loading-docs-index "語法檢查：載入文件索引")
  (cs-syncheck-running "語法檢查執行中")
  (cs-mouse-over-import "繫結「~s」自 ~s 匯入")
  (cs-mouse-over-import/library-only "自 ~s 匯入")
  (cs-view-docs "檢視「~a」的文件")
  (cs-view-docs-from "~a 來自 ~a")  ;; a completed version of the line above
  ;; (cs-view-docs) is put into the first ~a and a list of modules (separated by commas)
  ;; is put into the second ~a. Use check syntax and right-click on a documented variable
  ;; (eg, 'require') to see this in use

  (cs-lexical-variable "詞法變數")
  (cs-set!d-variable "被改變的變數")
  (cs-imported-variable "匯入的變數")
  (cs-unused-require "未使用的 require")
  (cs-free-variable "自由變數")

  (cs-binder-count "~a 個繫結位置")
  (cs-zero-varrefs "沒有繫結位置")
  (cs-one-varref "1 個繫結位置")
  ;; expected to have one ~a formatter that will accept a number
  (cs-n-varrefs "~a 個繫結位置")

  (cs-contract-my-obligation "契約：此模組的責任")
  (cs-contract-their-obligation "契約：使用端模組的責任")
  (cs-contract-both-obligation "契約：此模組與使用端模組的共同責任")
  (cs-contract-unk-obligation "契約：未知責任")

  ;; require prefix functionality
  (cs-add-prefix-for-require "為 require 加上前綴")
  (cs-prefix-require-title "前綴化 require")
  (cs-prefix-require "選擇要加入至每個匯入變數的前綴")
  (cs-all-binders-are-prefixed
   "所有 require 看起來都已有前綴；請嘗試使用重新命名代替")
  (cs-the-binder-is-prefixed
   "此 require 看起來已具有前綴；請嘗試使用重新命名代替")

  ;; mode sub-menu in the "view" menu
  (cs-check-syntax-mode "語法檢查模式")
  (cs-mode-menu-show-my-obligations "我的契約責任")
  (cs-mode-menu-show-client-obligations "使用端的契約責任")
  (cs-mode-menu-show-syntax "語法類別")

  ;; the documentation blue boxes in the upper-right corner of the drracket window
  (sc-read-more... "閱讀更多…")
  (sc-f2-to-un/lock "按 F2 鎖定/解除鎖定")

  ;; the online check syntax status messages (mouse over the bottom right of drracket's
  ;; window to see the messages during online expansion's various phases)
  (online-expansion-running "背景展開執行中")
  (online-expansion-only-raw-text-files-supported "僅支援純文字檔")
  (online-expansion-abnormal-termination "背景展開異常終止")
  (online-expansion-abnormal-termination-out-of-memory
   "背景展開異常終止（記憶體不足）")
  (online-expansion-finished-successfully "背景展開完成")

  (jump-to-error "跳至錯誤")
  (copy-error-message "複製錯誤訊息")
  (online-expansion-is-disabled "已停用背景展開")
  ; these next two show up in the bar along the bottom of the drracket window
  (online-expansion-pending "背景展開待處理…")
  ;; note: there may still be errors in this case
  (online-expansion-finished "背景展開完成")
  ; the next two show up in a menu when you click on the circle in the bottom right corner
  (disable-online-expansion "停用背景展開")
  (enable-online-expansion "啟用背景展開")
  ;; the online expansion preferences pane
  (online-expansion "背景展開") ;; title of prefs pane
  ; the different kinds of errors
  (online-expansion-show-read-errors-as "顯示讀取層級錯誤")
  (online-expansion-show-variable-errors-as "顯示未繫結識別字錯誤")
  (online-expansion-show-other-errors-as "顯示其他錯誤")
  ; locations the errors can be shown
  (online-expansion-error-gold-highlight "以金色染色標示")
  (online-expansion-error-margin "於邊界顯示")
  ; the label of a preference in the (string-constant online-expansion) section
  (show-arrows-on-mouseover "滑鼠懸停顯示繫結與尾端位置箭頭")
  (show-blueboxes "在右上角顯示簽名方塊及其半圓箭頭")
  ;;; info bar at botttom of drscheme frame
  (collect-button-label "GC")
  (read-only "唯讀")
  (auto-extend-selection "自動延伸選取")
  (overwrite "覆寫")
  (running "執行中")
  (not-running "未執行")

  ;; button label: ~a is filled with the name of a pkg
  (install-package-button "安裝 ~a")
  ;; button label; shown when there is a missing module, but no matching package
  (update-catalog "更新目錄")
  ;; message label; used as a status message when updating the pkg catalog
  (updating-catalog-from "正從 ~a 更新…")

  ;;; misc
  (welcome-to-something "歡迎使用 ~a")

  ; this appears in the drscheme about box.
  (welcome-to-drscheme-version/language "歡迎使用 DrRacket，版本 ~a，~a")

  ; these appear on subsequent lines in the `Help|Welcome to DrRacket' dialog.
  (welcome-to-drscheme "歡迎使用 DrRacket")

  (goto-line "前往行號")
  (goto-line-invalid-number
   "~a 不是有效的行號。必須是 1 到 ~a 之間的整數")
  (goto-position "前往位置")
  (no-full-name-since-not-saved
   "檔案尚未儲存，因此沒有完整名稱。")
  (cannot-open-because-dne "無法開啟 ~a，因為它不存在。")

  (needs-execute-language-changed
   "警告：語言已變更。請按執行。")
  (needs-execute-teachpack-changed
   "警告：教材包已變更。請按執行。")
  (needs-execute-defns-edited
   "警告：定義視窗已變更。請按執行。")

  (editor-changed-since-srcloc-recorded
   "自從記錄來源位置後，此編輯器內容已有變更，"
   " 因此目前染色標示的區域可能已不再對應正確的來源位置。")

  (file-is-not-saved "檔案「~a」尚未儲存。")
  (save "儲存")
  (close-anyway "仍要關閉")
  (dont-save "不要儲存")
  (clear-anyway "仍要清除")

  ;; menu item title
  (log-definitions-and-interactions "記錄定義與互動…")
  (stop-logging "停止記錄")
  (please-choose-a-log-directory "請選擇記錄目錄")
  (logging-to "記錄位置：")
  (erase-log-directory-contents "要清除記錄目錄內容嗎：~a？")
  (error-erasing-log-directory "清除記錄目錄內容時發生錯誤。\n\n~a\n")

  ;; menu items connected to the logger; also in a button in the planet status line in the drs frame
  (show-log "顯示記錄(&L)")
  (hide-log "隱藏記錄(&L)")
  (logger-scroll-on-output "輸出時自動捲動") ; a checkbox in the logger pane
  (log-messages "記錄訊息") ;; label for the drracket logging gui panel

  ;; modes
  (mode-submenu-label "模式")
  (scheme-mode "Scheme 模式")
  (racket-mode "Racket 模式")
  (text-mode "文字模式")

  (scheme-mode-color-symbol "符號")
  (scheme-mode-color-keyword "關鍵字")
  (scheme-mode-color-comment "註解")
  (scheme-mode-color-string "字串")
  (scheme-mode-color-text "文字")
  (scheme-mode-color-constant "常數")
  (scheme-mode-color-parenthesis "括號")
  (scheme-mode-color-hash-colon-keyword "#:關鍵字")
  (scheme-mode-color-error "錯誤")
  (scheme-mode-color-other "其他")
  ;; the ~a is filled in with one of the above (scheme-mode-*)
  (syntax-coloring-choose-color "選擇 ~a 的顏色")
  (preferences-colors "顏色") ;; used in the preferences dialog

  ;; parenthesis color scheme string constants
  ; label for the choice% menu in the preferences dialog
  (parenthesis-color-scheme "括號配色方案")
  (paren-color-basic-grey "基本灰")
  (paren-color-shades-of-gray "灰色漸層")
  (paren-color-shades-of-blue "藍色漸層")
  (paren-color-spring "春")
  (paren-color-fall "秋")
  (paren-color-winter "冬")


  (url: "URL：")
  (open-url... "開啟 URL…")
  (open-url "開啟 URL")
  (browse... "瀏覽…")
  (bad-url "不正確的 URL")
  (bad-url:this "不正確的 URL：~a")

  ;; Help Desk
  (help "說明")
  (racket-documentation "Racket 說明文件")
  (help-desk "說明中心")
  (plt:hd:search "搜尋")
  (plt:hd:feeling-lucky "好手氣")
  (plt:hd:home "說明中心首頁")
  ; next 3 are popup menu choices in help desk search frame
  (plt:hd:search-for-keyword "關鍵字輸入")
  (plt:hd:search-for-keyword-or-index "關鍵字或索引輸入")
  (plt:hd:search-for-keyword-or-index-or-text "關鍵字、索引或全文")
  (plt:hd:exact-match "完全符合")
  (plt:hd:containing-match "包含匹配")
  (plt:hd:regexp-match "正規表示式匹配")
  (plt:hd:find-docs-for "尋找說明：")
  (plt:hd:search-stopped-too-many-matches "[搜尋中止：結果過多]")
  (plt:hd:nothing-found-for "找不到：~a")
  (plt:hd:and "與")
  (plt:hd:refresh "重新整理")
  (plt:hd:refresh-all-manuals "重新整理所有手冊")
  (plt:hd:manual-installed-date "（安裝於 ~a）")
  ; Help Desk configuration
  ;; refreshing manuals
  (plt:hd:refreshing-manuals "重新下載手冊")
  (plt:hd:refresh-downloading... "正在下載 ~a…")
  (plt:hd:refresh-deleting... "正在刪除 ~a 的舊版本…")
  (plt:hd:refresh-installing... "正在安裝 ~a 的新版本…")
  (plt:hd:refresh-clearing-indices "清除快取索引")
  (plt:hd:refreshing-manuals-finished "完成。")
  (plt:hd:about-help-desk "關於說明中心")
  (plt:hd:help-desk-about-string
   "說明中心是 Racket 軟體的完整資訊來源。\n\n"
   "版本 ~a\n著作權 (c) ~a-~a PLT")
  (plt:hd:help-on-help "說明的說明")
  (plt:hd:help-on-help-details
   "若要取得使用說明中心的協助，請在說明中心首頁點選第一個連結「說明中心」。"
   " （若你不在首頁，請按視窗上方的「首頁」按鈕。）")
  (reload "重新載入") ;; refresh the page in a web browser
  (plt:hd:ask-about-separate-browser
   "你選擇了指向網頁的連結。"
   " 要在說明中心內建瀏覽器中檢視，還是使用外部瀏覽器？")
  (plt:hd:homebrew-browser "說明中心瀏覽器") ;; choice for the above string (in a button)
  (plt:hd:separate-browser "外部瀏覽器") ;; other choice for the above string (also in a button)
  (plt:hd:external-link-in-help "說明中的外部連結")
  (plt:hd:use-homebrew-browser "外部連結使用說明中心瀏覽器")
  (plt:hd:new-help-desk "新的說明中心")

  ;; in the Help Desk language dialog, title on the right.
  (plt:hd:manual-search-ordering "手冊搜尋順序")

  ;; in the help-desk standalone font preference dialog, on a check box
  (use-drscheme-font-size "使用 DrRacket 的字型大小")

  ;; in the preferences dialog in drscheme there is example text for help desk font size.
  ;; clicking the links in that text produces a dialog with this message
  (help-desk-this-is-just-example-text
   "這只是用於設定字型大小的範例文字。"
   " 若要開啟這些連結，請從說明選單開啟說明中心。")

  ;; this appears in the bottom part of the frame the first time the user hits `f1'
  ;; (assuming nothing else has loaded the documentation index first)
  ;; see also: cs-status-loading-docs-index
  (help-desk-loading-documentation-index "說明中心：正在載入文件索引")

  ;; the next four are all in the same dialog box (only one of the first two appears)
  (help-desk-materialize-docs-something-changed
   "DrRacket 偵測到文件索引可能有問題。"
   " 要嘗試修復嗎（可能需要一些時間）？\n\n詳情：文件目錄 ~a 不存在，"
   " 因此在瀏覽器中的搜尋很可能會失敗。")
  (help-desk-materialize-docs-first-time
   "DrRacket 偵測到文件索引可能有問題。"
   " 要嘗試修復嗎（可能需要一些時間）？\n\n詳情：DrRacket 之前未具現化"
   " 使用者文件，因此在瀏覽器中的搜尋可能會失敗。")
  (help-desk-do-nothing "不進行任何動作")
  (help-desk-materialize-user-docs "具現化使用者文件")
  ; this is used in a dialog to let the user know that work is being done based on
  ; choices made from the previous dialog in the above four string constants
  (help-desk-materializing-user-docs... "正在具現化使用者文件…")

  ;; Help desk htty proxy
  (http-proxy "HTTP 代理")
  (proxy-direct-connection "直接連線")
  (proxy-use-proxy "使用代理：")
  (proxy-host "主機")
  (proxy-port "連接埠")
  (proxy-bad-host "不良的代理主機")

  ;; browser
  (rewind-in-browser-history "倒轉")
  (forward-in-browser-history "前進")
  (home "首頁")
  (browser "瀏覽器")
  (external-browser-choice-title "外部瀏覽器") ; title for radio-button set
  (browser-command-line-label "命令列：") ; label for radio button that is followed by text boxes
  (choose-browser "選擇瀏覽器")
  (no-browser "稍後再問")
  ; explanatory text for dialog, line 1
  (browser-cmdline-expl-line-1 "（命令列由前置文字、URL、")
  ; ... line 2. (Anyone need more lines?)
  (browser-cmdline-expl-line-2 "與後置文字串接而成，其間不會加入任何額外空白。）")
  (install? "安裝？")  ;; if a .plt file is found (title of dialog)
  (you-have-selected-an-installable-package "你選擇了一個可安裝的套件。")
  (do-you-want-to-install-it? "要安裝它嗎？")
  (paren-file-size "（檔案大小 ~a 位元組）")
  (download-and-install "下載並安裝") ;; button label
  (download "下載") ;; button label
  (save-downloaded-file/size "將已下載檔案（~a 位元組）另存為") ;; label for get-file dialog
  (save-downloaded-file "將已下載檔案另存為")  ;; label for get-file dialog
  (downloading "下載中") ;; dialog title
  (downloading-file... "正在下載檔案…")
  (package-was-installed "套件已安裝。")
  (download-was-saved "已儲存下載的檔案。")

  (install-plt-file-menu-item... "安裝 .plt 檔案…")
  (install-plt-file-dialog-title "安裝 .plt 檔案")
  (install-plt-web-tab "網路")
  (install-plt-file-tab "檔案")
  (install-plt-filename "檔名：")
  (install-plt-url "URL：")
  ; an error message from a primitive operation is appended to the end of this message.
  (install-plt-error-downloading "下載 .plt 檔案時發生錯誤。\n\n詳情：\n")
  (install-plt-error-header
   "檢查已下載的 .plt 檔案有效性時發生錯誤。請確認 URL 後再試一次。")

  ;; install plt file when opened in drscheme strings
  (install-plt-file "要安裝 ~a 還是開啟以編輯？")
  (install-plt-file/yes "安裝")
  (install-plt-file/no "編輯")

  (plt-installer-progress-window-title "安裝進度") ;; frame title
  (plt-installer-abort-installation "中止安裝") ;; button label
  ;; msg that appears in the installation window when installation is aborted
  (plt-installer-aborted "已中止。")

  ;;; about box
  (about-drscheme-frame-title "關於 DrRacket")

  ;;; save file in particular format prompting.
  (save-as-plain-text "將此檔案儲存為純文字？")
  (save-as-binary-format "將此檔案轉換為 DrRacket 特定格式以保留非文字元素？")
  (save-in-drs-format "將此檔案儲存為 DrRacket 特定的非文字格式？")
  (keep-format "保留（可能遺失資料）")
  (convert-format "轉換（建議）")
  (dont-save "不儲存")
  (yes "是")
  (no "否")

  ;; saving image (right click on an image to see the text)
  (save-image "儲存圖片…")

  ;;; preferences
  (preferences "偏好設定")
  (error-saving-preferences "儲存偏好設定時發生錯誤：~a")
  (error-saving-preferences-title "儲存偏好設定錯誤")
  ;; in the preferences error dialog; this happens when the lockfile exists (after 3 pref writes).
  (steal-the-lock-and-retry "取得鎖定並重試")

  (error-reading-preferences "讀取偏好設定時發生錯誤")
  (error-reading-preferences-explanation
   "偏好設定檔案已被鎖定，因此無法讀取 ~a 偏好。")
  ;; in the above, ~a is filled with the name of the preference (a symbol)
  (dont-ask-again-until-drracket-restarted "不再詢問（直到重新啟動 DrRacket）")
  ; difference between the above and below is one comes with a question (steal the lock or not)
  ;; and the other with just a notation saying "the file is locked"
  (dont-notify-again-until-drracket-restarted "不再通知（直到重新啟動 DrRacket）")
  (prefs-file-locked
   "偏好設定檔案已被鎖定（因為檔案 ~a 存在），"
   " 因此無法儲存你的偏好變更。要取消變更嗎？")
  (try-again "重試") ;; button label
  (give-up-and-use-the-default "放棄並使用預設值") ;; button label

  (prefs-file-still-locked
   "偏好設定檔案仍然被鎖定（因為檔案 ~a 存在），"
   " 因此你的偏好變更將不會被儲存。")
  (prefs-file-locked-nothing-doing
   "偏好設定檔案已被鎖定（經由 ~s），因此無法儲存偏好變更。")
  ;; the  ~s is filled with the lockfile; this string is (currently) used only on
  ;; windows where lockfiles are less friendly (and there is no steal fallback)

  (scheme-prefs-panel-label "Racket")
  (warnings-prefs-panel-label "警告")
  (editor-prefs-panel-label "編輯")
  (general-prefs-panel-label "一般")
  (editor-general-prefs-panel-label "一般編輯")
  (highlight-parens "在相符括號之間進行染色標示")
  (fixup-open-brackets "自動調整開啟的方括號")
  (fixup-close-parens "自動調整關閉括號")
  (flash-paren-match "閃爍顯示括號配對")
  (backup-unsaved-files "為未儲存的檔案建立備份")
  (first-change-files "建立首次變更檔")
  (map-delete-to-backspace "將 Delete 對應為 Backspace")
  (verify-exit "離開前確認")
  (ask-before-changing-format "變更儲存格式前先詢問")
  (wrap-words-in-editor-buffers "在編輯器緩衝區自動換行")
  (show-status-line "顯示狀態列")
  (count-columns-from-one "欄位編號自 1 起算")
  (display-line-numbers "在緩衝區顯示行號；非字元偏移量")
  ; used for popup menu; right click on line/column box in bottom of drs window
  (show-line-and-column-numbers "顯示行號與欄號")
  ; used for popup menu; right click on line/column box in bottom of drs window
  (show-character-offsets "顯示字元偏移量")
  (enable-keybindings-in-menus "在選單啟用快捷鍵（會覆寫 Emacs 快捷鍵）")
  (printing-mode "列印模式")
  (print-using-platform-specific-mode "使用平台特定列印")
  (print-to-ps "列印為 PostScript 檔")
  (print-to-pdf "列印為 PDF 檔")
  (command-as-meta "將 Command 視為 Meta") ;; macos/macos x only
  (any-control+alt-is-altgr "將 Control+Alt 視為 AltGr") ; Windows only
  (alt-as-meta "將 Alt 視為 Meta")
  (reuse-existing-frames "開啟新檔案時重用現有視窗")
  (default-fonts "預設字型")
  (basic-gray-paren-match-color "基本灰色括號染色標示顏色") ; in prefs dialog
  (online-coloring-active "互動式語法染色")
  (open-files-in-tabs "以分頁開啟檔案（非個別視窗）")
  (restore-open-files-from-previous-session? "還原上次工作階段的已開啟檔案？")
  (startup-open-files "啟動時開啟的檔案")
  (restore-open-files-from-previous-session "還原上次工作階段的已開啟檔案")
  (ask-me-each-time "每次詢問")
  (open-a-blank-window "開啟空白視窗")
  (show-interactions-on-execute "執行程式時自動開啟互動視窗")
  (switch-to-module-language-automatically
   "開啟模組時自動切換至模組語言")
  ;; in preferences, below the checkbox one line above this one
  (interactions-beside-definitions "將互動視窗放在定義視窗旁")
  (show-line-numbers "顯示行號")
  ;; just like the above, but capitalized for appearance in a menu item
  (show-line-numbers/menu "顯示行號(&N)")
  (hide-line-numbers/menu "隱藏行號(&N)")
  (show-line-numbers-in-definitions "在定義中顯示所有行號")
  ;; the constant above shows up in the popup menu item in the bottom of
  ;; the drracket window; controls the line numbers on each line in the definitions;
  ;; used in a checkable menu item
  ;; Capitalized for appearance in a menu item
  (show-indent-guides/menu "顯示縮排導引線(&G)")
  (hide-indent-guides/menu "隱藏縮排導引線(&G)")
  (reflow-paragraph-maximum-width "重整段落時的最大寬度")
  (maximum-char-width-guide-pref-check-box "最大字元寬度導引")
  (hide-column-width-guide "對具有 ~a 欄的檔案隱藏欄寬導引")
  (show-column-width-guide "在 ~a 欄顯示欄寬導引") ;; filled with a number > 2
  (limit-interactions-size "限制互動區大小")
  ;; this is in the color section already, so shorten the name a little
  (background-color "背景")
  ;; used for configuring colors, but doesn't need the word "color"
  (default-text-color "預設文字")
  (choose-a-background-color "請選擇背景顏色")
  (revert-to-defaults "將所有偏好設定還原為預設值")
  ;; used in the preferences dialog to undo preference changes
  (undo-changes "還原變更並關閉")

  (color-schemes "配色方案") ;; the label in the preferences dialog for the color scheme panel
  (classic-color-scheme "經典") ;; formerly called 'black on white'
  (modern-color-scheme "現代")   ;; an attempt to be more color-blind friendly
  ;; clicking the buttons changes the color schemes to some defaults that've been set up.
  (white-on-black-color-scheme "白字黑底")
  ; drracket additions to the color scheme dialog; two buttons
  (design-your-own-color-schemes "設計你自己的配色方案") ; pointer to (english-only) docs
  (style-and-color-names "樣式與色彩名稱")

  (add-spacing-between-lines "在行與行之間額外加入 1 像素間距")

  (editor-x-selection-mode "貼上前需明確執行複製"
                           "／不要自動複製選取內容")

  ; should have entire alphabet
  ; 英文字型測試句子不應該翻譯，繁體中文版也加入白居易的詩句，包含永字八法。
  (font-example-string "The quick brown fox jumped over the lazy dogs. 永豐西角荒園裏，盡日無人屬阿誰。")

  (change-font-button-label "變更")
  (fonts "字型")
  (other... "其他…") ;; used in the font choice menu item

  ; filled with type of font, eg modern, swiss, etc.
  (choose-a-new-font "請選擇新的「~a」字型")

  (font-size-slider-label "大小")
  (restart-to-see-font-changes "重新啟動後可看到字型變更")

  (font-prefs-panel-title "字型")
  (font-name "字型名稱")
  (font-size "字型大小")
  (set-font "設定字型…")
  (font-smoothing-label  "字型平滑化")
  (font-smoothing-none "無")
  (font-smoothing-some "部分")
  (font-smoothing-all "全部")
  (font-smoothing-default "使用系統預設值")
  (font-weight-label "字重")
  (font-weight-light "細體")
  (font-weight-normal "一般")
  (font-weight-bold "粗體")

  (select-font-name "選擇字型名稱")
  (example-text "範例文字：")
  (only-warn-once "當定義與互動不同步時只警告一次")

  ; font size menu items in the 'view' menu; the ~a is filled with a number (font size)
  (increase-font-size "增大字型大小（至 ~a）")
  (decrease-font-size "減小字型大小（至 ~a）")

  ; warning message when lockfile is around
  (waiting-for-pref-lock "正在等待偏好設定鎖定檔…")
  (pref-lock-not-gone
   "偏好設定鎖定檔：\n\n   ~a\n\n使偏好設定無法儲存。"
   " 請確定沒有 Racket 軟體正在執行並刪除此檔案。")
  (still-locked-exit-anyway? "偏好設定未成功儲存。仍要離開嗎？")

  ;;; indenting preferences panel
  (indenting-prefs-panel-label "縮排")
  (indenting-prefs-extra-regexp "額外的正規表示式")

  (square-bracket-prefs-panel-label "方括號")

  ; filled with define, lambda, or begin
  (enter-new-keyword "輸入新的類似 ~a 的關鍵字：")
  (x-keyword "~a 關鍵字")
  (x-like-keywords "類似 ~a 的關鍵字")

  ; used in Square bracket panel
  (skip-subexpressions "要略過的子運算式數量")

  (expected-a-symbol "需要符號，卻得到：~a")
  (already-used-keyword "「~a」已是特殊縮排關鍵字")
  (add-keyword "新增")
  (remove-keyword "移除")

  ; repl color preferences
  (repl-colors "REPL")
  (repl-out-color "輸出")
  (repl-value-color "值")
  (repl-error-color "錯誤")

  ;;; find/replace
  (search-next "下一個")
  (search-previous "上一個")
  (search-match "比對")  ;;; this one and the next one are singular/plural variants of each other
  (search-matches "比對項")
  (search-replace "取代")
  (search-skip "略過")
  (search-show-replace "顯示取代")
  (search-hide-replace "隱藏取代")
  (find-case-sensitive "區分大小寫")  ;; the check box in both the docked & undocked search
  (find-anchor-based "使用錨點搜尋")

  ;; these string constants used to be used by searching,
  ;; but aren't anymore. They are still used by other tools, tho.
  (hide "隱藏")
  (dock "停駐")
  (undock "取消停駐")

  ;;; multi-file-search
  (mfs-multi-file-search-menu-item "在檔案中搜尋(&F)…")
  (mfs-string-match/graphics "字串比對（可處理含圖形的檔案）")
  (mfs-regexp-match/no-graphics "正規表示式（僅限純文字檔）")
  (mfs-searching... "正在搜尋…")
  (mfs-configure-search "設定搜尋") ;; dialog title
  (mfs-files-section "檔案")   ;; section in config dialog
  (mfs-search-section "搜尋") ;; section in config dialog
  (mfs-dir "目錄")
  (mfs-recur-over-subdirectories "遞迴處理子目錄")
  (mfs-regexp-filename-filter "檔名正規表示式過濾器")
  (mfs-search-string "搜尋字串")
  (mfs-drscheme-multi-file-search "跨檔案搜尋 - DrRacket") ;; error message window title
  (mfs-not-a-dir "「~a」不是目錄")
  (mfs-open-file "開啟檔案")
  (mfs-stop-search "停止搜尋")
  (mfs-case-sensitive-label "區分大小寫")
  (mfs-no-matches-found "找不到相符項。")
  (mfs-search-interrupted "搜尋已中止。")
  ;; the ~a format specifier is filled in with the search string
  (mfs-drscheme-multi-file-search-title "針對「~a」的跨檔案搜尋 - DrRacket")

  ;;; reverting a file
  (are-you-sure-revert
   "確定要還原此檔案嗎？此變更無法復原。")
  (are-you-sure-revert-title
   "還原？")

  ;;; saving a file
  ; ~a is filled with the filename
  (error-saving "儲存錯誤") ;; title of error message dialog
  (error-saving-file/name "儲存 ~a 時發生錯誤。")
  (error-loading "載入錯誤")
  (error-loading-file/name "載入 ~a 時發生錯誤。")
  (unknown-filename "<< 未知 >>")

  ;;; finder dialog
  (must-specify-a-filename "你必須指定一個檔名")
  (file-does-not-exist "檔案「~a」不存在。")
  (ask-because-file-exists "檔案「~a」已存在。要取代嗎？")
  (dne-or-cycle "檔案「~a」包含不存在的目錄或循環。")
  (get-file "取得檔案")
  (put-file "儲存檔案")
  (full-pathname "完整路徑名稱")
  (show-dot-files "顯示以句點開頭的檔案與目錄。")
  (up-directory-button-label "上一層目錄")
  (add-button-label "新增") ;;; for multi-file selection
  (add-all-button-label "全部新增") ;;; for multi-file selection
  (remove-button-label "移除") ;;; for multi-file selection
  (file-wrong-form "該檔名的格式不正確。")
  (select-files "選擇檔案")
  (select-file "選擇檔案")
  (dir-dne "該目錄不存在。")
  (file-dne "該檔案不存在。")
  (empty-filename "檔名不可為空。")
  (that-is-dir-name "那是目錄名稱。")
  (use-platform-specific-file-dialogs "使用平台特定的檔案對話框") ;; a preferences option

  ;;; raw menu names -- these must match the
  ;;; versions below, once the &s have been stripped.
  ;;; if they don't, DrRacket's menus will appear
  ;;; in the wrong order.
  (file-menu "檔案(&F)")
  (edit-menu "編輯(&E)")
  (help-menu "說明(&H)")
  (windows-menu "視窗(&W)")
  (tabs-menu "分頁(&T)") ;; this is the name of the "Windows" menu under linux & windows

  ;;; menus
  ;;; - in menu labels, the & indicates a alt-key based shortcut.
  ;;; - sometimes, things are stuck in the middle of
  ;;; menu item labels. For instance, in the case of
  ;;; the "Save As" menu, you might see: "Save Definitions As".
  ;;; be careful of spacing, follow the English, if possible.
  ;;; - the ellipses in the `after' strings indicates that
  ;;; more information is required from the user before completing
  ;;; the command.

  (file-menu-label "檔案(&F)")

  (new-info  "開啟新檔案")
  (new-menu-item "新增(&N)")
  (new-...-menu-item "新增(&N)…")

  (open-info "從磁碟開啟檔案")
  (open-menu-item "開啟(&O)…")

  (open-recent-info "最近開啟的檔案清單")
  (open-recent-menu-item "開啟最近使用(&T)")

  (revert-info "將此檔案還原為磁碟上的版本")
  (revert-menu-item "還原(&R)")

  (save-info "將此檔案儲存到磁碟")
  (save-menu-item "儲存(&S)")

  (save-as-info "輸入檔名並將此檔案儲存到磁碟")
  (save-as-menu-item "另存新檔(&A)…")

  (print-info "將此檔案送至印表機")
  (print-menu-item "列印(&P)…")

  (page-setup-info "設定列印參數")
  (page-setup-menu-item "頁面設定…")

  (close-info "關閉此檔案")
  (close-menu-item "關閉(&C)")
  (close-window-menu-item "關閉視窗(&C)")

  (quit-info "關閉所有視窗")
  (quit-menu-item-windows "離開(&X)")
  (quit-menu-item-others "結束(&Q)")

  (edit-menu-label "編輯(&E)")

  (undo-info "復原最近一次的動作")
  (undo-menu-item "復原(&U)")

  (redo-info "重做最近一次的復原")
  (redo-menu-item "重做(&R)")

  (cut-info "將選取項目移至剪貼簿以供稍後貼上")
  (cut-menu-item "剪下(&T)")

  (copy-info "將選取項目複製到剪貼簿以供稍後貼上")
  (copy-menu-item "複製(&C)")

  (paste-info "貼上最近複製或剪下的項目，取代所選內容")
  (paste-menu-item "貼上(&P)")
  (paste-and-indent-menu-item "貼上並縮排")

  (clear-info "刪除所選項目，不影響剪貼簿或貼上")
  (clear-menu-item-windows "刪除(&D)")

  (select-all-info "選取整份文件")
  (select-all-menu-item "全選(&L)")

  (find-menu-item "尋找") ;; menu item
  (find-from-selection-menu-item "從選取範圍尋找(&E)")
  (find-info "切換搜尋視窗與被搜尋視窗之間的鍵盤焦點")

  (find-next-info "移至尋找視窗中該字串的下一個出現處")
  (find-next-menu-item "尋找下一個")

  (find-previous-info "移至尋找視窗中該字串的上一個出現處")
  (find-previous-menu-item "尋找上一個")

  (show-replace-menu-item "顯示取代")
  (hide-replace-menu-item "隱藏取代")
  (show/hide-replace-info "切換取代面板的可見狀態")

  (replace-menu-item "取代")
  (replace-info "取代深色圓中的搜尋結果")

  (replace-all-info "取代該搜尋字串的所有出現處")
  (replace-all-menu-item "全部取代")

  (find-case-sensitive-info "切換大小寫敏感/不敏感搜尋")
  (find-case-sensitive-menu-item "大小寫相符搜尋")

  (complete-word "補完單字") ; the complete word menu item in the edit menu
  ; shows up in the completions menu when there are no completions (in italics)
  (no-completions "… 無可用補完")

  (overwrite-mode "改寫模式")
  (enable-overwrite-mode-keybindings "啟用改寫模式快捷鍵")

  (enable-automatic-parens "啟用自動插入括號、方括號與引號")

  (preferences-info "設定你的偏好設定")
  (preferences-menu-item "偏好設定…")

  (keybindings-info "顯示目前啟用的快捷鍵")
  (keybindings-menu-item "快捷鍵")
  (keybindings-show-active "顯示啟用中的快捷鍵")
  (keybindings-frame-title "快捷鍵")
  (keybindings-sort-by-name "依名稱排序")
  (keybindings-sort-by-key "依按鍵排序")
  (keybindings-add-user-defined-keybindings "加入使用者自訂快捷鍵…")
  (keybindings-add-user-defined-keybindings/planet "從 PLaneT 加入使用者自訂快捷鍵…")
  (keybindings-menu-remove "移除 ~a")
  (keybindings-choose-user-defined-file "請選擇包含快捷鍵的檔案。")
  ; the string will be what the user typed in
  (keybindings-planet-malformed-spec "PLaneT 規格格式不正確：~a")
  (keybindings-type-planet-spec "請輸入 PLaneT 的 require 規格（不含 `require'）")

  ; first ~a will be a string naming the file or planet package where the keybindings come from;
  ; second ~a will be an error message
  (keybindings-error-installing-file "安裝快捷鍵 ~a 時發生錯誤：\n\n~a")

  (user-defined-keybinding-error "執行快捷鍵 ~a 時發生錯誤\n\n~a")
  (user-defined-keybinding-malformed-file
   "檔案 ~a 不包含以 framework/keybinding-lang 撰寫的模組。")
  (user-defined-keybinding-malformed-file/found-lang
   "檔案 ~a 不包含以 framework/keybinding-lang 撰寫的模組。"
   " 發現的語言為 ~s。")

  ;; menu items in the "special" menu
  (insert-text-box-item "插入文字方塊")
  (insert-image-item "插入圖片…")
  (insert-comment-box-menu-item-label "插入註解方塊")
  (insert-lambda "插入 λ")

  (wrap-text-item "自動換行")

  ;; windows menu
  (windows-menu-label "視窗(&W)")
  (tabs-menu-label "分頁(&T)") ;; this is the name of the menu under linux & windows
  (minimize "最小化") ;; minimize and zoom are only used under mac os x
  (zoom "縮放")
  (bring-frame-to-front "將視窗置於最前")       ;;; title of dialog
  (bring-frame-to-front... "將視窗置於最前…") ;;; corresponding title of menu item
  (most-recent-window "最近的視窗")
  (next-tab "下一個分頁")
  (prev-tab "上一個分頁")
  (move-current-tab-right "分頁向右移(&R)")
  (move-current-tab-left "分頁向左移(&L)")
  ;; menu item in the windows menu under mac os x. first ~a is filled
  ;; with anumber between 1 and 9; second one is the filename of the tab
  (tab-i "分頁 ~a：~a")
  (tab-i/no-name "分頁 ~a")
  (last-tab "最後分頁：~a")

  (view-menu-label "檢視(&V)")
  (show-overview "顯示程式輪廓(&P)")
  (hide-overview "隱藏程式輪廓(&P)")
  (show-module-browser "顯示模組瀏覽器(&M)")
  (hide-module-browser "隱藏模組瀏覽器(&M)")

  (help-menu-label "說明(&H)")
  (about-info "本應用程式的鳴謝與詳細資訊")
  (about-menu-item "關於…")

  ;; open here's new menu item
  (create-new-window-or-clear-current
   "要建立新視窗，或清除此視窗？")
  (clear-current "清除此視窗")
  (new-window "新視窗")

  ;; popup menu when right-clicking in the gap between
  ;; the definitions and interactions window
  (change-to-vertical-alignment "改為垂直排列")
  (change-to-horizontal-alignment "改為水平排列")

  ;;; exiting and quitting ``are you sure'' dialog
  ;;; exit is used on windows, quit on macos, in English. Other
  ;;; languages probably use the same word on both platforms.
  (exit "離開")
  (quit "結束")
  (are-you-sure-exit "確定要離開嗎？")
  (are-you-sure-quit "確定要結束嗎？")
  ; these next two are only used in the quit/exit dialog
  ; on the button whose semantics is "dismiss this dialog".
  ; they are there to provide more flexibility for translations
  ; in English, they are just cancel.
  (dont-exit "取消")
  (dont-quit "取消")

  ;;; autosaving
  (error-autosaving "自動儲存「~a」時發生錯誤。") ;; ~a will be a filename
  (autosaving-turned-off "自動儲存已關閉\n直到檔案被儲存。")
  (recover-autosave-files-frame-title "復原檔案")
  (autosave-details "詳細資料")
  (autosave-recover "復原")
  (autosave-unknown-filename "<<未知>>")

  ;;; autoloading
  ;; the ~a is replaced with a path
  (autoload-file-changed-on-disk/with-name
   "檔案：\n  ~a\n已在磁碟上變更。是否要"
   " 將緩衝區內容還原為與磁碟上的檔案一致？")
  ;; One file per line is appended to the end of this message
  (autoload-files-changed-on-disk/with-name
   "有些檔案已在磁碟上變更。是否要將它們的"
   " 緩衝區內容還原為與磁碟上的檔案一致？\n\n已變更的檔案：")
  ;; the ~a is replaced with a path
  (autoload-file-changed-on-disk-editor-dirty/with-name
   "檔案：\n  ~a\n已在磁碟上變更，且在編輯器中也有修改。"
   " 是否要將緩衝區內容還原為與磁碟上的檔案一致？")
  ;; One file per line is appended to the end of this message
  (autoload-files-changed-on-disk-editor-dirty/with-name
   "有些檔案已在磁碟上變更，且在編輯器中也有修改。"
   " 是否要將它們的緩衝區內容還原為與磁碟上的檔案一致？"
   "\n\n已變更的檔案：")
  ;; One file per line is appended to the end of this message
  (autoload-files-changed-on-disk-editor-dirty&clean/with-name
   "有些檔案已在磁碟上變更，其中部分也在編輯器中被修改。"
   " 是否要將它們的緩衝區內容還原為與磁碟上的檔案一致？"
   "\n\n已變更的檔案（◇ 表示編輯器中的版本已修改）：")
  ;; a specialized version of dont-ask-again-always-current
  (dont-ask-again-always-current/clean-buffer
   "對於沒有未儲存編修的檔案不再詢問（一律使用目前選擇）")

  (autoload-automatically-reload "自動重新載入已變更的檔案")
  (autoload-when-the-editor-isnt-dirty "當編輯器未被修改時")
  (autoload-never-revert "永不")
  (autoload-ask-about-reverting "每次詢問")

  ;; these are labels in a dialog that drscheme displays
  ;; if you have leftover autosave files. to see the dialog,
  ;; start up drscheme and modify (but don't save) a file
  ;; (also, do this with an unsaved file). Wait for the autosave
  ;; files to appear (typically 5 minutes). Kill DrRacket
  ;; and restart it. You'll see the dialog
  (autosave-autosave-label: "備份檔案：")
  (autosave-original-label: "原始檔案：")
  (autosave-autosave-label "備份檔案")
  (autosave-original-label "原始檔案")
  (autosave-compare-files "比較備份檔案")

  (autosave-show-autosave "備份檔案") ;; title of a window showing the autosave file

  (autosave-explanation "DrRacket 發現備份檔案，可能包含你未儲存的工作。")

  (autosave-recovered! "已復原！") ;; status of an autosave file
  (autosave-deleted "已刪除")       ;; status of an autosave file

  ;; first is a filename, second is an error message from racket.
  (autosave-error-deleting "刪除 ~a 時發生錯誤\n\n~a")
  (autosave-delete-button "刪除")
  (autosave-delete-title "刪除")  ;; title of a dialog asking for deletion confirmation
  (autosave-done "完成")

  ;; appears in the file dialog
  (autosave-restore-to-where? "選擇儲存備份檔案的位置。")

  ;;; file modified warning
  (file-has-been-modified
   "該檔案自上次儲存後已被修改。要覆寫這些修改嗎？")
  (overwrite-file-button-label "覆寫")

  (definitions-modified
    "定義文字已在檔案系統中被修改；"
    " 請儲存或還原定義文字。")

  ;; for a dialog that appears when Run is clicked and there are unsaved files
  ; the ~a is filled with a filename (same string that appears in a tab)
  (one-file-not-saved-do-the-save?
   "檔案「~a」尚未儲存；在執行前先儲存嗎？")
  ; the string is suffixed with a list of filenames (which are separated by newlines)
  (many-files-not-saved-do-the-save?
   "其他一些檔案尚未儲存；在執行前先儲存它們嗎？\n\n檔案：")
  ; button label to go ahead with saving
  (save-all-files "全部儲存檔案")
  ; check box in the dialog and also used in the preferences dialog
  (save-after-switching-tabs "切換分頁或視窗時自動儲存檔案")
  (dont-ask-about-saving-after-switching-tabs
   "按下執行且有未儲存分頁或視窗時，不要詢問也不要儲存")
  
  (drscheme-internal-error "DrRacket 內部錯誤")

  ;;; tools
  (invalid-tool-spec
   "集合 ~a 的 info.rkt 檔案中的工具規格無效。"
   " 預期為字串或非空的字串清單，收到：~e")
  (error-invoking-tool-title "呼叫工具 ~s 時發生錯誤；~s")
  ;; ~s filled with a path, ~a filled with an error message from an exn
  (error-loading-tool-title "載入工具 ~s 時發生錯誤\n~a")
  (tool-tool-names-same-length
   "預期 `tool-names' 與 `tools' 為相同長度的清單，"
   " 在 ~s 的 info.rkt 中卻得到 ~e 與 ~e")
  (tool-tool-icons-same-length
   "預期 `tool-icons' 與 `tools' 為相同長度的清單，"
   " 在 ~s 的 info.rkt 中卻得到 ~e 與 ~e")
  (tool-tool-urls-same-length
   "預期 `tool-urls' 與 `tools' 為相同長度的清單，"
   " 在 ~s 的 info.rkt 中卻得到 ~e 與 ~e")
  (error-getting-info-tool
   "載入 ~s 的 info.rkt 檔案時發生錯誤")
  (tool-error-phase1 "工具 ~s 的第 1 階段錯誤；~s")
  (tool-error-phase2 "工具 ~s 的第 2 階段錯誤；~s")
  ;; tool preferences panel
  (tool-config-changes
   "變更工具設定將於下次啟動 DrRacket 時生效。")
  (installed-tools "已安裝的工具")
  (tool-prefs-panel-tool:-label "工具： ")
  (tool-prefs-panel-title "工具")
  (load-tool-when-drracket-starts? "在 DrRacket 啟動時載入此工具？")
  (load-tool-load "載入此工具")
  (load-tool-skip "略過此工具")
  (unnamed-tool "未命名工具 ~a")
  (note-that-tool-loaded "（已載入）")
  (note-that-tool-was-skipped "（已略過）")
  (note-that-tool-failed-to-load "（載入失敗）")

  ;;; define popup menu
  (end-of-buffer-define "<< 緩衝區結尾 >>")
  (sort-by-name "依名稱排序")
  (sort-by-position "依檔案位置排序")
  (no-definitions-found "<< 找不到定義 >>")
  (jump-to-defn "跳至 ~a 的定義")
  (define-menu-configure "設定") ;; label of a submenu to configure the (define ...) popup menu

  (recent-items-sort-by-age "依時間排序")
  (recent-items-sort-by-name "依名稱排序")

  ;;; view menu
  (hide-definitions-menu-item-label "隱藏定義(&D)")
  (show-definitions-menu-item-label "顯示定義(&D)")
  (definitions-menu-item-help-string "顯示/隱藏定義視窗")
  (show-interactions-menu-item-label "顯示互動(&I)")
  (hide-interactions-menu-item-label "隱藏互動(&I)")
  (use-horizontal-layout "使用水平版面配置")
  (use-vertical-layout "使用垂直版面配置")
  (interactions-menu-item-help-string "顯示/隱藏互動視窗")
  (toolbar "工具列")
  (toolbar-on-top "工具列置頂")
  (toolbar-on-top-no-label "工具列置頂（小按鈕）")
  (toolbar-on-left "工具列置左")
  (toolbar-on-right "工具列置右")
  (toolbar-hidden "隱藏工具列")

  ;;; file menu
  (save-definitions-as "儲存定義 另存新檔(&A)…")
  (save-definitions "儲存定義")
  (print-definitions "列印定義…")
  (about-drscheme "關於 DrRacket")
  (save-other "儲存其他")
  (save-definitions-as-text "將定義儲存為純文字…")
  (save-interactions "儲存互動")
  (save-interactions-as "將互動另存新檔…")
  (save-interactions-as-text "將互動儲存為純文字…")
  (print-interactions "列印互動…")
  (new-tab "新分頁")
  (close-tab "關閉分頁") ;; must not have any &s in it.
   ;; like close-tab, but with an ampersand on the same letter as the one in close-menu-item
  (close-tab-amp "關閉分頁(&C)")
  (reopen-closed-tab "重新開啟已關閉分頁")
  
  ;;; edit menu
  (split-menu-item-label "分割(&S)")
  (collapse-menu-item-label "摺疊(&O)")
  (find-longest-line "尋找最長列")

  ;;; language menu
  (language-menu-name "語言(&L)")

  ;;; scheme-menu
  (scheme-menu-name "Ra&cket")
  (execute-menu-item-label "執行")
  (execute-menu-item-help-string "在定義視窗重新啟動程式")
  (ask-quit-menu-item-label "要求程式結束")
  (ask-quit-menu-item-help-string
   "使用 break-thread 停止目前求值的主要執行緒")
  (force-quit-menu-item-label "強制程式結束")
  (force-quit-menu-item-help-string "使用 custodian-shutdown-all 中止目前的求值")
  (limit-memory-menu-item-label "限制記憶體…")
  (limit-memory-msg-1 "此限制將於下次執行程式時生效，")
  (limit-memory-msg-2 "且至少需為 8 兆位元組。")
  (limit-memory-unlimited "不限制")
  (limit-memory-limited "有限制")
  (limit-memory-megabytes "MB")
  ; the next two constants are used together in the limit memory dialog; they are inserted
  ; one after another. The first one is shown in a bold font and the second is not.
  ; (the first can be the empty string)
  (limit-memory-warning-prefix "警告：")
  (limit-memory-warning
   "不限制記憶體的設定並不安全。使用此設定時，"
   " DrRacket 無法防止程式過度配置記憶體，可能導致 DrRacket 當機。")

  (clear-error-highlight-menu-item-label "清除錯誤染色標示")
  (clear-error-highlight-item-help-string "移除粉紅色的錯誤染色標示")
  (jump-to-next-error-highlight-menu-item-label "跳至下一個錯誤染色標示")
  (jump-to-prev-error-highlight-menu-item-label "跳至上一個錯誤染色標示")
  (reindent-menu-item-label "重新縮排(&R)")
  (reindent-all-menu-item-label "重新縮排全部(&A)")
  (semicolon-comment-out-menu-item-label "以分號註解(&C)")
  ;; the ~a is filled with the characters that'll be used to comment out a line,
  ;; inserted at the start of the line
  (comment-out-with-line-start "以「~a」註解(&C)")
  ;; the two '~a's are filled with the characters that'll be used to comment out
  ;; the start and end of a region
  (comment-out-with-region "以「~a」與「~a」註解區塊(&C)")
  (box-comment-out-menu-item-label "以方框註解(&B)")
  (uncomment-menu-item-label "取消註解(&U)")

  (convert-to-semicolon-comment "轉換為分號註解")

  ;;; executables
  (create-executable-menu-item-label "建立可執行檔(&E)…")
  (create-executable-title "建立可執行檔")
  (drracket-creates-executables-only-in-some-languages
   "在 DrRacket 建立可執行檔僅支援以下情況："
   " 於語言對話框選擇教材語言（DMdA 或 HtDP），或"
   " 於語言對話框選擇「The Racket Language」且你的程式開頭的 #lang 行"
   " 指定了語言。\n\n可考慮改用命令列工具 raco exe。")
  (must-save-before-executable "建立可執行檔之前必須先儲存程式。")
  (save-a-mred-launcher "儲存 GRacket 啟動器")
  (save-a-mzscheme-launcher "儲存 Racket 啟動器")
  (save-a-mred-stand-alone-executable "儲存 GRacket 獨立可執行檔")
  (save-a-mzscheme-stand-alone-executable "儲存 Racket 獨立可執行檔")
  (save-a-mred-distribution "儲存 GRacket 發行套件")
  (save-a-mzscheme-distribution "儲存 Racket 發行套件")
  ;; this is suffixed with an error message ala error-display-handler
  (error-creating-executable "建立可執行檔發生錯誤：")

  (definitions-not-saved
    "定義視窗尚未儲存。可執行檔將使用定義視窗最新一次儲存的版本。是否繼續？")
  ;; The "-explanatory-label" variants are the labels used for the radio buttons in
  ;;  the "Create Executable..." dialog for the "(module ...)" language.
  (launcher "啟動器")
  (launcher-explanatory-label "啟動器（僅限此機器，從原始碼執行）")
  (stand-alone "獨立")
  (stand-alone-explanatory-label "獨立（僅限此機器，執行已編譯副本）")
  (distribution "發行")
  (distribution-explanatory-label "發行（供安裝於其他機器）")
  (embed-dlls? "是否將 DLL 內嵌至可執行檔？") ;; appears in the GUI only under windows
  (executable-type "類型")
  (executable-base "基底")
  (filename "檔名： ")
  (create "建立")
  (files-for-icons-etc "圖示等檔案")
  (please-specify-a-filename "請指定要建立的檔名。")
  (~a-must-end-with-~a
   "~a 檔名\n\n  ~a\n\n不合法。檔名必須以「.~a」結尾。")
  (macosx-executables-must-end-with-app
   "The filename\n\n  ~a\n\nis illegal. Under Mac OS, an executable"
   " must be a directory whose name ends with .app.")
  (warning-directory-will-be-replaced
   "警告：目錄：\n\n  ~a\n\n將被取代。要繼續嗎？")

  (distribution-progress-window-title "發行進度")
  (creating-executable-progress-status "正在建立用於發行的可執行檔…")
  (assembling-distribution-files-progress-status "正在組裝發行所需檔案…")
  (packing-distribution-progress-status "正在封裝發行套件…")

  (create-servlet "建立 Servlet…")

  ; the ~a is a language such as "module" or "algol60"
  (create-servlet-unsupported-language
   "建立 Servlet 不支援 ~a 語言。")

  ;;; buttons
  (execute-button-label "執行")
  (execute-button-configure-label "設定執行")
  (save-button-label "儲存")
  (break-button-label "停止")
  (break-button-kill-label "強制中止")

  ;;; search help desk popup menu
  (search-help-desk-for "在說明中心搜尋「~a」")
  (exact-lucky-search-help-desk-for "在說明中心進行精確幸運搜尋「~a」")

  ;; collapse and expand popup menu items
  (collapse-sexp "摺疊 S-運算式")
  (expand-sexp "展開 S-運算式")

  ;;; fraction dialog
  (enter-fraction "輸入分數")
  (whole-part "整數部分")
  (numerator "分子")
  (denominator "分母")
  (insert-number/bad-whole-part "整數部分必須是整數")
  (insert-number/bad-numerator
   "分子必須是非負整數")
  (insert-number/bad-denominator
   "分母必須是正整數")
  (insert-fraction-menu-item-label "插入分數…")

  ;; number snip popup menu
  (show-decimal-expansion "檢視小數展開")
  (show-mixed-fraction-view "以帶分數檢視")
  (show-improper-fraction-view "以假分數檢視")
  (show-more-decimal-places "顯示更多小數位數")

  ;;; Teachpack messages
  (select-a-teachpack "選擇教材包")
  (clear-teachpack "清除 ~a 教材包")
  (teachpack-error-label "DrRacket - 教材包錯誤")
  (teachpack-didnt-load "教材包檔案 ~a 未正確載入。")
  (add-teachpack-menu-item-label "加入教材包…")
  (clear-all-teachpacks-menu-item-label "清除所有教材包")
  (drscheme-teachpack-message-title "DrRacket 教材包")
  (already-added-teachpack "已加入 ~a 教材包")

  ; ~a is filled with the teachpack's name; the message appears in the
  ; teachpack selection dialog when a user installs a new teachpack
  (compiling-teachpack "正在編譯 ~a 教材包…")
  (teachpack-pre-installed "預先安裝的教材包")
  (teachpack-pre-installed/htdp "預先安裝的 HtDP 教材包")
  (teachpack-pre-installed/2htdp "預先安裝的 HtDP/2e 教材包")
  (teachpack-user-installed "使用者安裝的教材包")
  (add-teachpack-to-list... "加入教材包至清單…")
  ; first and second ~a are teachpack names, third is a symbol identifing an export
  (teachpack-conflict
   "警告：已安裝的教材包 ~a 與 ~a 發生衝突（匯出 ~a 同時存在於兩者）")
  ;; a button label; the two ~a are filled with teachpack names
  (remove-and-add-teachpack "移除 ~a 並加入 ~a")
  (teachpack-already-installed
   "名稱為「~a」的教材包已安裝。要覆寫嗎？")
  ; ~a is filled with a list of language names. Each name is separated
  ; by a newline and is indented two spaces (no commas, no 'and')
  (teachpacks-only-in-languages
   "教材包選單僅在以下語言可用：~a\n\n在其他語言中，請改用 'require'。")


  ;;; Language dialog
  (introduction-to-language-dialog
   "請選擇一種語言。大多數入門課程的學生應使用預設語言。")
  (language-dialog-title "選擇語言")
  (case-sensitive-label "區分大小寫")
  (output-style-label "輸出樣式")
  (constructor-printing-style "Constructor")
  (quasiquote-printing-style "Quasiquote")
  (write-printing-style "write")
  (print-printing-style "print")
  (true-false-empty-style-label "常數樣式")
  (true-false-empty-style-read "#true #false '()") ; 這是程式碼不要翻譯
  (true-false-empty-style-ids "true false empty") ; 這是程式碼不要翻譯
  (sharing-printing-label "在值中顯示共享結構")
  (use-pretty-printer-label "在輸出值中插入換行")
  (input-syntax "輸入語法")
  (dynamic-properties "動態屬性")
  (output-syntax "輸出語法")
  (teachpacks "教材包") ;; label in the language dialog for the teaching languages
  (teachpacks-none "<< 無 >>") ;; shows up under the previous string, when there are no teachpacks
  (no-debugging-or-profiling "不除錯也不效能分析")
  (debugging "除錯")
  (debugging-and-profiling "除錯與效能分析")
  (test-coverage "語法測試套件涵蓋率")
  (show-details-button-label "顯示詳細資訊")
  (hide-details-button-label "隱藏詳細資訊")
  (choose-language-menu-item-label "選擇語言…")
  (revert-to-language-defaults "還原語言預設值")
  (fraction-style "分數樣式")
  (use-mixed-fractions "使用帶分數")
  (use-repeating-decimals "使用循環小數")
  (decimal-notation-for-rationals "對有理數使用小數表示")
  (enforce-primitives-group-box-label "初始繫結")
  (enforce-primitives-check-box-label "不允許重新定義初始繫結")
  (automatically-compile "填入 “compiled” 目錄（以加快載入）")
  (preserve-stacktrace-information "保留堆疊追蹤（停用部分最佳化）")
  (enforce-module-constants-checkbox-label "強制常數定義（啟用部分內嵌）")
  (expression-level-stacktrace "運算式層級堆疊追蹤")
  (function-level-stacktrace "函式層級堆疊追蹤")
  (submodules-to-run "要執行的子模組")
  (add-submodule "新增子模組選項…") ;; menu item
  (add-submodule-title "新增子模組") ;; title of dialog opened by above menu item


  ; used in the bottom left of the drscheme frame
  ; used the popup menu from the just above; greyed out and only
  ; visible when some languages are in the history
  (recent-languages "最近使用的語言：")
  ; shows up in bottom-left programming language menu popup, when no langs are recorded
  (no-recently-chosen-languages "沒有最近選擇的語言")

  ;; startup wizard screen language selection section
  (please-select-a-language "請選擇一種語言")


  ;;; languages
  (beginning-one-line-summary "define、cond、結構、常數與原始運算元")
  (beginning/abbrev-one-line-summary "初學者；REPL 以清單風格列印")
  (intermediate-one-line-summary "初學者加上詞法作用域")
  (intermediate/lambda-one-line-summary "中階加上高階函式")
  (advanced-one-line-summary "中階加上 lambda 與可變動作")
  (pretty-big-scheme "Pretty Big")
  (pretty-big-scheme-one-line-summary
   "加入 HtDP 語言、mzscheme 與 mred/mred 的語法與函式")
  (r5rs-language-name "R5RS")
  (r5rs-one-line-summary "R5RS，無額外擴充")
  (expander "展開器")
  (expander-one-line-summary "將運算式展開而非求值")
  (legacy-languages "舊版語言")
  (teaching-languages "教材語言")
  (experimental-languages "實驗性語言")
  (initial-language-category "起始語言")
  (no-language-chosen "未選擇語言")
  (other-languages "其他語言")

  (module-language-name "依來源決定語言")
  (module-language-one-line-summary "由 #lang 行指定實際語言")
   ;; shows up in the details section of the module language
  (module-language-auto-text "自動 #lang 行")
  (module-language-auto-text-most-recent "最近使用的 #lang 行")
  ; to the right of this string is a text entry field whose content is the #lang line that'll be used.
  (module-language-auto-text-always-same "一律使用相同的 #lang 行：")
  ;; the next four string constants show up in the REPL in DrRacket in the "Racket Language",
  ;; which is also the "Determine language from source" language. They are put right after the name
  ;; of the language from the "#lang" line at the beginning of the source file
  (module-language-repl-no-annotations "")
  (module-language-repl-debug-annotations ", 含除錯")
  (module-language-repl-debug/profile-annotations ", 含除錯與效能分析")
  (module-language-repl-test-annotations ", 含測試涵蓋率")

  (module-language-#lang-error-more-information "更多資訊")
  (module-language-#lang-flush-cache "重新載入")
  (module-language-#lang-flush-cache-menu-item "重新載入 #lang 擴充")

  ;; for the upper portion of the language dialog
  (the-racket-language "The Racket Language")
  (choose-a-language "選擇語言")

  ;; the next two string constants appear in the
  ;; language dialog with a list
  ;; of example languages appearing between them
  (racket-language-discussion
   "請在程式開頭以 #lang 指定所需的方言。例如：\n\n")
  (racket-language-discussion-end "\n… 以及更多")

  ;; the next three string constants are put into a message-box dialog
  ;; that appears when the user clicks on the example #lang languages
  ;; in the language dialog. The first one always appears and then either
  ;; the second or the third appears. The second one has the clicked
  ;; on #lang line placed into the ~a, and third one has the
  ;; current #lang line in the first ~a and the clicked on in the second one.
  ;; The two comments are separated by a blank line.
  (racket-dialect-in-buffer-message
   "Racket 方言通常直接在緩衝區中指定，"
   " 而不是透過語言對話框選擇這些項目。")
  (racket-dialect-add-new-#lang-line
   "即便如此，要我將「~a」加入到定義視窗的開頭嗎？")
  (racket-dialect-replace-#lang-line
   "即便如此，我看到你的檔案中已有「~a」；要將它取代為「~a」嗎？")
  (racket-dialect-already-same-#lang-line
   "看起來你的檔案中已經有「~a」了；"
   " 你可以開始撰寫程式！")

  ;; in the dialog containing the above strings, one of these is a button that appears
  (add-#lang-line "新增 #lang 行")
  (replace-#lang-line "取代 #lang 行")

  ;; for the 'new drracket user' dialog
  (use-language-in-source "使用原始碼中宣告的語言")

  ;;; from the `not a language language' used initially in drscheme.
  (must-choose-language "你必須選擇一種程式語言，DrRacket 才能處理程式。")

  ; next two appear before and after the name of a text book (which will be in italics)
  (using-a-textbook-before "使用 ")
  (using-a-textbook-after "？")

  ; next two are before and after a language
  (start-with-before "從 ")
  (start-with-after "")

  (seasoned-plt-schemer? "資深 PLT Schemer？")
  (racketeer? "你是 Racketeer 嗎？")
  (looking-for-standard-scheme? "在找標準 Scheme 嗎？")

  ; the three string constants are concatenated together and the middle
  ; one is hyperlinked to the dialog that suggests various languages
  (get-guidance-before "請從「語言」選單選擇「選擇語言…」，或 ")
  (get-guidance-during "取得指引")
  (get-guidance-after "。")

  ;;; debug language
  (unknown-debug-frame "[未知]")
  (backtrace-window-title "回溯追蹤 - DrRacket")
  (files-interactions "~a 的互動") ;; filled with a filename
  (current-interactions "互動")
  (current-definitions "定義")
  (mzscheme-w/debug "文字介面（MzScheme，含 R5RS）")
  (mzscheme-one-line-summary "PLT 的 Scheme 實作")
  (mred-w/debug "圖形介面（MrEd，含 MzScheme）")
  (mred-one-line-summary "為 MzScheme 加入 GUI 支援")

  ;; profiling
  (profiling-low-color "低")
  (profiling-high-color "高")
  (profiling-choose-low-color "請選擇低色值")
  (profiling-choose-high-color "請選擇高色值")
  (profiling "效能分析")
  (profiling-example-text "(define (whee) (whee))")
  (profiling-color-config "效能分析色彩範圍")
  (profiling-scale "效能分析色彩尺度")
  (profiling-sqrt "平方根")
  (profiling-linear "線性")
  (profiling-square "平方")
  (profiling-number "呼叫次數")
  (profiling-time "累計時間")
  (profiling-update "更新分析結果")
  (profiling-col-percent-time "% 時間")
  (profiling-col-function "函式")
  (profiling-col-time-in-msec "毫秒")
  (profiling-col-calls "呼叫次數")
  (profiling-show-profile "顯示分析")
  (profiling-hide-profile "隱藏分析")
  (profiling-unknown-src "<< 未知 >>")
  (profiling-no-information-available
   "沒有可用的效能分析資訊。請確認語言已啟用效能分析，且你已執行程式。")
  (profiling-clear?
   "變更定義視窗會使效能分析資訊失效。要繼續嗎？")

  ;; test coverage
  (test-coverage-clear?
   "變更定義視窗會使測試涵蓋率資訊失效。要繼續嗎？")
  (test-coverage-clear-and-do-not-ask-again "是，且不要再詢問")
  (test-coverage-ask? "詢問是否清除測試涵蓋率")
  (test-coverage-entirely-covered "所有運算式皆被涵蓋")
  (test-coverage-next-time-check-box "下次顯示？")
  (test-coverage-summary "顯示測試涵蓋率摘要")

  (test-coverage-on "已涵蓋的測試")
  (test-coverage-off "未涵蓋的測試")

  ;; tracing
  (tracing-enable-tracing "啟用追蹤")
  (tracing-show-tracing-window "顯示追蹤")
  (tracing-hide-tracing-window "隱藏追蹤")
  (tracing-tracing-nothing-to-show
   "目前沒有可用的追蹤結果。（請確認你的語言支援追蹤，且追蹤已啟用。）")

  ;;; repl stuff
  (evaluation-terminated "求值已終止")
  (evaluation-terminated-explanation
   "求值執行緒已終止，直到下次執行前無法進行求值。")

  ; The next three constants show up in the same dialog as the above evaluation-terminated string
  ; constants.
  ; The first two show up only when the user calls 'exit' (possibly with a status code).
  ; The third shows up when the program runs out of memory.
  (exited-successfully "已成功結束。")
  ;; ~a is filled in with a number between 1 and 255
  (exited-with-error-code "以錯誤碼 ~a 結束。")
  (program-ran-out-of-memory "程式的記憶體已耗盡。")

  (show-evaluation-terminated-dialog "顯示「求值已終止」對話框")
  (evaluation-terminated-ask "下次顯示此對話框")

  (last-stack-frame "顯示最後一個堆疊幀")
  (last-stack-frames "顯示最後 ~a 個堆疊幀")
  (next-stack-frames "顯示接下來的 ~a 個堆疊幀")
  (more-stack-frames "顯示更多堆疊幀")

  ;;; welcoming message in repl
  (language "語言")
  (custom "自訂")
  (teachpack "教材包")
  (welcome-to "歡迎使用")
  (version "版本")
  ;; The following is shown on 2nd line of welcome message in repl.
  ;; It is concatenated at end of: "language": LANGUAGE "; memory limit:" LIMIT
  ;; therefore you get to decide punctuation for your language here
  (memory-limit "；記憶體限制：")

  ;;; kill evaluation dialog
  (kill-evaluation? "要強制終止求值嗎？")
  (just-break "僅中斷")
  (kill "強制終止")
  (kill? "要強制終止嗎？")

  ;;; version checker
  (version:update-menu-item   "檢查更新…")
  (version:update-check       "檢查更新") ; dialog title, with the next line
  (version:connecting-server  "正在連線至 Racket 版本伺服器")
  (version:results-title      "Racket 版本檢查")
  (version:do-periodic-checks "定期檢查是否有較新的 Racket 版本")
  (version:take-me-there      "前往下載頁面") ; ...to the download website
  ;; the next one can appear alone, or followed by a comma and the one after that
  (version:plt-up-to-date     "你的 Racket 版本已是最新")
  (version:but-newer-alpha    "但注意有較新的 alpha 釋出")
  ;; This is used in this context: "Racket vNNN <<<*>>> http://download..."
  (version:now-available-at   "現已可於以下位置取得：")

  ;; insert menu
  (insert-menu "插入(&I)")

  ;; large semi colon letters
  (insert-large-letters... "插入大型字母…")
  (large-semicolon-letters "大型分號字母")
  (text-to-insert "要插入的文字")

  (module-browser-filename-format "完整檔名：~a（~a 行）")
  (module-browser-root-filename "根檔名：~a")
  (module-browser-font-size-gauge-label "字型大小")
  (module-browser-progress-label "模組瀏覽器進度")
  (module-browser-adding-file "新增檔案：~a…")
  (module-browser-laying-out-graph-label "佈局圖形")
  (module-browser-open-file-format "開啟 ~a")
  (module-browser "模組瀏覽器") ;; frame title
  (module-browser... "模組瀏覽器(&M)…") ;; menu item title
  (module-browser-in-file "在 ~a 的模組瀏覽器(&O)") ;; menu item title; ~a is filled with a filename
  ;; menu item title for above menu item; used when there is no saved file
  (module-browser-no-file "此已儲存檔案的模組瀏覽器")
  (module-browser-error-expanding "展開程式時發生錯誤：\n\n~a")
  (module-browser-show-lib-paths "顯示由 (lib ..) 路徑載入的檔案")
  (module-browser-progress "模組瀏覽器：~a") ;; prefix in the status line
  (module-browser-compiling-defns "模組瀏覽器：正在編譯定義")
  ;; check box label in show module browser pane in drscheme window.
  (module-browser-show-lib-paths/short "追蹤 lib 的 require")
  ;; check box label in show module browser pane in drscheme window.
  (module-browser-show-planet-paths/short "追蹤 PLaneT 的 require")
  (module-browser-refresh "重新整理") ;; button label in show module browser pane in drscheme window.
  ;; used to search in the graph; the label on a text-field% object
  (module-browser-highlight "染色標示")
  (module-browser-only-in-plt-and-module-langs
   "模組瀏覽器僅適用於以模組（module）為基礎的程式。")
  (module-browser-name-length "名稱長度")
  (module-browser-name-short "短")
  (module-browser-name-medium "中")
  (module-browser-name-long "長")
    ;; like 'Long' but shows the phases where this file is loaded
  (module-browser-name-very-long "長（含階段）")
  (module-browser-open-all "開啟此處顯示的所有檔案")
  (module-browser-main-collects "主要程式集")
  (module-browser-unknown-pkg "未知套件")
  (module-browser-visible-pkgs "可見套件")
  (module-browser-visible-submodules "可見子模組")
  (module-browser-top-level-module "最上層模組") ; in the "which submodules?" filter; this is used for when there are no submodules

  (happy-birthday-matthias "Matthias 生日快樂！")
  (happy-birthday-matthew "Matthew 生日快樂！")
  (happy-birthday-shriram "Shriram 生日快樂！")

  (xml-tool-insert-xml-box "插入 XML 方塊")
  (xml-tool-insert-scheme-box "插入 Racket 方塊")
  (xml-tool-insert-scheme-splice-box "插入 Racket splice 方塊")
  (xml-tool-xml-box "XML 方塊")
  (xml-tool-scheme-box "Racket 方塊")
  (xml-tool-scheme-splice-box "Racket splice 方塊")
  (xml-tool-switch-to-scheme "切換為 Racket 方塊")
  (xml-tool-switch-to-scheme-splice "切換為 Racket splice 方塊")
  (xml-tool-eliminate-whitespace-in-empty-tags
   "移除空標籤內的空白")
  (xml-tool-leave-whitespace-alone
   "保留空白不變")

  (show-recent-items-window-menu-item "在獨立視窗顯示最近開啟的檔案")
  (show-recent-items-window-label "最近開啟的檔案")
  (number-of-open-recent-items "最近項目的數量")
  (switch-anyway "仍要切換檔案")

  (stepper-program-has-changed "警告：程式已變更。")
  (stepper-program-window-closed "警告：程式視窗已關閉。")

  (stepper-name "步進器")
  (stepper-language-level-message "步進器無法用於語言「~a」。")
  (stepper-button-label "逐步")

  (stepper-previous "逐步")
  (stepper-next "逐步")
  (stepper-jump "跳至…")
  (stepper-jump-to-beginning "開頭")
  (stepper-jump-to-end "結尾")
  (stepper-jump-to-selected "所選區段的開頭")
  (stepper-jump-to-previous-application "上一個應用步驟")
  (stepper-jump-to-next-application "下一個應用步驟")
  (stepper-out-of-steps
   "已到達求值結尾，未找到符合的步驟。")
  (stepper-no-such-step/title "找不到步驟")
  (stepper-no-such-step "找不到符合條件的步驟。")
  (stepper-no-such-step/earlier "找不到更早符合條件的步驟。")

  (stepper-no-earlier-application-step "沒有更早的應用步驟。")
  (stepper-no-later-application-step "沒有更多應用步驟。")
  (stepper-complete "所有定義都已成功求值。")

  (stepper-no-earlier-step "沒有更早的步驟。")
  (stepper-no-later-step "沒有更多步驟。")

  (stepper-no-selected-step "在標示區域內沒有任何步驟。也許已被註解掉了？")

  (stepper-no-last-step "尚無可用的最後一步。")

  (debug-tool-button-name "除錯")

  (dialog-back "返回")

  ;; warnings about closing a drscheme frame when the program
  ;; might still be doing something interesting
  (program-is-still-running "定義視窗中的程式仍在執行。仍要關閉嗎？")
  (program-has-open-windows
   "定義視窗中的程式有開啟的視窗。仍要關閉此視窗嗎？")

  ;; ml-command-line-arguments is for the command line arguments
  ;; label in the module language details in the language dialog.
  (ml-command-line-arguments "以可讀語法表示的字串向量形式之命令列參數")

  ;; ml-cp names are all for the module language collection path
  ;; configuration. See the details portion of the language dialog
  ;; for the module language (at the bottom).
  (ml-cp-default-collection-path "<<預設程式集路徑>>")

  ;; in std get-directory
  (ml-cp-choose-a-collection-path "請選擇程式集路徑")

  ;; err msg when adding default twice
  (ml-cp-default-already-present
   "已存在預設的程式集路徑")

  ;; title of this section of the dialog (possibly the word
  ;; `Collection' should not be translated)
  (ml-cp-collection-paths "程式集路徑")

  ;; button labels
  ;;  The package manager uses these, too
  (ml-cp-add "新增")
  (ml-cp-add-default "新增預設")
  (ml-cp-remove "移除")
  (ml-cp-raise "上移")
  (ml-cp-lower "下移")

  (ml-always-show-#lang-line "在模組語言中一律顯示 #lang 行")

  ;; Profj
  (profj-java "Java")
  (profj-java-mode "Java 模式")
  (profj-java-coverage "Java 覆蓋率") ;; shows up in the preferences dialog under 'Color'

  (profj-beginner-lang "初學者")
  (profj-beginner-lang-one-line-summary "類 Java 的初學者教材語言")
  (profj-full-lang "完整")
  (profj-full-lang-one-line-summary "類似 Java 1.0（部分 1.1）")
  (profj-advanced-lang "進階")
  (profj-advanced-lang-one-line-summary "類 Java 的進階教材語言")
  (profj-intermediate-lang "中階")
  (profj-intermediate-lang-one-line-summary "類 Java 的中階教材語言")
  (profj-intermediate-access-lang "中階＋權限")
  (profj-intermediate-access-lang-one-line-summary
   "類 Java 的中階教材語言，含存取修飾詞")
  (profj-dynamic-lang "Java＋動態")
  (profj-dynamic-lang-one-summary "具動態型別能力的 Java")

  (profj-java-mode-color-heading "編輯色彩") ; Heading for preference to choose editing colors
  (profj-java-mode-color-keyword "關鍵字")
  (profj-java-mode-color-string "字串")
  (profj-java-mode-color-literal "常值")
  (profj-java-mode-color-comment "註解")
  (profj-java-mode-color-error "錯誤")
  (profj-java-mode-color-identifier "識別字")
  (profj-java-mode-color-prim-type "基本型別") ; Example text for built-in Java types
  (profj-java-mode-color-default "預設")

  (profj-coverage-color-heading "覆蓋率色彩") ; Heading for preference to choose coverage colors
  (profj-coverage-color-covered "已覆蓋的運算式")

  ; Heading for preferences controlling printing
  (profj-language-config-display-preferences "顯示偏好")
  (profj-language-config-display-style "顯示樣式")
  (profj-language-config-display-field "類別＋欄位")
  (profj-language-config-class "類別")
  (profj-language-config-display-array "是否列印陣列的所有內容？")
  ; Heading for preferences controlling test behavior
  (profj-language-config-testing-preferences "測試偏好")
  ; Run should be the word found on the Run button
  ;(profj-language-config-testing-enable "Display testing results on Run?")
  (profj-language-config-testing-coverage "是否收集測試的覆蓋率資訊？")
  (profj-language-config-support-test-language "支援測試語言擴充？")
  (profj-language-config-testing-check "允許 check 運算式？") ; check should not be translated
  (profj-language-config-classpath "類別路徑")
  (profj-language-config-choose-classpath-directory "選擇要加入類別路徑的目錄")
  ; Button label to print the current classpath
  (profj-language-config-classpath-display "顯示目前設定")

  (profj-test-name-close-to-example "類別 ~a 的名稱包含接近 Example 的字詞。")
  (profj-test-name-example-miscapitalized "類別 ~a 的名稱包含大小寫錯誤的 example。")

  ;; Close testing window and do not run test cases any more
  ;(profj-test-results-close-and-disable "Close and Disable Testing")
  ;; Hide docked testing window and do not run test cases any more
  ;(profj-test-results-hide-and-disable "Hide and Disable Testing")
  ;Renamed below
  ;(profj-test-results-window-title "Test Results")

  (profj-unsupported "不支援")
  (profj-executables-unsupported "抱歉，目前不支援 Java 可執行檔")

  (profj-convert-to-text-comment "轉換為純文字註解")
  (profj-convert-to-comment "轉換為註解")

  (profj-executing-main "正在執行 main")

  (profj-insert-java-comment-box "插入 Java 註解方塊")
  (profj-insert-java-interactions-box "插入 Java 互動方塊")

  ;;The Test engine tool
  ;;
  (test-engine-window-title "測試結果")
  ;;Following two appear in View menu, attach and free test report window from DrRacket frame
  (test-engine-dock-report "停駐測試報告")
  (test-engine-undock-report "解除停駐測試報告")
  ;;Following two appear in Racket (Java, etc) menu, cause Tests to be Run automatically or not
  (test-engine-enable-tests "啟用測試")
  (test-engine-disable-tests "停用測試")
  (test-engine-enable-disable-tests-only-in-teaching-languages
   "「啟用/停用測試」選單項目僅用於停用或啟用 HtDP"
   " 與 DMdA 教學語言的測試支援。請在語言對話框的「顯示詳細資料」區段"
   " 中控制在「Racket 語言」中執行的子模組。")

  (test-engine-ran-1-test "已執行 1 個測試。")
  (test-engine-ran-1-check "已執行 1 次檢查。")
  ;; ditto, only plural
  (test-engine-ran-n-tests "已執行 ~a 個測試。")
  (test-engine-ran-n-checks "已執行 ~a 次檢查。")
  (test-engine-1-test-passed "測試通過！")
  (test-engine-1-check-passed "檢查通過！")
  (test-engine-both-tests-passed "兩個測試皆通過！")
  (test-engine-both-checks-passed "兩個檢查皆通過！")
  (test-engine-all-tests-passed "所有測試皆通過！")
  (test-engine-all-checks-passed "所有檢查皆通過！")
  (test-engine-all-n-tests-passed "共 ~a 個測試皆通過！")
  (test-engine-all-n-checks-passed "共 ~a 次檢查皆通過！")
  (test-engine-0-tests-passed "0 個測試通過。")
  (test-engine-0-checks-passed "0 次檢查通過。")
  (test-engine-m-of-n-tests-failed "~a / ~a 個測試失敗。")
  (test-engine-m-of-n-checks-failed "~a / ~a 次檢查失敗。")
  (test-engine-must-be-tested "此程式必須執行測試！")
  (test-engine-is-unchecked "此程式未檢查！")
  (test-engine-tests-disabled "測試已停用。")
  (test-engine-should-be-tested "此程式應該執行測試。")
  (test-engine-at-line-column "於第 ~a 行，第 ~a 欄")
  (test-engine-in-at-line-column "在 ~a，第 ~a 行，第 ~a 欄")
  ; as in "column (unknown)"
  (test-engine-unknown "（未知）")
  (test-engine-trace-error "追蹤錯誤")

  ; The ~F is special marker for the offending values, which may be
  ; printed specially in DrRacket.
  (test-engine-check-range-encountered-error
   "check-range 遇到下列錯誤，未能得到位於 [~F, ~F] 的值。~n   :: ~a")
  (test-engine-check-member-of-encountered-error
   "check-member-of 遇到下列錯誤，未能得到 ~L 內的值。~n   :: ~a")
  ; obsolete version of this
  (test-engine-check-*-encountered-error
   "~a 遇到下列錯誤，未能得到預期的值 ~F。~n   :: ~a")
  ; deprecated:
  (test-engine-check-encountered-error
   "check-expect 遇到下列錯誤，未能得到預期的值 ~F。~n   :: ~a")
  (test-engine-check-error-cause
   "由此運算式造成")
  (test-engine-actual-value-differs-error
   "實際值 ~F 與預期值 ~F 不同。")
  ;; need to translate only one of these next two
  ;; (test-engine-actual-value-not-within-error or
  ;;  test-engine-actual-value-not-within-error/alt-word-order)
  ;; if both are present, test-engine-actual-value-not-within-error is used
  (test-engine-actual-value-not-within-error
   "實際值 ~F 與預期值 ~F 的差距未在 ~v 以內。")
  (test-engine-actual-value-not-within-error/alt-order
   "實際值 ~F 與預期值 ~F 的距離不夠近；預期應在 ~v 以內。")
  (test-engine-encountered-error-error
   "check-error 遇到下列錯誤，未能得到預期的 ~a~n   :: ~a")
  (test-engine-expected-error-error
   "check-error 預期出現下列錯誤，但卻收到值 ~F。~n ~a")
  (test-engine-expected-an-error-error
   "check-error 預期出現錯誤，但卻收到值 ~F。")
  ;; members are appended to the message
  (test-engine-not-mem-error "實際值 ~F 與以下所有給定成員皆不同：")
  (test-engine-not-range-error "實際值 ~F 不在 ~F 與 ~F 之間（包含端點）。")

  ;; followed by list of variable bindings
  (test-engine-property-fail-error "可由以下反例反駁之性質")
  (test-engine-property-error-error "check-property 遇到下列錯誤~n:: ~a")

  (signature-enable-checks "啟用簽章檢查")
  (signature-disable-checks "停用簽章檢查")

  ; section header
  (test-engine-check-failures "檢查失敗：")
  ; section header
  (test-engine-signature-violations "簽章違反：")

  ; part of one phrase "signature <at line ...> to blame: function <...>
  (test-engine-signature "簽章")
  (test-engine-to-blame "歸咎於：函式")

  (test-engine-no-signature-violations "無簽章違反。")
  (test-engine-1-signature-violation "1 個簽章違反。")
  (test-engine-n-signature-violations "~a 個簽章違反。")

  ; as in got <value>, signature <at ...>
  (test-engine-got "實得")

  (profjWizward-insert-java-class "插入 Java 類別")
  (profjWizard-insert-java-union "插入 Java 聯合")

  ;; The Test Suite Tool
  ;; Errors
  (test-case-empty-error "空白測試案例")
  (test-case-too-many-expressions-error "測試案例中的運算式過多。")
  ;; DrRacket window menu items
  (test-case-insert "插入測試案例")
  (test-case-disable-all "停用所有測試案例")
  (test-case-enable-all "啟用所有測試案例")

  ;; NOTE: The following string constants are labels of the test-case fields. The width
  ;;       of the field is determined by the length of the longest of the following three words.
  ;;       if the words are too long the test case will take up too much horizontal room and
  ;;       not look very good.
  ;; This string is the label of the expression that is being tested in a test case.
  (test-case-to-test "測試")
  ;; This string is the label of the expression that is the expected value of the to-test expression.
  (test-case-expected "應為")
  ;; This string is the label of the actual result of the to test expression.
  (test-case-actual "實際")
  (test-case-predicate "述詞")
  (test-case-should-raise "應拋出")
  ;; The label of a field of the test-case that describes the expected error message of a test case
  (test-case-error-message "錯誤訊息")

  (test-case-menu-title "測試案例")
  (test-case-switch-to-error-box "切換為錯誤測試方塊")
  (test-case-switch-to-nonerror-box "切換為非錯誤測試方塊")
  (test-case-collapse "摺疊測試案例")
  (test-case-show-actual "顯示實際值")
  (test-case-enable "啟用測試案例")
  (test-case-show-predicate "顯示述詞")
  (test-case-show-error-message "顯示錯誤訊息")
  (test-case-convert-to-text "轉換為文字")

  ;; Profj Boxes
  (profjBoxes-empty-error "空白互動")
  (profjBoxes-too-many-expressions-error "方塊中的運算式過多")
  (profjBoxes-interactions-label "互動")
  (profjBoxes-bad-java-id-error "不合法的 Java 識別字")
  (profjBoxes-examples-label "範例")
  (profjBoxes-add-new-example-button "新增範例")
  (profjBoxes-type "型別")
  ;; The Java identifier of an example of data
  (profjBoxes-name "名稱")
  (profjBoxes-value "值")
  (profjBoxes-insert-java-examples "插入 Java 範例")
  (profjBoxes-insert-java-interactions "插入 Java 互動")

  ;; Slideshow
  (slideshow-hide-picts "顯示巢狀方塊")
  (slideshow-show-picts "顯示圖像")
  (slideshow-cannot-show-picts "無法顯示圖像；請先執行程式以快取尺寸")
  (slideshow-insert-pict-box "插入圖像方塊")

  ;; GUI Tool
  (gui-tool-heading "GUI 工具")
  (gui-tool-before-clicking-message
   "在按下工具圖示前，請從「特殊」選單使用「插入 GUI」"
   " 以插入根 GUI 項目，或選取已插入的 GUI。")
  (gui-tool-show-gui-toolbar "顯示 GUI 工具列")
  (gui-tool-hide-gui-toolbar "隱藏 GUI 工具列")
  (gui-tool-insert-gui "插入 GUI")

  ;; contract violation tracking

  ; tooltip for new planet icon in drscheme window (must have a planet violation logged to see it)
  (show-planet-contract-violations "顯示 PLaneT 合約違反")

  ; buttons in the dialog that lists the recorded bug reports
  (bug-track-report "送出錯誤回報")
  (bug-track-forget "移除")
  (bug-track-forget-all "全部移除")

  ;; planet status messages in the bottom of the drscheme window;
  ;; the ~a is filled with the name of the package
  (planet-downloading "PLaneT：正在下載 ~a…")
  (planet-installing "PLaneT：正在安裝 ~a…")
  (planet-finished "PLaneT：已完成 ~a。")
  (planet-docs-building "PLaneT：正在建立文件（由 ~a 觸發）…")
  ;; this can happen when there is status shown in a different and then
  ;; the user switches to a tab where planet hasn't been used
  (planet-no-status "PLaneT")

  (bug-report-field-pkg "套件系統資訊")

  ;; string normalization. To see this, paste some text with a ligature into DrRacket
  ;; the first three strings are in the dialog that appears. The last one is in the preferences dialog
  (normalize "正規化")
  (leave-alone "保持不變")
  (normalize-string-info
   "你貼上的字串包含連字或其他非正規化字元。要正規化它們嗎？")
  (normalize-string-preference "貼上字串時正規化")
  (ask-about-normalizing-strings "詢問是否正規化字串")

  (always-use-platform-specific-linefeed-convention
   "一律使用平台特定的換行符號慣例")
  (disable-caret-blinking "停用游標閃爍")

  ;; optimization coach
  (hide-optimization-coach "隱藏最佳化教練")
  (show-optimization-coach "顯示最佳化教練")

  ;; labels used (in a big font) in the background of the definitions and interactions windows
  (definitions-window-label "定義")
  (interactions-window-label "互動")
  (hide-defs/ints-label "隱藏「定義/互動」標籤") ;; popup menu
  (show-defs/ints-label "顯示「定義/互動」標籤") ;; preferences checkbox

  ;; menu item in the 'edit' menu; applies to editors with programs in them
  ;; (technically, editors that implement color:text<%>)
  (spell-check-string-constants "字串常數拼字檢查")
  (spell-check-scribble-text "檢查文字拼字（Scribble 中大括號 {} 之間）")
  ; (sub)menu whose items are the different possible dictionaries
  (spelling-dictionaries "拼字字典")
  (default-spelling-dictionary "預設字典") ; first item in menu from previous line
  (misspelled-text-color "拼字檢查色彩") ;; in the preferences dialog
  (cannot-find-ispell-or-aspell-path "找不到 aspell 或 ispell 執行檔")
  ; puts the path to the spell program in the ~a and then the error message
  ; is put following this string (with a blank line in between)
  (spell-program-wrote-to-stderr-on-startup "拼字程式（~a）輸出了一則錯誤訊息：")
  (spell-program-did-not-respond-after-some-seconds
   "拼字程式（~a）在 ~a 秒後仍未回應")
  (spell-skip-to-next-misspelled-word "跳至下一個拼錯的字") ;; menu item
  (spell-suggest-corrections "建議拼字修正…") ;; menu item
  (spell-correction-suggestions "拼字修正建議") ;; dialog title
  (spell-choose-replacement-word "選擇取代字詞") ;; label in dialog

  ;; GUI for installing a pkg package; available via File|Install Package...
  (install-pkg-install-by-source "照我意思")         ; tab label
  (install-pkg-install-from-list "可自目錄取得") ; tab label
  (install-pkg-install-installed "目前已安裝")    ; tab label
  (install-pkg-migrate-from "從版本複製")           ; tab label
  (install-pkg-settings "設定")                        ; tab label
  (install-pkg-menu-item... "安裝套件…")
  (install-pkg-dialog-title "安裝套件")
  (install-pkg-source-label "套件來源")
  (install-pkg-package-name "套件名稱")
  (install-pkg-package-source-desc
   "套件來源可以是套件名稱、檔案、目錄、URL 或 GitHub 參照")
  (install-pkg-infer "推斷")
  (install-pkg-use "使用") ; as opposed to "Infer", label for text box
  (install-pkg-type-label "套件來源類型")
  (install-pkg-file "檔案")
  (install-pkg-link "連結")
  (install-pkg-static-link "靜態連結")
  (install-pkg-dir "目錄")
  (install-pkg-dir-url "遠端目錄")
  (install-pkg-file-url "遠端檔案")
  (install-pkg-git "Git 儲存庫")
  (install-pkg-github "GitHub")
  (install-pkg-name "名稱（由解析器判定）")
  (install-pkg-inferred-as "推斷類型為 ~a") ; ~a gets install-pkg-{file,dir,...}
  (install-pkg-link-dirs "以連結方式使用本機目錄")
  (install-pkg-file-or-dir? "選擇檔案或目錄？")
  (install-pkg-force? "忽略衝突")
  (install-pkg-replace? "更新可取代現有安裝")
  (install-pkg-dry-run? "試跑（不做安裝變更）")
  (install-pkg-command-line "等效命令列：")
  (install-pkg-error-installing-title "安裝套件時發生錯誤")
  (install-pkg-action-label "要執行的動作")
  (install-pkg-install "安裝")
  (install-pkg-update "更新")
  (install-pkg-setup "設定") ; for button
  (install-pkg-update+setup "更新並設定") ; for button
  (install-pkg-setup-long "設定目前安裝") ; for menu
  (install-pkg-remove "移除")
  (install-pkg-do-not-remove "不要移除")
  (install-pkg-action-inferred-to-be-update "推斷動作為更新")
  (install-pkg-action-inferred-to-be-install "推斷動作為安裝")
  (install-pkg-action-inferred-to-be-update+setup "推斷動作為更新並設定")
  (install-pkg-default "預設")
  (install-pkg-scope-label "套件範圍")
  (install-pkg-default-scope-label "預設套件範圍") ; for picking the scope to be default
  (install-pkg-default-scope-changed "已成功將預設範圍變更為 ~a") ; confirming message after change
  (install-pkg-installation "特定 Racket 安裝")
  (install-pkg-user "特定使用者與 Racket 版本")
  (install-pkg-set-as-default "設為預設")
  (install-pkg-scope-is "套件範圍為 ~a") ; ~a gets install-pkg-{installation,user,shared}
  (install-pkg-select-package-directory "選擇套件目錄")
  (install-pkg-select-package-file "選擇套件檔案")
  (install-pkg-update-package-list "更新套件清單")
  (install-pkg-stop-update "停止更新")
  (install-pkg-filter "過濾")
  (install-pkg-match "~a/~a 個相符")
  (install-pkg-package "套件")
  (install-pkg-author "作者")
  (install-pkg-description "描述")
  (install-pkg-tags "標籤")
  (install-pkg-checksum "校驗")
  (install-pkg-source "來源")
  (install-pkg-catalog "目錄")
  (install-pkg-scope "範圍")
  (install-pkg-name "名稱")
  (install-pkg-update-catalogs? "將資料庫更新為與已設定目錄一致？")
  (install-pkg-currently-configured-are "目前設定的目錄為")
  (install-pkg-database-recorded-are "資料庫記錄的目錄為")
  (install-pkg-update-catalogs "更新")
  (install-pkg-do-not-update-catalogs "不要更新")
  (install-pkg-really-remove? "確定要移除下列選取的套件嗎？")
  (install-pkg-promote "自自動安裝升級")
  (install-pkg-demote "降級為自動安裝")
  (install-pkg-abort-install "中止安裝")
  (install-pkg-abort-update "中止更新")
  (install-pkg-abort-remove "中止移除")
  (install-pkg-abort-demote "中止降級")
  (install-pkg-abort-promote "中止升級")
  (install-pkg-abort-migrate "中止移轉")
  (install-pkg-abort-setup "中止設定")
  (install-pkg-abort-generic-action "中止動作")
  (install-pkg-continue-generic-action "繼續動作")
  (install-pkg-close-terminal-output "關閉輸出")
  (install-pkg-show-all-options "顯示所有選項")
  (install-pkg-migrate-available-installations "可用安裝")
  ;; all ~a will be substituted with the different single characters
  ;; conveying the state, by default these are ✓*!=@
  (install-pkg-legend "~a：已安裝 ~a：自動安裝 ~a：非預設範圍 ~a：以連結方式安裝；~a：自 URL 安裝")
  (pkg-manager-menu-item "套件管理員…")
  (install-pkg-title "套件管理員")
  ;; where ~a gets an installation name:
  (install-pkg-packages-for "適用於 ~a 的套件")
  (install-pkg-really-remove-installation
   "確定要移除 ~a 的所有已安裝套件與資訊嗎？")
  (install-pkg-installer "套件安裝器")
  (install-pkg-copy "複製訊息")
  (install-pkg-installation "安裝")
  (install-pkg-user "使用者")
  (install-pkg-any "任何") ;; any file type
  (install-pkg-bad "不支援") ;; bad (not supported) file type
  (install-pkg-catalogs "套件目錄")
  (install-pkg-updating "正在更新套件清單…")
  (install-pkg-updating-from "正在從 ~a 更新…")
  (install-pkg-details-from "正在從 ~a 取得 ~a 的詳細資訊…")

  (install-pkg-abort-set-scope "中止範圍變更")

  (install-pkg-dependencies-fail "失敗：若相依未滿足則取消安裝/更新")
  (install-pkg-dependencies-force
   "強制：即使缺少或版本不符亦安裝")
  (install-pkg-dependencies-search-ask
   "詢問：每個缺少的相依都提示（GUI 不支援）")
  (install-pkg-dependencies-search-auto
   "自動：自動安裝缺少或版本不符的相依")
  (install-pkg-dependencies-search-auto+update
   "自動＋更新：盡可能更新相依")

  (install-pkg-dependencies-mode "相依性模式")

  (install-pkg-dependencies-search-ask-not-supported-in-gui
   "GUI 安裝器不支援相依的「詢問」模式。")
  ;; "~a" is pre-":" part of `install-pkg-dependencies-fail'
  ;; or `install-pkg-dependencies-search-auto':
  (install-pkg-deps-is "預設相依性模式為 ~a")

  (install-pkg-package-catalogs "套件目錄") ; label for a list box
  (install-pkg-add-package-catalog "新增套件目錄")

  (install-pkg-not-rentrant "安裝與更新不能同時進行；"
                            " 請中止目前作業或等待完成。")
  (install-pkg-generic-action-in-progress "仍有套件管理作業在進行中。"
                                          " 確定要關閉視窗並中止此作業嗎？"
                                          " 這可能使你的安裝處於不一致狀態。")

  ;; open a file via a collection path (new "Open" menu item in DrRacket)
  (open-require-path "開啟 require 路徑…")
  (enter-subcollection "輸入子集合") ; button in new dialog
  (path-to-racket-binary "執行檔路徑")
  (use-a-different-racket "使用其他 Racket")

  ;; adding racket/bin to the path; only under mac os x
  ; first ~a is filled with either the empty string or an error message from elsewhere
  ;  (bracketed by some newlines to separate it out)
  ; second ~a is filled with /etc/paths.d/racket (or some other path like it in the future)
  ; third ~a is filled with the path to the bin directory of the current drracket
  (adding-racket/bin-to-path-failed
   "嘗試將 racket 支援加入命令列失敗。~a詳細如下："
   " 無法建立「~a」，內容為「~a」。")
  ; first and third ~a are filled with /etc/paths.d/racket (or some other path like it in the future)
  ; and the second one is filled with the path to the bin directory that was put into that file.
  (added-racket/bin-to-path
   "你現在應可在命令列使用 racket 與其工具。"
   " \n\n系統已為所有使用者設定預設 PATH，"
   " 透過新增檔案 ~a 指向 ~a。你可以刪除 ~a"
   " 以復原此設定。")
  (adding-racket/bin-no-paths.d
   "由於不存在 /etc/paths.d，無法將 racket 加入命令列。"
   " \n\n你可以在終端機視窗中執行下列指令以建立該目錄：\n"
   "    sudo mkdir /etc/paths.d\n然後再試一次。")
  (added-racket/bin-to-path/windows
   "你現在應可在命令列使用 racket 與其工具。"
   " \n\n已透過機碼"
   " HKEY_CURRENT_USER\\Environment\\Path 設定預設 %PATH%，"
   " 指向 ~a 與 ~a。")
  (didnt-add-racket/bin-to-path/unix
   "DrRacket 無法在 Unix 下更新你的 PATH；若你知道如何自行調整 PATH，"
   " 請將\n\n  ~a\n\n"
   " 加入其中。")
  (add-racket/bin-to-path "設定 Racket 的命令列…") ;; menu item label
  
  ;; quickscript messages
  (qs-my-first-script "我的第一個腳本")
  (qs-script-library "腳本程式庫")
  (qs-directories "目錄")
  (qs-add "新增(&A)")
  (qs-remove "移除(&R)")
  (qs-scripts "腳本")
  (qs-disable "停用(&B)")
  (qs-enable "啟用(&B)")
  (qs-shadow "遮蔽(&H)")
  (qs-recompiling  "重新編譯快速腳本…")
  (qs-recompiling-wait "正在重新編譯快速腳本，請稍候…")
  (qs-scripts "腳本(&S)")
  (qs-manage "管理(&M)")
  (qs-compilation-error "Quickscript：編譯期間發生錯誤")
  (qs-caught-exception  "Quickscript 捕捉到例外")
  (qs-recompiling-library "重新編譯程式庫")
  (qs-my-script "我的超棒腳本")
  (qs-script-help "此腳本的說明字串。")
  (qs-compiling-scripts "正在編譯腳本")
  ;; ~a is a script file including its path
  (qs-compiling "正在編譯 ~a")
  ;; ~a is a script file including its path
  (qs-file-not-found "找不到檔案：~a")
  (qs-invalid-hook "無效的 hook 名稱。\n可用名稱：\n")
  ;; the  three `qs-error-detail-*` string constants are put into the same message
  (qs-error-detail-overview "已捕捉到 ~a 個錯誤。") ; the ~a is number of errors
  (qs-error-detail-summary "摘要：")
  (qs-error-detail-details "詳細資訊：")
  (qs-script-name "腳本名稱")
  (qs-script-name-enter "輸入新腳本的名稱：")
  (qs-open-script "開啟腳本")
  ;; ~a is the name of a script file
  (qs-error-run "執行：腳本檔 ~s 發生錯誤：\n" )
  (qs-output "輸出") ;; not repl-out-color where it means color of the output
  (qs-load-script-menu "正在載入「腳本」選單")
  (qs-loading-file "正在載入檔案 ")
  ;; ~a is the name of a script file
  (qs-script-file "腳本檔 ~s：")
  (qs-build-menu "正在建立腳本選單")
  ;; ~a is number of rebuilds
  (qs-menu-rebuild "腳本選單重新建置 #~a…")
  (qs-delete-menu "正在刪除選單項目")
  ;; ~a is a a script entry in menu
  (qs-delete-menu-item "正在刪除選單項目 ~a… ")
  (qs-new-script "新增腳本(&N)…")
  (qs-open-script "開啟腳本(&O)…")
  (qs-disable-scripts "停用腳本(&D)…")
  (qs-library "程式庫(&L)…")
  (qs-reload-menu "重新載入選單(&R)")
  (qs-compile-scripts "編譯腳本(&C)")
  (qs-stop-scripts "停止常駐腳本(&S)")
  (qs-report-issue "回報問題(&I)")
  (qs-error-load "Quickscript：載入腳本屬性時發生錯誤")

  ;; macro stepper
  ; used in the button label and menu item and title for some dialog boxes
  (macro-stepper "巨集步進器")

  ; these next three are in the same dialog; first a message and then two button labels
  (macro-stepper-warning-message
   "巨集展開已進行了可疑地大量步驟。\n\n按一下「停止」以停止巨集展開並查看目前為止的步驟，"
   " 或按一下「繼續」讓它再執行久一點。")
  (macro-stepper-continue "繼續")
  (macro-stepper-stop "停止")

  )
