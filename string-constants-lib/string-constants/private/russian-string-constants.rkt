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

(module russian-string-constants "string-constant-lang.rkt"
  ;;; when translating this constant, substitute name of actual language for `English'
  (is-this-your-native-language "Русский - это Ваш родной язык?")
 


  (are-you-sure-you-want-to-switch-languages
   "Смена языка интерфейса пользователя потребует перезапустить DrRacket. Вы уверены, что действительно хотите этого?")
 
  (interact-with-drscheme-in-language "Работать с русским интерфейсом DrRacket")
 
  ;; these two should probably be the same in all languages excepet English.
  ;; they are the button labels (under macos and windows, respectively)
  ;; that go the with the string above.
  (accept-and-quit "Применить и выйти")
  (accept-and-exit "Применить и выйти")
  
  ;;; general purpose (DrRacket is hereby a word in every language, by decree of Robby :)
  (plt "PLT")
  (drscheme "DrRacket")
  (drracket "DrRacket")
  (ok "OK")
  (cancel "Отмена")
  (abort "Отмена")
  (untitled "Безымянный")
  (untitled-n "Безымянный ~a")
  (warning "Предупреждение")
  (error "Ошибка")
  (close "Закрыть") ;; as in, close an open window. must match close-menu-item
                  ;; in the sense that, when the &s have been stripped from
                  ;; close-menu-item, it must be the same string as this.
  (close-window "Закрыть окно")
  (stop "Остановить")
  (&stop "&Остановить") ;; for use in button and menu item labels, with short cut.
  (are-you-sure-delete? "Вы действительно хотите удалить ~a?") ;; ~a is a filename or directory name
  (are-you-sure-replace? "Вы действительно хотите заменить ~a?") ;; ~a is a filename or directory name
  (ignore "Игнорировать")
  (revert "Загрузить заново") 

  ;; label for a generic check box, often supported on dialogs
  ;; that ask a binary choice of the user. If checked, the
  ;; dialog isn't going to be shown again.
  ;; One version for always using the current choice:
  (dont-ask-again-always-current "Не переспрашивать (всегда использовать текущий выбор)")
  ;; One generic version (ie, on the Quit DrRacket dialog)
  (dont-ask-again                "Не переспрашивать")
 
  ;;; important urls
  (web-materials "Связанные Web-сайты") ;; menu item title
  (tool-web-sites "Web-сайты установленных инструментов")   ;; menu item title
  (plt-homepage "Racket")
  (pbd-homepage "Program by Design")
 
  ;; having an issue (replaces the bug report form, whose string constants are below)
  (have-an-issue? "Возникла проблема?…")
  (use-github-or-the-mailing-list-for-issues
    "Если вы нашли ошибку в Racket или DrRacket, пожалуйста откройте обращение на"
    " GitHub.\n\nЕсли вы обнаружили что-то странное, но не уверены"
    " что это ошибка, попробуйте спросить в списке рассылки.")
  (visit-mailing-lists "Посетить список рассылки") ;; button in dialog
  (visit-github "Посетить GitHub") ;; button in dialog, goes to 'open issue' page
 
  ;;; bug report form
  (cancel-bug-report? "Отменить отправку отчёта об ошибках?")
  (are-you-sure-cancel-bug-report?
   "Вы действительно хотите отменить отправку отчёта об ошибках?")
  (do-you-want-to-discard-or-save-this-bug-report
   "Вы хотите отменить или сохранить этот отчёт об ошибках?")
  (discard "Отменить") ;; a button label for a dialog box with the above question
  (bug-report-form "Отчёт об ошибках")
  (bug-report-field-name "Имя")
  (bug-report-field-email "E-mail")
  (bug-report-field-summary "Резюме")
  (bug-report-field-severity "Серьезность")
  (bug-report-field-class "Класс")
  (bug-report-field-description "Описание")
  (bug-report-field-reproduce1 "Последовательность действий")
  (bug-report-field-reproduce2 "для воспроизведения ошибки")
  (bug-report-field-environment "Среда")
  (bug-report-field-docs-installed "Установленная документация")
  (bug-report-field-collections "Коллекция")
  (bug-report-field-links "Связи")  ;; from 'raco link'
  (bug-report-field-human-language "Язык интерфейса")
  (bug-report-field-memory-use "Используемая память")
  (bug-report-field-version "Версия")
  (bug-report-synthesized-information "Собранные данные")  ;; dialog title
  (bug-report-show-synthesized-info "Показать собранные данные")
  (bug-report-submit "Отправить")
  ;; button in bug report dialog, next to cancel and bug-report-submit
  (close-and-save-bug-report "Закрыть и записать")
  ;; same as above, but used when there are saved bug reports
  (bug-report-submit-menu-item "Отправить отчёт об ошибке...") ;; in Help Menu (drs & help desk)
  ;; in Help Menu, submenu title
  (saved-bug-reports-menu-item "Сохранённые отчёты об ошибках")
  ;; menu item: only shows up when there is more than one saved bug report
  (disacard-all-saved-bug-reports "Удалить все сохранённые отчёты об ошибках")
  ;; an info message that shows up as a disabled menu item when no saved bug reports are around
  (no-saved-bug-reports "Нет сохранённых отчётов об ошибках")
  ;; button label the user sees when there are saved bug reports,
  ;; but the user asks to save another one.
  (new-bug-report "Новый отчёт об ошибках")
  ;; button on the bottom of the bug report form
  (close-and-save "Закрыть и сохранить")
  (saved-unsubmitted-bug-reports "Сохранённые, не отправленные отчёты об ошибках:")
  ;; the above string constant is next to previous line in same dialog, followed by
  ;; list of bug report subjects (as buttons)
  (error-sending-bug-report "Сбой при отправке отчета об ошибке")
  (error-sending-bug-report-expln 
   "При отправке отчета об ошибке произошел сбой."
   " При наличии работающего подключения к Internet, посетите сайт:\n\n"
   "    https://github.com/racket/racket/issues/new\n\nи"
   " отправьте отчет об ошибке через Github. Извините за неудобства.\n\nСообщение об ошибке:\n~a")
  (illegal-bug-report "Некорректный отчет об ошибке")
  (pls-fill-in-field "Пожалуйста, заполните поле \"~a\"")
  (malformed-email-address "Некорректный адрес электронной почты")
  (pls-fill-in-either-description-or-reproduce 
   "Пожалуйста, заполните поле \"Описание\" либо \"Последовательность действий для воспроизведения ошибки\".")
 
  ;;; check syntax
  (check-syntax "Проверить синтаксис")
  (cs-italic "Курсив")
  (cs-bold "Полужирный")
  (cs-underline "Подчеркнутый")
  (cs-smoothing-default "Стандартно")
  (cs-smoothing-partial "Частично сглаженный")
  (cs-smoothing-full "Сглаженный")
  (cs-smoothing-none "Несглаженный")
  (cs-change-color "Изменить цвет")
  (cs-foreground-color "Цвет текста")
  (cs-background-color "Цвет фона")
  (cs-tack/untack-arrow "Соединять/не соединять стрелками")
  (cs-tack-crossing-arrows "Соединять пересекающимися стрелками")
  (cs-jump-to-next-bound-occurrence "Перейти к следующему использованию")
  (cs-jump-to-previous-bound-occurrence "Перейти к предыдущему использованию")
  (cs-jump-to-binding "Перейти к определению")
  (cs-jump-to-definition "Перейти к объявлению (в другом файле)")
  (cs-open-defining-file "Открыть файл с определением")
  (cs-error-message "Сообщение об ошибке")
  (cs-open-file "Открыть ~a")
  (cs-rename-var "Переименовать ~a")
  (cs-rename-id "Переименовать идентификатор")
  (cs-rename-var-to "Переименовать ~a в:")
  (cs-name-duplication-error 
   "Выбранное имя ~s конфликтует с ранее определенным.")
  (cs-rename-anyway "Переименовать безоговорочно")
  (cs-status-init "Проверка синтаксиса: инициализация окружения для пользовательского кода")
  (cs-status-coloring-program "Проверка синтаксиса: цветовыделение выражения")
  (cs-status-eval-compile-time "Проверка синтаксиса: вычисление времени компиляции")
  (cs-status-expanding-expression "Проверка синтаксиса: развернуть выражение")
  (cs-status-loading-docs-index "Проверка синтаксиса: загрузка индекса документации")
  (cs-syncheck-running "Запушена проверка синтаксиса")
  (cs-mouse-over-import "Привязка ~s импортирована из ~s")
  (cs-mouse-over-import/library-only "импортирована из ~s")
  (cs-view-docs "Просмотр документации для ~a")
  (cs-view-docs-from "~a из ~a")  ;; a completed version of the line above
   ;; (cs-view-docs) is put into the first ~a and a list of modules (separated by commas)
   ;; is put into the second ~a. Use check syntax and right-click on a documented variable
   ;; (eg, 'require') to see this in use
 
  (cs-lexical-variable "лексическая переменная")
  (cs-set!d-variable "переопределенная переменная")
  (cs-imported-variable "импортированная переменная")
  (cs-unused-require "неиспользуемое require")
  (cs-free-variable "свободная переменная")
 
  (cs-binder-count "~a упоминаний")
  (cs-zero-varrefs "нет использований")
  (cs-one-varref "1 использование")
  ;; expected to have one ~a formatter that will accept a number
  (cs-n-varrefs "~a использований")
 
  (cs-contract-my-obligation "Контракт: обязательство этого модуля")
  (cs-contract-their-obligation "Контракт: обязательство клиентского модуля")
  (cs-contract-both-obligation "Контракт: обязательство и этого и клиентского модуля")
  (cs-contract-unk-obligation "Контракт: неизвестное обязательство")
 
  ;; require prefix functionality
  (cs-add-prefix-for-require "Добавить префикс для require")
  (cs-prefix-require-title "Префикс для require")
  (cs-prefix-require "Выберите префикс для добавления всем импортированным переменным")
  (cs-all-binders-are-prefixed
   "Все команды require уже имеют префикс; попробуйте его вместо этого переименовать")
  (cs-the-binder-is-prefixed
   "Эта команда require уже имеет префикс; попробуйте его вместо этого переименовать")
 
  ;; mode sub-menu in the "view" menu
  (cs-check-syntax-mode "Режим проверки синтаксиса")
  (cs-mode-menu-show-my-obligations "Мои контрактные обязательства")
  (cs-mode-menu-show-client-obligations "Контрактные обязательства клиента")
  (cs-mode-menu-show-syntax "Синтаксические категории")
 
  ;; the documentation blue boxes in the upper-right corner of the drracket window
  (sc-read-more... "читать дальше…")
  (sc-f2-to-un/lock "f2 для (раз)блокировки")
 
  ;; the online check syntax status messages (mouse over the bottom right of drracket's
  ;; window to see the messages during online expansion's various phases)
  (online-expansion-running "Фоновое раскрытие работает")
  (online-expansion-only-raw-text-files-supported "Поддерживаются только текстовые файлы")
  (online-expansion-abnormal-termination "Фоновое раскрытие завершилось аварийно")
  (online-expansion-abnormal-termination-out-of-memory
   "Фоновое раскрытие завершилось аварийно (закончилась память)")
  (online-expansion-finished-successfully "Фоновое раскрытие завершилось успешно")
 
  (jump-to-error "Перейти к ошибке")
  (copy-error-message "Скопирвоать сообщение об ошибке")
  (online-expansion-is-disabled "Фоновое раскрытие отключено")
  ; these next two show up in the bar along the bottom of the drracket window
  (online-expansion-pending "Фоновое раскрытие не закончено…")
  ;; note: there may still be errors in this case
  (online-expansion-finished "Фоновое раскрытие завершилось")
  ; the next two show up in a menu when you click on the circle in the bottom right corner
  (disable-online-expansion "Отключить фоновое раскрытие")
  (enable-online-expansion "Включить фоновое раскрытие")
  ;; the online expansion preferences pane
  (online-expansion "Фоновое раскрытие") ;; title of prefs pane
  ; the different kinds of errors
  (online-expansion-show-read-errors-as "Показывать ошибки чтения")
  (online-expansion-show-variable-errors-as "Показывать ошибки неизвестных идентификаторов")
  (online-expansion-show-other-errors-as "Показывать другие ошибки")
  ; locations the errors can be shown
  (online-expansion-error-gold-highlight "золотой подсветкой")
  (online-expansion-error-margin "на полях")
  ; the label of a preference in the (string-constant online-expansion) section
  (show-arrows-on-mouseover "Показывать связи стрелками и линиями при наведении мыши")
  (show-blueboxes "Показывать голубую рамку с описанием и её полукруг со стрелкой в правом верхнем углу")
  ;;; info bar at botttom of drscheme frame
  (collect-button-label "Cборка мусора")
  (read-only "Только для чтения")
  (auto-extend-selection "Авторасширение")
  (overwrite "Замена")
  (running "выполняется")
  (not-running "не выполняется")
 
  ;; button label: ~a is filled with the name of a pkg
  (install-package-button "Установить ~a")
  ;; button label; shown when there is a missing module, but no matching package
  (update-catalog "Обновить каталог")
  ;; message label; used as a status message when updating the pkg catalog
  (updating-catalog-from "Обновляется из ~a…")
  
  ;;; misc
  (welcome-to-something "Добро пожаловать в ~a")
  
  ; this appears in the drscheme about box.
  (welcome-to-drscheme-version/language "Добро пожаловать в DrRacket, версия ~a, ~a")
 
  ; these appear on subsequent lines in the `Help|Добро пожаловать в DrRacket' dialog.
  (welcome-to-drscheme "Добро пожаловать в DrRacket")
 
  (goto-line "Перейти к строке")
  (goto-line-invalid-number
   "~a - некорректный номер строки. Номер должен быть целым числом в диапазоне от 1 до ~a")
  (goto-position "Перейти к позиции")
  (no-full-name-since-not-saved
   "У файла нет полного имени - он еще не был сохранен.")
  (cannot-open-because-dne "Невозможно открыть ~a, потому что он не существует.")

  (needs-execute-language-changed
   "Предупреждение: язык изменился. Нажмите Выполнить.")
  (needs-execute-teachpack-changed
   "Предупреждение: учебный пакет изменился. Нажмите Выполнить.")
  (needs-execute-defns-edited
   "Предупреждение: окно определений изменилось. Нажмите Выполнить.")
 
  (editor-changed-since-srcloc-recorded
   "С момента последней фиксации местоположения файла были внесены изменения,"
   " поэтому выделенная область может содержать неверное местоположение файла.")
   
  (file-is-not-saved "Файл \"~a\" не сохранен.")
  (save "Сохранить")
  (close-anyway "Все равно закрыть")
  (dont-save "Не сохранять")
  (clear-anyway "Все равно очистить")
 
  ;; menu item title
  (log-definitions-and-interactions "Сохранить окна определения и интерпретатора...")
  (stop-logging "Остановить протоколирование")
  (please-choose-a-log-directory "Пожалуйста, выберите каталог")
  (logging-to "Протоколировать в: ")
  (erase-log-directory-contents "Удалить содержимое каталога: ~a?")
  (error-erasing-log-directory "Ошибка удаления содержимого каталога.\n\n~a\n")
 
  ;; menu items connected to the logger -- also in a button in the planet status line in the drs frame
  (show-log "Показать &протокол")
  (hide-log "Скрыть &протокол")
  (logger-scroll-on-output "Прокручивать при выводе") ; a checkbox in the logger pane
  (log-messages "Протокол") ;; label for the drracket logging gui panel
 
  ;; modes
  (mode-submenu-label "Режимы")
  (scheme-mode "Режим Scheme")
  (racket-mode "Режим Racket")
  (text-mode "Режим текста")
 
  (scheme-mode-color-symbol "Символ")
  (scheme-mode-color-keyword "Ключевое слово")
  (scheme-mode-color-comment "Комментарий")
  (scheme-mode-color-string "Строка")
  (scheme-mode-color-text "Текст")
  (scheme-mode-color-constant "Константа")
  (scheme-mode-color-parenthesis "Круглые скобки")
  (scheme-mode-color-hash-colon-keyword "#:Ключевое-слово")
  (scheme-mode-color-error "Ошибка")
  (scheme-mode-color-other "Другие") 
  ;; the ~a is filled in with one of the above (scheme-mode-*)
  (syntax-coloring-choose-color "Выберите цвет для ~a")
  (preferences-colors "Цвета") ;; used in the preferences dialog
  
  ;; parenthesis color scheme string constants
  ; label for the choice% menu in the preferences dialog
  (parenthesis-color-scheme "Выделение цветом круглых скобок") ;; label for the choice% menu in the preferences dialog
  (paren-color-basic-grey "Основной серый")
  (paren-color-shades-of-gray "Оттенки серого цвета")
  (paren-color-shades-of-blue "Оттенки голубого цвета")
  (paren-color-spring "Теплые оттенки")
  (paren-color-fall "Осенние оттенки")
  (paren-color-winter "Холодные оттенки")
 
   
  (url: "URL:")
  (open-url... "Открыть URL...")
  (open-url "Открыть URL")
  (browse... "Браузер...")
  (bad-url "Неверный URL")
  (bad-url:this "Неверный URL: ~a")
  
  ;; Help Desk
  (help "Справка")
  (racket-documentation "Документация Racket")
  (help-desk "Помощь")
  (plt:hd:search "Поиск")
  (plt:hd:feeling-lucky "Мне повезёт")
  (plt:hd:home "Домашняя страница справочного бюро") 
  ; next 3 are popup menu choices in help desk search frame
  (plt:hd:search-for-keyword "Искать в ключевых словах")
  (plt:hd:search-for-keyword-or-index "Искать в ключевых словах или в содержании")
  (plt:hd:search-for-keyword-or-index-or-text "Искать в ключевых словах, в содержании или тексте")
  (plt:hd:exact-match "Точное соответствие")
  (plt:hd:containing-match "Содержится упоминание")
  (plt:hd:regexp-match "Соответствие по регулярному выражению")
  (plt:hd:find-docs-for "Поиск документации по:")
  (plt:hd:search-stopped-too-many-matches "[Поиск прервался: слишком много совпадений]")
  (plt:hd:nothing-found-for "Для ~a не найдено")
  (plt:hd:and "и")
  (plt:hd:refresh "обновить")
  (plt:hd:refresh-all-manuals "обновить все руководства")
  (plt:hd:manual-installed-date "(инсталлировать ~a)")
  ; Help Desk configuration
  ;; refreshing manuals
  (plt:hd:refreshing-manuals "Перезагрузить руководства")
  (plt:hd:refresh-downloading... "Загрузить ~a...")
  (plt:hd:refresh-deleting... "Удалить старую версию ~a...")
  (plt:hd:refresh-installing... "Инсталировать новую версию ~a...")
  (plt:hd:refresh-clearing-indices "Очистить кешированные индексы")
  (plt:hd:refreshing-manuals-finished "Готово.")
  (plt:hd:about-help-desk "О помощи")
  (plt:hd:help-desk-about-string
   "Помощь - это полный источник информации о программном обеспечении PLT, включая DrRacket,"
   " MzScheme и MrEd.\n\nВерсия ~a\nCopyright (c) ~a-~a PLT")
  (plt:hd:help-on-help "Справка по справке")
  (plt:hd:help-on-help-details 
   "Для получения справки по использованию помощи, выберите первую ссылку `Помощь' на её домашней странице."
   " (Для перехода на домашнюю страницу нажмите кнопку `Домой' в верхней"
   " части окна помощи.)")
  (reload "Обновить") ;; refresh the page in a web browser
  (plt:hd:ask-about-separate-browser
    "Вы выбрали ссылку на данные из WWW."
    " Желаете ли Вы просмотреть их в браузере помощи"
    " или в окне внешнего браузера?")
  (plt:hd:homebrew-browser "Браузер помощи") ;; choice for the above string (in a button)
  (plt:hd:separate-browser "Внешний браузер") ;; other choice for the above string (also in a button)
  (plt:hd:external-link-in-help "Внешние ссылки в справке")
  (plt:hd:use-homebrew-browser "Использовать браузер помощи для внешних ссылок")
  (plt:hd:new-help-desk "Новое окно помощи")

  ;; in the Help Desk language dialog, title on the right.
  (plt:hd:manual-search-ordering "Руководство по поиску")
  
  ;; in the help-desk standalone font preference dialog, on a check box
  (use-drscheme-font-size "Использовать размер шрифта DrRacket")
  
  ;; in the preferences dialog in drscheme there is example text for help desk font size.
  ;; clicking the links in that text produces a dialog with this message
  (help-desk-this-is-just-example-text
   "Это пример текста для установки размера шрифта."
   " Откройте соответствующую помощь (из меню Справка) для перехода по этим ссылкам.")

  ;; this appears in the bottom part of the frame the first time the user hits `f1' 
  ;; (assuming nothing else has loaded the documentation index first)
  ;; see also: cs-status-loading-docs-index
  (help-desk-loading-documentation-index "Помощь: загрузка индекса документации")
  
  ;; the next four are all in the same dialog box (only one of the first two appears)
  (help-desk-materialize-docs-something-changed
   "DrRacket обнаружил возможную проблему с индексом"
   " документации. Попробовать исправить (это займёт немного"
   " времени)?\n\nЕсли конкретнее, каталог документации ~a не"
   " существует, поэтому поиск в браузере скорее всего не работает.")
  (help-desk-materialize-docs-first-time
   "DrRacket обнаружил возможную проблему с индексом"
   " документации. Попробовать исправить (это займёт немного"
   " времени)?\n\nЕсли конкретнее, DrRacket не материализовал"
   " документацию, поэтому поиск в браузере скорее"
   " всего не работает.")
  (help-desk-do-nothing "Ничего не делать")
  (help-desk-materialize-user-docs "Материализовать документацию")
  ; this is used in a dialog to let the user know that work is being done based on
  ; choices made from the previous dialog in the above four string constants
  (help-desk-materializing-user-docs... "Материализуется документация...")

  ;; Help desk htty proxy
  (http-proxy "HTTP-прокси")
  (proxy-direct-connection "Прямое подключение")
  (proxy-use-proxy "Использовать прокси:")
  (proxy-host "Узел")
  (proxy-port "Порт")
  (proxy-bad-host "Неверный прокси-узел")

  ;; browser
  (rewind-in-browser-history "Назад")
  (forward-in-browser-history "Вперед")
  (home "В начало")
  (browser "Браузер")
  (external-browser-choice-title "Внешний браузер") ; title for radio-button set
  (browser-command-line-label "Командная строка:") ; label for radio button that is followed by text boxes
  (choose-browser "Выбрать браузер")
  (no-browser "Выбрать позже")
  ; explanatory text for dialog, line 1
  (browser-cmdline-expl-line-1 "(Командная строка сформирована соединением  предшествующего текста, URL,") ; explanatory text for dialog, line 1
  ; ... line 2. (Anyone need more lines?)
  (browser-cmdline-expl-line-2 "и последующего текста.)") ; ... line 2. (Anyone need more lines?)
  (install? "Инсталлировать?")  ;; if a .plt file is found (title of dialog)
  (you-have-selected-an-installable-package "Вы выбрали устанавливаемый пакет.")
  (do-you-want-to-install-it? "Вы хотите инсталлировать его?")
  (paren-file-size "(Размер файла- ~a байт)")
  (download-and-install "Загрузить и инсталлировать") ;; button label
  (download "Загрузить") ;; button label
  (save-downloaded-file/size "Сохранить загруженные файлы (~a байт) как") ;; label for get-file dialog
  (save-downloaded-file "Сохранить загруженные файлы как")  ;; label for get-file dialog
  (downloading "Загрузка") ;; dialog title
  (downloading-file... "Загрузка файла...")
  (package-was-installed "Пакет инсталлирован.")
  (download-was-saved "Загруженные файлы сохранены.")

  (install-plt-file-menu-item... "Инсталлировать .plt-файл...")
  (install-plt-file-dialog-title "Инсталлировать .plt-файл")
  (install-plt-web-tab "Web")
  (install-plt-file-tab "Файл")
  (install-plt-filename "Имя файла:")
  (install-plt-url "URL:")
  ; an error message from a primitive operation is appended to the end of this message.
  (install-plt-error-downloading "Произошла ошибка при скачивании"
                                 " .plt-файла.\n\nПодробности:\n")
  (install-plt-error-header
   "Произошла ошибка при проверке целостности"
   " скачанного .plt-файла. Пожалуйста, проверьте адрес и попробуйте ещё раз.")
 
  ;; install plt file when opened in drscheme strings
  (install-plt-file "Инсталлировать ~a или открыть для редактирования?")
  (install-plt-file/yes "Инсталлировать")
  (install-plt-file/no "Редактировать")

  (plt-installer-progress-window-title "Ход инсталляции") ;; frame title
  (plt-installer-abort-installation "Процес инсталляции прерван") ;; button label
  ;; msg that appears in the installation window when installation is aborted
  (plt-installer-aborted "Прервано.")

  ;;; about box
  (about-drscheme-frame-title "О DrRacket")
 
  ;;; save file in particular format prompting.
  (save-as-plain-text "Сохранить этот файл в обычном текcтовом формате?")
  (save-as-binary-format "Преобразовать этот файл в специальный формат DrRacket, чтобы сохранить нетекстовые элементы?")
  (save-in-drs-format "Сохранить этот файл в специальном нетекстовом формате drscheme?")
  (keep-format "Сохранить (возможна потеря данных)")
  (convert-format "Преобразовать (рекоммендуется)")
  (dont-save "Не сохранять")
  (yes "Да")     
  (no "Нет")
 
  ;; saving image (right click on an image to see the text)
  (save-image "Сохранить рисунок...")
  
  ;;; preferences
  (preferences "Настройки пользователя")
  (error-saving-preferences "Ошибка сохранения настроек пользователя: ~a")
  (error-saving-preferences-title "Ошибка сохранения настроек пользователя")
  ;; in the preferences error dialog; this happens when the lockfile exists (after 3 pref writes).
  (steal-the-lock-and-retry "Снять блокировку и повторить")

  (error-reading-preferences "Ошибка чтения настроек пользователя")
  (error-reading-preferences-explanation
   "Файл настроек заблокирован, поэтому настройка ~a не может быть прочитана")
  ;; in the above, ~a is filled with the name of the preference (a symbol)
  (dont-ask-again-until-drracket-restarted "Больше не спрашивать (до перезапуска DrRacket)")
  ; difference between the above and below is one comes with a question (steal the lock or not)
  ;; and the other with just a notation saying "the file is locked"
  (dont-notify-again-until-drracket-restarted "Больше не напоминать (до перезапуска DrRacket)")
  (prefs-file-locked 
   "Файл настроек пользователя заблокирован (так как файл ~a существует),"
   " поэтому измененные настройки не будут сохранены. Отменить изменения?")
  (try-again "Попытаться снова") ;; button label
  (give-up-and-use-the-default "Прекратить и  использовать стандартные") ;; button label

  (prefs-file-still-locked 
   "Файл настроек пользователя все еще заблокирован (так как файл ~a существует),"
   " поэтому изменения настроек не будут сохранены.")
  (prefs-file-locked-nothing-doing
   "Файл настроек пользователя заблокирован (через ~s) поэтому изменения настроек не могут быть сохранены.")
  ;; the  ~s is filled with the lockfile; this string is (currently) used only on
  ;; windows where lockfiles are less friendly (and there is no steal fallback)

  (scheme-prefs-panel-label "Racket")
  (warnings-prefs-panel-label "Предупреждения")
  (editor-prefs-panel-label "Редактирование")
  (general-prefs-panel-label "Общее")
  (editor-general-prefs-panel-label "Общее редактирование")
  (highlight-parens "Подсвечивать парные скобки")
  (fixup-open-brackets "Автокорекция открывающихся квадратных скобок")
  (fixup-close-parens "Автокорекция закрывающихся скобок")
  (flash-paren-match "Отображать соответствие скобок")
  (backup-unsaved-files "Делать автосохранения")
  (first-change-files "Создавать файл с предыдущей версией")
  (map-delete-to-backspace "Назначить Delete на Backspace")
  (verify-exit "Проверять завершение")
  (ask-before-changing-format "Спрашивать перед изменением формата")
  (wrap-words-in-editor-buffers "Переносить слова в буферах редактора")
  (show-status-line "Показать строку состояния")
  (count-columns-from-one "Считать номера столбцов, начиная с 1")
  (display-line-numbers "Отображать номера строк в буфере (нет смещения символов)")
  ; used for popup menu; right click on line/column box in bottom of drs window
  (show-line-and-column-numbers "Показывать номера строк и столбцов")
  ; used for popup menu; right click on line/column box in bottom of drs window
  (show-character-offsets "Показывать смещение символов")
  (enable-keybindings-in-menus "Разрешить сочетания клавиш в меню")
  (printing-mode "Режим печати")
  (print-using-platform-specific-mode "Печать определяется платформой")
  (print-to-ps "Печать в файл PostScript")
  (print-to-pdf "Печать в файл PDF")
  (command-as-meta "Считать командную клавишу мета-клавишей") ;; macos/macos x only
  (any-control+alt-is-altgr "Трактовать комбинацию Control-Alt как AltGr") ; Windows only
  (alt-as-meta "Трактовать кнопку alt как meta")
  (reuse-existing-frames "Использовать существующие окна при открытии новых файлов")
  (default-fonts "Шрифты по умолчанию")
  (basic-gray-paren-match-color "Выделять парные скобки серым цветом") ; in prefs dialog
  (online-coloring-active "Интерактивная подсветка синтаксиса")
  (open-files-in-tabs "Открывать файлы в отдельных вкладках (не отдельных окнах)")
  (restore-open-files-from-previous-session? "Восстанавливать открытые файлы из предыдущей сессии?")
  (startup-open-files "Открывать файлы при запуске")
  (restore-open-files-from-previous-session "Восстановить открытые файлы из предыдущей сессии")
  (ask-me-each-time "Всегда спрашивать")
  (open-a-blank-window "Открывать пустое окно")
  (show-interactions-on-execute "Автоматически открывать окно интерпретатора при запуске программы")
  (switch-to-module-language-automatically 
   "Автоматически переключаться на язык модуля при открытии модуля")
  ;; in preferences, below the checkbox one line above this one
  (interactions-beside-definitions "Размещать окно интерпретатора возле окна определений")
  (show-line-numbers "Показывать номера строк")
  ;; just like the above, but capitalized for appearance in a menu item
  (show-line-numbers/menu "Показать &номера строк")
  (hide-line-numbers/menu "Скрыть &номера строк")
  (show-line-numbers-in-definitions "Показывать все номера строк в окнах определений")
  ;; the constant above shows up in the popup menu item in the bottom of
  ;; the drracket window; controls the line numbers on each line in the definitions;
  ;; used in a checkable menu item
  ;; Capitalized for appearance in a menu item
  (show-indent-guides/menu "Показать &линии отступа")
  (hide-indent-guides/menu "Скрыть &линии отступа")
  (reflow-paragraph-maximum-width "Максимальная ширина переформирования абзацев")
  (maximum-char-width-guide-pref-check-box "Линия, показывающая максимальную ширину")
  (hide-column-width-guide "Скрыть линию, показывающую максимальную ширину, для файлов с ~a колонками")
  (show-column-width-guide "Показать линию, показывающую максимальную ширину, для файлов с ~a колонками") ;; filled with a number > 2
  (limit-interactions-size "Ограничить размер программы")
  ;; this is in the color section already, so shorten the name a little
  (background-color "Цвет фона")
  ;; used for configuring colors, but doesn't need the word "color"
  (default-text-color "Цвет текста по умолчанию") ;; used for configuring colors, but doesn't need the word "color"
  (choose-a-background-color "Пожалуйста, выберите цвет фона")
  (revert-to-defaults "Вернуться к значению по умолчанию")
  ;; used in the preferences dialog to undo preference changes
  (undo-changes "Отменить изменения и закрыть")

  (color-schemes "Цветовые схемы") ;; the label in the preferences dialog for the color scheme panel
  (classic-color-scheme "Классическая") ;; formerly called 'black on white'
  (modern-color-scheme "Современная")   ;; an attempt to be more color-blind friendly
  ;; clicking the buttons changes the color schemes to some defaults that've been set up.
  (white-on-black-color-scheme "Белый на чёрном")
  ; drracket additions to the color scheme dialog; two buttons
  (design-your-own-color-schemes "Разработайте свою собсвтенную цветовую схему") ; pointer to (english-only) docs
  (style-and-color-names "Имена стилей и цветов")

  (add-spacing-between-lines "Добавить один дополнительный пиксель между строками")

  (editor-x-selection-mode "Требовать явную операцию копирования перед"
                           " вставкой / Не копировать автоматически выделение")

  ; should have entire alphabet
  (font-example-string "Съешь ещё этих мягких французских булок, да выпей же чаю.")

  (change-font-button-label "Изменить")
  (fonts "Шрифты")
  (other... "Другой...") ;; used in the font choice menu item

  ; filled with type of font, eg modern, swiss, etc.
  (choose-a-new-font "Пожалуйста, выберите новый \"~a\" шрифт")

  (font-size-slider-label "Размер")
  (restart-to-see-font-changes "Перезапустите, чтобы увидеть смену типа шрифта")

  (font-prefs-panel-title "Шрифт")
  (font-name "Имя шрифта")
  (font-size "Размер шрифта")
  (set-font "Установить шрифт...")
  (font-smoothing-label  "Сглаживание шрифтов")
  (font-smoothing-none "Отсутствует")
  (font-smoothing-some "Для некоторых")
  (font-smoothing-all "Для всех")
  (font-smoothing-default "Использовать системные установки")
  (font-weight-label "Weight")
  (font-weight-light "Light")
  (font-weight-normal "Normal")
  (font-weight-bold "Bold")

  (select-font-name "Выбор имени шрифта")
  (example-text "Пример текста:")
  (only-warn-once "Предупреждать только раз о том, что определения и вызовы не синхронизированы")
 
  ; font size menu items in the 'view' menu; the ~a is filled with a number (font size)
  (increase-font-size "Увеличить размер шрифта (до ~a)")
  (decrease-font-size "Уменьшить размер шрифта (до ~a)")

  ; warning message when lockfile is around
  (waiting-for-pref-lock "Ожидание завершения блокировки настроек пользователя...")
  (pref-lock-not-gone
   "Файл блокировки настроек пользователя: \n\n   ~a\n\nне позволяет сохранить изменения настроек."
   " Убедитесь в отсутствии работающего програмного обеспечения Racket и удалите этот файл.")
  (still-locked-exit-anyway? "Настройки не сохранены. Все равно выйти?")
 
  ;;; indenting preferences panel
  (indenting-prefs-panel-label "Выравнивание")
  (indenting-prefs-extra-regexp "Дополнительные регулярные выражения")

  (square-bracket-prefs-panel-label "Квадратные скобки")
  
  ; filled with define, lambda, or begin
  (enter-new-keyword "Введите новое ~a-подобное ключевое слово:")
  (x-keyword "~a ключевое слово")
  (x-like-keywords "~a-подобное ключевое слово")

  ; used in Square bracket panel
  (skip-subexpressions "Количество подвыражений, которые будут пропущены")

  (expected-a-symbol "ожидается символ,  найдено: ~a")
  (already-used-keyword "\"~a\" -уже используется как ключевое слово")
  (add-keyword "Добавить")
  (remove-keyword "Удалить")
 
  ; repl color preferences
  (repl-colors "REPL")
  (repl-out-color "Вывод")
  (repl-value-color "Значения")
  (repl-error-color "Ошибки")
  
  ;;; find/replace
  (search-next "Далее")
  (search-previous "Назад")
  (search-match "Совпадение")  ;;; this one and the next one are singular/plural variants of each other
  (search-matches "Совпадения") 
  (search-replace "Заменить")
  (search-skip "Пропустить")
  (search-show-replace "Показать замены")
  (search-hide-replace "Скрыть замены")
  (find-case-sensitive "Учитывать регистр")  ;; the check box in both the docked & undocked search
  (find-anchor-based "Искать, используя привязки")

  ;; these string constants used to be used by searching,
  ;; but aren't anymore. They are still used by other tools, tho.
  (hide "Скрыть")
  (dock "Прикрепить")
  (undock "Открепить")
  
  ;;; multi-file-search
  (mfs-multi-file-search-menu-item "Поиск в &файлах...")
  (mfs-string-match/graphics "Соответствие строк (обрабатывать файлы с графикой)")
  (mfs-regexp-match/no-graphics "Регулярные выражения (только для неформатированных текстовых файлов)")
  (mfs-searching... "Поиск...")
  (mfs-configure-search "Настройки поиска") ;; dialog title
  (mfs-files-section "Файлы")   ;; section in config dialog
  (mfs-search-section "Поиск") ;; section in config dialog
  (mfs-dir "Каталог")
  (mfs-recur-over-subdirectories "Искать во вложенных каталогах")
  (mfs-regexp-filename-filter "Фильтровать имена файлов по регулярных выражениях")
  (mfs-search-string "Искать строки")
  (mfs-drscheme-multi-file-search "многофайловый поиск - DrRacket") ;; results window and error message title
  (mfs-not-a-dir "\"~a\" не каталог")
  (mfs-open-file "Открыть файл")
  (mfs-stop-search "Остановить поиск")
  (mfs-case-sensitive-label "Учитывать регистр")
  (mfs-no-matches-found "Совпадения не найдены.")
  (mfs-search-interrupted "Поиск прерван.")
  ;; the ~a format specifier is filled in with the search string
  (mfs-drscheme-multi-file-search-title "Многофайловый поиск «~a» - DrRacket")
 
  ;;; reverting a file
  (are-you-sure-revert
   "Вы действительно уверены, что хотите вернуться к предыдущей версии файла? Внесенные изменения невозможно будет восстановить.")
  (are-you-sure-revert-title
   "Открыть заново?")
 
  ;;; saving a file
  ; ~a is filled with the filename
  (error-saving "Ошибка при сохранении") ;; title of error message dialog
  (error-saving-file/name "При сохранении произошла ошибка ~a.")
  (error-loading "Ошибка открытия")
  (error-loading-file/name "При открытии произошла ошибка ~a.")
  (unknown-filename "<< неизвестный >>")

  ;;; finder dialog
  (must-specify-a-filename "Определите имя файла")
  (file-does-not-exist "Файл \"~a\" не существует.")
  (ask-because-file-exists "Файл \"~a\" уже существует. Заменить его?")
  (dne-or-cycle "Файл \"~a\" содержит несуществующий каталог или цикл.")
  (get-file "Получить файл")
  (put-file "Поместить файл")
  (full-pathname "Полное имя")
  (show-dot-files "Показать файлы и каталоги, которые начинаются с точки.")
  (up-directory-button-label "В предыдущий каталог")
  (add-button-label "Добавить") ;;; for multi-file selection
  (add-all-button-label "Добавить все") ;;; for multi-file selection
  (remove-button-label "Удалить") ;;; for multi-file selection
  (file-wrong-form "Это имя Файла имеет неправильную форму.")
  (select-files "Выбор файлов")
  (select-file "Выбор файла")
  (dir-dne "Каталог не существует.")
  (file-dne "Файл не существует.")
  (empty-filename "Имя файла должно содержать символы.")
  (that-is-dir-name "Это имя каталога.")
  (use-platform-specific-file-dialogs "Использовать платформенный диалог открытия файла") ;; a preferences option
  
  ;;; raw menu names -- these must match the 
  ;;; versions below, once the &s have been stripped.
  ;;; if they don't, DrRacket's menus will appear
  ;;; in the wrong order.
  (file-menu "Файл")
  (edit-menu "Правка")
  (help-menu "Справка")
  (windows-menu "Окна")
  (tabs-menu "Вкладки") ;; this is the name of the "Windows" menu under linux & windows
 
  ;;; menus
  ;;; - in menu labels, the & indicates a alt-key based shortcut.
  ;;; - sometimes, things are stuck in the middle of 
  ;;; menu item labels. For instance, in the case of
  ;;; the "Сохранить как" menu, you might see: "Сохранить определения как". 
  ;;; be careful of spacing, follow the English, if possible.
  ;;; - the ellipses in the `after' strings indicates that
  ;;; more information is required from the user before completing
  ;;; the command.

  (file-menu-label "&Файл")

  (new-info  "Открыть новый файл")
  (new-menu-item "&Новый")
  (new-...-menu-item "&Новый...")

  (open-info "Открыть файл с диска")
  (open-menu-item "&Открыть...")

  (open-recent-info "Список последних открытых файлов")
  (open-recent-menu-item "Открыть &последние")

  (revert-info "Заменить файл сохраненным на диске")
  (revert-menu-item "Пе&реоткрыть")

  (save-info "Сохранить этот файл на диск")
  (save-menu-item "&Сохранить")

  (save-as-info "Указать имя файла и сохранить этот файл на диск")
  (save-as-menu-item "Сохранить &как...")

  (print-info "Отправить файл на печать")
  (print-menu-item "&Печать...")

  (page-setup-info "Выбор конфигурации параметров печати")
  (page-setup-menu-item "Параметры страницы...")
 
  (close-info "Закрыть файл")
  (close-menu-item "&Закрыть")
  (close-window-menu-item "&Закрыть окно")

  (quit-info "Закрыть все окна")
  (quit-menu-item-windows "&Выход")
  (quit-menu-item-others "&Выход")
 
  (edit-menu-label "&Правка")
 
  (undo-info "Отменить последнее действие")
  (undo-menu-item "О&тменить")

  (redo-info "Вернуть последнее действие")
  (redo-menu-item "Вер&нуть")

  (cut-info "Переместить выбранные элементы в буфер обмена для дальнейшей вставки")
  (cut-menu-item "Вы&резать")

  (copy-info "Копировать выбранные элементы в буфер обмена для дальнейшей вставки")
  (copy-menu-item "&Копировать")

  (paste-info "Вставить последний скопированный или вырезанный элемент вместо выбранных элементов")
  (paste-menu-item "Вс&тавить")
  (paste-and-indent-menu-item "Вставить с отступом")

  (clear-info "Удалить выделенные элементы без изменения буфера или вставки")
  (clear-menu-item-windows "&Удалить")

  (select-all-info "Выделить весь документ")
  (select-all-menu-item "Выделить вс&е")
 
  (find-menu-item "Найти") ;; menu item
  (find-from-selection-menu-item "Найти из в&ыделенного")
  (find-info "Переключает клавиатурный фокус между окном, в котором он выполняется, и панелью поиска")
  
  (find-next-info "Найти следующее вхождение")
  (find-next-menu-item "Найти далее")
  
  (find-previous-info "Найти предыдущее вхождение")
  (find-previous-menu-item "Найти предыдущее")
  
  (show-replace-menu-item "Показать замены")
  (hide-replace-menu-item "Скрыть замены")
  (show/hide-replace-info "Переключить видимость панели замены")

  (replace-menu-item "Заменить")
  (replace-info "Заменить искомое")
  
  (replace-all-info "Заменить все вхождения")
  (replace-all-menu-item "Заменить все")
  
  (find-case-sensitive-info "Переключиться между зависящим и независящим от регистра поиском")
  (find-case-sensitive-menu-item "Искать с учетом регистра")
  
  (complete-word "Завершения слов") ; the complete word menu item in the edit menu
  ; shows up in the completions menu when there are no completions (in italics)
  (no-completions "... завершения недоступны")

  (overwrite-mode "Режим замены")
  (enable-overwrite-mode-keybindings "Разрешить переключение в режим замены сочетанием клавиш")  
  
  (enable-automatic-parens "Включить автоматические скобки, квадратные скобки и кавычки")

  (preferences-info "Конфигурация Ваших настроек")
  (preferences-menu-item "Настройки пользователя...")

  (keybindings-info "Показать активные сочетания клавиш")
  (keybindings-menu-item "Сочетания клавиш")
  (keybindings-show-active "Показать активные сочетания клавиш")
  (keybindings-frame-title "Сочетания клавиш")
  (keybindings-sort-by-name "Сортировать по имени")
  (keybindings-sort-by-key "Сортировать по ключу")
  (keybindings-add-user-defined-keybindings "Добавить определенные пользователем сочетания клавиш...")
  (keybindings-add-user-defined-keybindings/planet "Добавить определенные пользователем сочетания клавиш из PLaneT...")
  (keybindings-menu-remove "Удалить ~a")
  (keybindings-choose-user-defined-file "Пожалуйста, выберите файл, содержащий сочетания клавиш.")
  ; the string will be what the user typed in
  (keybindings-planet-malformed-spec "Неверные настройки PLaneT: ~a")
  (keybindings-type-planet-spec "Пожалуйста, введите необходимые настройки PLaneT")
  
  ; first ~a will be a string naming the file or planet package where the keybindings come from;
  ; second ~a will be an error message
  (keybindings-error-installing-file "Ошибка при инсталляции сочетаний клавиш ~a:\n\n~a")
  
  (user-defined-keybinding-error "Ошибка выполнения сочетания клавиш ~a\n\n~a")
  (user-defined-keybinding-malformed-file 
   "Файл ~a не содержит модуля, написанного на языке оболочки/сочетаний клавиш.")  
  (user-defined-keybinding-malformed-file/found-lang 
   "Файл ~a не содержит модуля, написанного на языке"
   " оболочки/сочетаний клавиш. Найден язык ~s")   
 
  ;; menu items in the "special" menu
  (insert-text-box-item "Вставить текстовый блок")
  (insert-image-item "Вставить рисунок...")
  (insert-comment-box-menu-item-label "Вставить комментарий")
  (insert-lambda "Вставить λ")

  (wrap-text-item "Переносить текст")

  ;; windows menu
  (windows-menu-label "О&кна")
  (tabs-menu-label "В&кладки") ;; this is the name of the menu under linux & windows
  (minimize "Свернуть") ;; minimize and zoom are only used under mac os x
  (zoom "Изменить размер")
  (bring-frame-to-front "Показать поверх всех окон")       ;;; title of dialog
  (bring-frame-to-front... "Показать поверх всех окон...") ;;; corresponding title of menu item
  (most-recent-window "Последнее окно")
  (next-tab "Следующая вкладка")
  (prev-tab "Предыдущая вкладка")
  (move-current-tab-right "Сдвинуть вкладку в&право")
  (move-current-tab-left "Сдвинуть вкладку в&лево")
  ;; menu item in the windows menu under mac os x. first ~a is filled
  ;; with anumber between 1 and 9; second one is the filename of the tab
  (tab-i "Вкладка ~a: ~a")
  (tab-i/no-name "Вкладка ~a")
  (last-tab "Последняя вкладка: ~a")

  (view-menu-label "В&ид")
  (show-overview "Показать Ко&нтур программы") 
  (hide-overview "Скрыть Ко&нтур программы")
  (show-module-browser "Показать &Браузер модулей")
  (hide-module-browser "Скрыть &Браузер модулей")

  (help-menu-label "&Справка")
  (about-info "Сведения об авторах и подробностях применения программы")
  (about-menu-item "О программе...")
 
  ;; open here's new menu item
  (create-new-window-or-clear-current
   "Хотите ли Вы создать новое окно или очистить текущее?")
  (clear-current "Очистить текущее")
  (new-window "Новое окно")

  ;; popup menu when right-clicking in the gap between
  ;; the definitions and interactions window
  (change-to-vertical-alignment "Изменить на вертикальное")
  (change-to-horizontal-alignment "Изменить на горизонтальное")

  ;;; exiting and quitting ``are you sure'' dialog
  ;;; exit is used on windows, quit on macos, in English. Other
  ;;; languages probably use the same word on both platforms.
  (exit "Выход")
  (quit "Выход")
  (are-you-sure-exit "Вы уверены, что хотите выйти?")
  (are-you-sure-quit "Вы уверены, что хотите выйти?")
  ; these next two are only used in the quit/exit dialog
  ; on the button whose semantics is "dismiss this dialog".
  ; they are there to provide more flexibility for translations
  ; in English, they are just cancel.
  (dont-exit "Отмена") 
  (dont-quit "Отмена")
  
  ;;; autosaving
  (error-autosaving "Ошибка автосохранения \"~a\".") ;; ~a will be a filename
  (autosaving-turned-off "Автосохранение отключено\nво время записи файла.")
  (recover-autosave-files-frame-title "Восстановить файлы")
  (autosave-details "Подробности")
  (autosave-recover "Восстановлен")
  (autosave-unknown-filename "<<неизвестный>>")
  
  ;;; autoloading
  ;; the ~a is replaced with a path
  (autoload-file-changed-on-disk/with-name
   "Файл:\n  ~a\nизменился на диске. Вы хотите"
   " перечитать содержимое буфера, чтобы оно соответствовало файлу на диске?")
  ;; One file per line is appended to the end of this message
  (autoload-files-changed-on-disk/with-name
   "Некоторые файлы изменились на диске. Вы хотите перечитать"
   " содержимое их буферов, чтобы оно соответствовало файлам на диске?\n\nИзменённые файлы:")
  ;; the ~a is replaced with a path
  (autoload-file-changed-on-disk-editor-dirty/with-name
   "Файл:\n  ~a\nизменился на диске и модифицирован в редакторе."
   " Вы хотите перечитать содержимое буфера, чтобы оно соответствовало файлу на диске?")
  ;; One file per line is appended to the end of this message
  (autoload-files-changed-on-disk-editor-dirty/with-name
   "Некоторые файлы изменились на диске и они были and модифицированы в редакторе."
   " Вы хотите перечитать содержимое их буферов, чтобы оно соответствовало файлам"
   " на диске?\n\nИзменённые файлы:")
  ;; One file per line is appended to the end of this message
  (autoload-files-changed-on-disk-editor-dirty&clean/with-name
   "Some files have changed on the disk and some of them are also modified in the editor."
   " Do you want to revert their buffers’ contents to match the files on"
   " disk?\n\nFiles changed (a ◇ indicates that the editor’s version is modified):")
  ;; a specialized version of dont-ask-again-always-current
  (dont-ask-again-always-current/clean-buffer
   "Больше не спрашивать про отредактированные несохранённые файлы (всегда использовать текущий выбор)")

  (autoload-automatically-reload "Автоматически перезагружать изменённые файлы")
  (autoload-when-the-editor-isnt-dirty "Если не были отредактированы")
  (autoload-never-revert "Никода")
  (autoload-ask-about-reverting "Всегда спрашивать")

  ;; these are labels in a dialog that drscheme displays
  ;; if you have leftover autosave files. to see the dialog,
  ;; start up drscheme and modify (but don't save) a file
  ;; (also, do this with an unsaved file). Wait for the autosave
  ;; files to appear (typically 5 minutes). Kill DrRacket
  ;; and restart it. You'll see the dialog
  (autosave-autosave-label: "Резервный файл:")
  (autosave-original-label: "Исходный файл:")
  (autosave-autosave-label "Резервный файл")
  (autosave-original-label "Исходный файл")
  (autosave-compare-files "Сравнить резервные файлы")

  (autosave-show-autosave "Резервный файл") ;; title of a window showing the autosave file

  (autosave-explanation "DrRacket нашел резервные файлы, которые могут содержать несохраненную работу.")

  (autosave-recovered! "Восстановлено!") ;; status of an autosave file
  (autosave-deleted "Удалить")       ;; status of an autosave file

  ;; first is a filename, second is an error message from racket.
  (autosave-error-deleting "Ошибка удаления ~a\n\n~a")
  (autosave-delete-button "Удалить")
  (autosave-delete-title "Удалить")  ;; title of a dialog asking for deletion confirmation
  (autosave-done "Завершено")
  
  ;; appears in the file dialog
  (autosave-restore-to-where? "Выберите место для записи резервного файла.")
  
  ;;; file modified warning
  (file-has-been-modified
   "Файл был изменен после последнего сохранения. Отменить изменения?")
  (overwrite-file-button-label "Перезаписать")
 
  (definitions-modified 
   "Текст файла определений был изменен."
   " Пожалуйста, сохраните или переоткройте определения.")

  ;; for a dialog that appears when Run is clicked and there are unsaved files
  ; the ~a is filled with a filename (same string that appears in a tab)
  (one-file-not-saved-do-the-save?
   "Файл «~a» не сохранён; сохранить перед выполнениием?")
  ; the string is suffixed with a list of filenames (which are separated by newlines)
  (many-files-not-saved-do-the-save?
   "Некоторые другие файлы не сохранены; сохранить их перед выполнениием?\n\nFiles:")
  ; button label to go ahead with saving
  (save-all-files "Сохранить все файлы")
  ; check box in the dialog and also used in the preferences dialog
  (save-after-switching-tabs "Сохранять файлы при смене вкладок или окон")
  (dont-ask-about-saving-after-switching-tabs
   "Не спрашивать и не сохранять при нажатии Выполнить и наличии несохранённых вкладок или окон")
  
  (drscheme-internal-error "Внутренняя ошибка DrRacket")
 
  ;;; tools
  (invalid-tool-spec 
   "Некорректный файл info.rkt, содержащий описание инструмента в коллекции ~a."
   " Ожидается строка или непустой список строк, получено: ~e")
  (error-invoking-tool-title "Ошибка вызова инструмента ~s;~s")
  ;; ~s filled with a path, ~a filled with an error message from an exn
  (error-loading-tool-title "Ошибка загрузки инструмента ~s\n~a")
  (tool-tool-names-same-length
   "В файле info.rkt для ~s ожидается, что `tool-names' и `tools' - списки равной"
   " длины, получено ~e и ~e")
  (tool-tool-icons-same-length
   "В файле info.rkt для ~s ожидается, что `tool-icons' и `tools' - списки равной"
   " длины, получено ~e и ~e")
  (tool-tool-urls-same-length
   "В файле info.rkt для ~s ожидается, что `tool-urls' и `tools' - списки равной"
   " длины, получено ~e и ~e")
  (error-getting-info-tool
   "ошибка при загрузке файла info.rkt для ~s")
  (tool-error-phase1 "Ошибка на 1 этапе для инструмента ~s; ~s")
  (tool-error-phase2 "Ошибка на 2 этапе для инструмента ~s; ~s")
  ;; tool preferences panel
  (tool-config-changes
   "Изменения в настройке инструментво вступят в силу после перезапуска DrRacket.")
  (installed-tools "Установленные инструкменты")
  (tool-prefs-panel-tool:-label "Инструмент: ")
  (tool-prefs-panel-title "Инструменты")
  (load-tool-when-drracket-starts? "Загрузить инструмент при запуске DrRacket?")
  (load-tool-load "Загрузить инструмент")
  (load-tool-skip "Пропустить инструмент")
  (unnamed-tool "безымянный инструмент ~a")
  (note-that-tool-loaded " (загружен)")
  (note-that-tool-was-skipped " (пропущен)")
  (note-that-tool-failed-to-load " (не удалось загрузить)")

  ;;; define popup menu
  (end-of-buffer-define "<< конец буфера >>")
  (sort-by-name "Упорядочить по имени")
  (sort-by-position "Упорядочить по позиции в файле")
  (no-definitions-found "<< определения не найдены >>")
  (jump-to-defn "Перейти к определению ~a")
  (define-menu-configure "Настроить") ;; label of a submenu to configure the (define ...) popup menu

  (recent-items-sort-by-age "Упорядочить по времени")
  (recent-items-sort-by-name "Упорядочить по имени")
 
  ;;; view menu
  (hide-definitions-menu-item-label "Скрыть окно о&пределений")
  (show-definitions-menu-item-label "Показать окно о&пределений")
  (definitions-menu-item-help-string "Показать/Скрыть окно определений")
  (show-interactions-menu-item-label "Показать окно &интерпретатора")
  (hide-interactions-menu-item-label "Скрыть окно &интерпретатора")
  (use-horizontal-layout "Использовать горизонтальное расположение")
  (use-vertical-layout "Использовать вертикальное расположение")
  (interactions-menu-item-help-string "Показать/Скрыть окно интерпретатора")
  (toolbar "Панель инструментов")
  (toolbar-on-top "Панель инструментов сверху")
  (toolbar-on-top-no-label "Панель инструментов сверху с маленькими кнопками")
  (toolbar-on-left "Панель инструментов слева")
  (toolbar-on-right "Панель инструментов справа")
  (toolbar-hidden "Скрыть панель инструментов")

  ;;; file menu
  (save-definitions-as "Сохранить определения &как...")
  (save-definitions "Сохранить определения")
  (print-definitions "Печать определений...")
  (about-drscheme "О DrRacket")
  (save-other "Другие способы сохранения")
  (save-definitions-as-text "Сохранить определения как текст...")
  (save-interactions "Сохранить окно интерпретатора")
  (save-interactions-as "Сохранить окно интерпретатора как...")
  (save-interactions-as-text "Сохранить окно интерпретатора как текст...")
  (print-interactions "Печатать окно интерпретатора...")
  (new-tab "Новая вкладка")
  (close-tab "Закрыть вкладку") ;; must not have any &s in it.
  ;; like close-tab, but with an ampersand on the same letter as the one in close-menu-item
  (close-tab-amp "&Закрыть вкладку")
  (reopen-closed-tab "Открыть закрытую вкладку")
  
  ;;; edit-menu
  (split-menu-item-label "&Разделить")
  (collapse-menu-item-label "&Обьединить")
  (find-longest-line "Найти самую длинную строку")
 
  ;;; language menu
  (language-menu-name "&Язык")
 
  ;;; scheme-menu
  (scheme-menu-name "&Racket")
  (execute-menu-item-label "Выполнить")
  (execute-menu-item-help-string "Перезапустить программу в окне определений")
  (ask-quit-menu-item-label "Прервать программу")
  (ask-quit-menu-item-help-string 
    "Прервать выполняющуюся программу при помощи break-thread")
  (force-quit-menu-item-label "Принудительно выйти из программы")
  (force-quit-menu-item-help-string "Прервать все текущие вычисления при помощи custodian-shutdown-all")
  (limit-memory-menu-item-label "Ограничение по памяти...")
  (limit-memory-msg-1 "Ограничение станет действовать после следующего запуска программы")
  (limit-memory-msg-2 "Для выполнения необходимо не менее восьми мегабайт.")
  (limit-memory-unlimited "Без ограничений")
  (limit-memory-limited "С ограничением")
  (limit-memory-megabytes "Мегабайт")
  ; the next two constants are used together in the limit memory dialog; they are inserted
  ; one after another. The first one is shown in a bold font and the second is not.
  ; (the first can be the empty string)
  (limit-memory-warning-prefix "Предупреждение: ")
  (limit-memory-warning
   "настройка без ограничения небезопасна. С этой настройкой"
   " DrRacket не сможет защитить себя от програм, которые используют слишком много памяти, и DrRacket может упасть.")

  (clear-error-highlight-menu-item-label "Очистить выделение ошибок")
  (clear-error-highlight-item-help-string "Убирает выделение ошибок розовым фоном")
  (jump-to-next-error-highlight-menu-item-label "Перейти к следующей подсвеченной ошибке")
  (jump-to-prev-error-highlight-menu-item-label "Перейти к предыдущей подсвеченной ошибке")
  (reindent-menu-item-label "&Выровнять")
  (reindent-all-menu-item-label "Выровнять &все")
  (semicolon-comment-out-menu-item-label "&Закомментировать выделенное точкой с запятой")
  ;; the ~a is filled with the characters that'll be used to comment out a line,
  ;; inserted at the start of the line
  (comment-out-with-line-start "&Закомментировать с «~a»")
  ;; the two '~a's are filled with the characters that'll be used to comment out
  ;; the start and end of a region
  (comment-out-with-region "&Закомментировать с «~a» and «~a»")
  (box-comment-out-menu-item-label "&Закомментировать весь блок")
  (uncomment-menu-item-label "&Раскомментировать")

  (convert-to-semicolon-comment "Преобразовать в комментарий с точкой с запятой")
 
  ;;; executables
  (create-executable-menu-item-label "Создать исполняемый файл...")
  (create-executable-title "Создать исполняемый файл")
  (drracket-creates-executables-only-in-some-languages
   "Создание исполняемых файлов в DrRacket поддерживается только если"
   " вы выбрали один из учебных языков (DMdA или HtDP) в диалоге"
   " выбора языка DrRacket или если вы выбрали «Язык Racket» в диалоге"
   " выбора языка DrRacket и строка #lang в начале вашей программы"
   " указывает язык.\n\nПопробуйте вместо этого использовать"
   " инструмент командной строки raco exe.")
  (must-save-before-executable "Вы должны сохранить свою программу прежде, чем создать исполняемый файл.")
  (save-a-mred-launcher "Сохранить запускаемым в графической оболочке")
  (save-a-mzscheme-launcher "Сохранить запускаемым в текстовой оболочке")
  (save-a-mred-stand-alone-executable "Сохранить автономный исполняемый файл с графическим интерфейсом")
  (save-a-mzscheme-stand-alone-executable "Сохранить автономный исполняемый файл с текстовым интерфейсом")
  (save-a-mred-distribution "Сохранить дистрибутив с графическим интерфейсом")
  (save-a-mzscheme-distribution "Сохранить дистрибутив с текстовым интерфейсом")
  ;; this is suffixed with an error message ala error-display-handler
  (error-creating-executable "Ошибка создания исполняемого файла:")

  (definitions-not-saved 
   "Окно определений не было сохранено.  Исполняемая программа будет"
   " использовать последнюю сохраненную версию окна определений. Продолжить?")
  ;; The "-explanatory-label" variants are the labels used for the radio buttons in
  ;;  the "Create Executable..." dialog for the "(module ...)" language.
  (launcher "Запуск в оболочке")
  (launcher-explanatory-label "Запуск в оболочке (только для текущего компьютера, выполнение исходного файла)")
   (stand-alone "Автономный")
  (stand-alone-explanatory-label "Автономный (только для текущего компьютера, выполнение скомпилированной копии)")
  (distribution "Дистрибутив")
  (distribution-explanatory-label "Дистрибутив (для установки на других машинах)")
  (embed-dlls? "Встроить библиотеки DLL в исполняемый файл?") ;; appears in the GUI only under windows
  (executable-type "Тип")
  (executable-base "База")
  (filename "Имя файла: ")
  (create "Создать")
  (files-for-icons-etc "Файлы для иконок и т. д.")
  (please-specify-a-filename "Пожалуйста, определите имя создаваемого файла.")
  (~a-must-end-with-~a
   "Имя ~a файла\n\n  ~a\n\nнеправильное. Имя файла должно заканчиваться \".~a\".")
  (macosx-executables-must-end-with-app
   "Имя файла\n\n  ~a\n\nнеправильное. Для Mac OS исполняемая программа"
   " должна быть каталогом, имя которого заканчивается .app.")
  (warning-directory-will-be-replaced
   "Предупреждение: каталог:\n\n  ~a\n\nбудет заменен. Продолжить?")
 
  (distribution-progress-window-title "Создание дистрибутива")
  (creating-executable-progress-status "Создание исполняемых файлов для дистрибутива...")
  (assembling-distribution-files-progress-status "Сборка файлов для дистрибутива...")
  (packing-distribution-progress-status "Упаковка дистрибутива...")

  (create-servlet "Создать сервлет...")

  ; the ~a is a language such as "module" or "algol60"
  (create-servlet-unsupported-language
   "Создание сервлета не поддерживается языком ~a.")
  
  ;;; buttons
  (execute-button-label "Выполнить")
  (execute-button-configure-label "Выполнить настройку")
  (save-button-label "Сохранить")
  (break-button-label "Остановить")
  (break-button-kill-label "Прервать")

  ;;; search help desk popup menu
  (search-help-desk-for "Поиск в помощи для \"~a\"")
  (exact-lucky-search-help-desk-for "Точный поиск в помощи для \"~a\"")
 
  ;; collapse and expand popup menu items
  (collapse-sexp "Свернуть S-выражение")
  (expand-sexp "Развернуть S-выражение")
  
  ;;; fraction dialog
  (enter-fraction "Введите дробь")
  (whole-part "Целая часть")
  (numerator "Числитель")
  (denominator "Знаменатель")
  (insert-number/bad-whole-part "Целая часть числа должна быть целым числом")
  (insert-number/bad-numerator 
   "Числитель должен быть целым неотрицательным числом")
  (insert-number/bad-denominator 
   "Знаменатель должен быть целым положительным числом")
  (insert-fraction-menu-item-label "Вставить дробь...")

  ;; number snip popup menu
  (show-decimal-expansion "Показать десятичной дробью")
  (show-mixed-fraction-view "Показать смешанной дробью")
  (show-improper-fraction-view "Показать неправильной дробью")
  (show-more-decimal-places "Показать больше позиций после десятичной точки")
 
  ;;; Teachpack messages
  (select-a-teachpack "Выбрать учебный пакет")
  (clear-teachpack "Очистить учебный пакет ~a")
  (teachpack-error-label "DrRacket - ошибка учебного пакета")
  (teachpack-didnt-load "Файл учебного пакета ~a не загружается должным образом.")
  (add-teachpack-menu-item-label "Добавить учебный пакет...")
  (clear-all-teachpacks-menu-item-label "Очистить все учебные пакеты")
  (drscheme-teachpack-message-title "Учебный пакет DrRacket")
  (already-added-teachpack "Учебный пакет ~a уже добавлен")
  
  ; ~a is filled with the teachpack's name; the message appears in the
  ; teachpack selection dialog when a user installs a new teachpack
  (compiling-teachpack "Компиляция учебного пакета ~a ...")
  (teachpack-pre-installed "Предварительно установленные учебные пакеты")
  (teachpack-pre-installed/htdp "Предварительно установленные учебные пакеты HtDP")
  (teachpack-pre-installed/2htdp "Предварительно установленные учебные пакеты  HtDP/2e")
  (teachpack-user-installed "Пользовательские учебные пакеты")
  (add-teachpack-to-list... "Добавить учебный пакет в список...")
  ; first and second ~a are teachpack names, third is a symbol identifing an export
  (teachpack-conflict
   "ПРЕДУПРЕЖДЕНИЕ: уже установленный учебный пакет ~a конфликтует с ~a (оба экспортируют ~a)")
  ;; a button label; the two ~a are filled with teachpack names
  (remove-and-add-teachpack "Удалить ~a и добавить ~a")
  (teachpack-already-installed 
   "Учебный пакет с именем '~a' уже был установлен. Перезаписать?")
  ; ~a is filled with a list of language names. Each name is separated
  ; by a newline and is indented two spaces (no commas, no 'and')
  (teachpacks-only-in-languages 
   "Учебные пакеты доступны только на таких языках: ~a\n\nДля"
   " других языков используйте вместо этого «require».")
  
  
  ;;; Language dialog
  (introduction-to-language-dialog
   "Пожалуйста, выберите язык. Студентам во вводных курсам предпочтительно использовать язык по умолчанию.")
  (language-dialog-title "Выберите язык")
  (case-sensitive-label "Чувствительность к регистру")
  (output-style-label "Стиль вывода")
  (constructor-printing-style "Конструктор")
  (quasiquote-printing-style "Псевдоапострофы")
  (write-printing-style "ввод")
  (print-printing-style "печать")
  (true-false-empty-style-label "Стиль констант")
  (true-false-empty-style-read "#true #false '()")
  (true-false-empty-style-ids "true false empty")
  (sharing-printing-label "Показывать совместно используемое в значениях")
  (use-pretty-printer-label "Вставлять переводы строк в печатаемые значения")
  (input-syntax "Синтакис ввода")
  (dynamic-properties "Динамические свойства")
  (output-syntax "Синтаксис вывода")
  (teachpacks "Учебные пакеты") ;; label in the language dialog for the teaching languages
  (teachpacks-none "<< отсутствуют >>") ;; shows up under the previous string, when there are no teachpacks
  (no-debugging-or-profiling "Не отлаживать или профилировать")
  (debugging "Отладить")
  (debugging-and-profiling "Отладить и профилировать")
  (test-coverage "Включать набор синтаксических тестов")
  (show-details-button-label "Показать подробности")
  (hide-details-button-label "Скрыть подробности")
  (choose-language-menu-item-label "Выбрать язык...")
  (revert-to-language-defaults "Вернуть язык по умолчанию")
  (fraction-style "Стиль дроби")
  (use-mixed-fractions "Смешанные дроби")
  (use-repeating-decimals "Периодические десятичные дроби")
  (decimal-notation-for-rationals "Использовать десятичную запись для рациональных чисел")
  (enforce-primitives-group-box-label "Начальные привязки")
  (enforce-primitives-check-box-label "Запретить переопределение начальных привязок")
  (automatically-compile "Заполнить каталоги compiled/ (для более быстрой загрузки)")
  (preserve-stacktrace-information "Сохранить трассировку стека (отключает некоторые оптимизации)")
  (enforce-module-constants-checkbox-label "Обеспечить определение констант (включает некоторое встраивание)")
  (expression-level-stacktrace "Выражение уровня трассировки стека")
  (function-level-stacktrace "Функция уровня трассировки стека")
  (submodules-to-run "Запускать подмодули")
  (add-submodule "Добавить параметр подмодуля…") ;; menu item
  (add-submodule-title "Добавить подмодуль") ;; title of dialog opened by above menu item


  ; used in the bottom left of the drscheme frame 
  ; used the popup menu from the just above; greyed out and only
  ; visible when some languages are in the history
  (recent-languages "Последние языки:")
  ; shows up in bottom-left programming language menu popup, when no langs are recorded
  (no-recently-chosen-languages "нет выбранных языков") 
  
  ;; startup wizard screen language selection section
  (please-select-a-language "Пожалуйста, выберите язык")
  
  
  ;;; languages
  (beginning-one-line-summary "define, cond, структуры, константы и примитивы")
  (beginning/abbrev-one-line-summary "Начинающий студент со списковым стилем печати в цикле \"чтение-вычисление-печать\"")
  (intermediate-one-line-summary "Начинающий студент с лексической видимостью")
  (intermediate/lambda-one-line-summary "Средний студент с функциями высших порядков")
  (advanced-one-line-summary "Средний студент с лямбда-выражениями и мутацией")
  (pretty-big-scheme "Pretty Big")
  (pretty-big-scheme-one-line-summary 
   "Добавлены синтаксис и функции языков из \"Как проектировать программы\" в mzscheme и mred")
  (r5rs-language-name "R5RS")
  (r5rs-one-line-summary "R5RS с несущественными сокращениями")
  (expander "Макрорасширитель")
  (expander-one-line-summary "Выражение чаще раскрывается, чем вычисляется")
  (legacy-languages "Унаследованные языки")
  (teaching-languages "Учебные языки")
  (experimental-languages "Экспериментальные языки")
  (initial-language-category "Начальные языки")
  (no-language-chosen "Не выбран язык")
  (other-languages "Другие языки")
 
  (module-language-name "Определить язык из исходника")  
  (module-language-one-line-summary "Строка #lang определяет используемый язык")
   ;; shows up in the details section of the module language
  (module-language-auto-text "Автоматическая строка #lang")
  (module-language-auto-text-most-recent "Только что использованная строка #lang")
  ; to the right of this string is a text entry field whose content is the #lang line that'll be used.
  (module-language-auto-text-always-same "Всегда та же строка #lang:")
  ;; the next four string constants show up in the REPL in DrRacket in the "Racket Language",
  ;; which is also the "Determine language from source" language. They are put right after the name
  ;; of the language from the "#lang" line at the beginning of the source file
  (module-language-repl-no-annotations "")
  (module-language-repl-debug-annotations ", с отладкой")
  (module-language-repl-debug/profile-annotations ", с отладкой и профилированием")
  (module-language-repl-test-annotations ", с покрытием тестами")

  (module-language-#lang-error-more-information "Больше информации")
  (module-language-#lang-flush-cache "Перезагрузить")
  (module-language-#lang-flush-cache-menu-item "Перезагрузить расширения #lang")

  ;; for the upper portion of the language dialog
  (the-racket-language "Язык Racket")
  (choose-a-language "Выберите язык")

  ;; the next two string constants appear in the
  ;; language dialog with a list
  ;; of example languages appearing between them
  (racket-language-discussion
   "Запустите вашу программу с #lang для указания желаемого диалекта. Например:\n\n")
  (racket-language-discussion-end "\n… и многие другие")

  ;; the next three string constants are put into a message-box dialog
  ;; that appears when the user clicks on the example #lang languages
  ;; in the language dialog. The first one always appears and then either
  ;; the second or the third appears. The second one has the clicked
  ;; on #lang line placed into the ~a, and third one has the
  ;; current #lang line in the first ~a and the clicked on in the second one.
  ;; The two comments are separated by a blank line.
  (racket-dialect-in-buffer-message
   "Диалекты Racket обычно выбираются путём редактирования буфера, а"
   " не путём выбора пунктов в диалоге выбора языков.")
  (racket-dialect-add-new-#lang-line
   "С учётом этого, мне добавить «~a» в начало окна определений?")
  (racket-dialect-replace-#lang-line
   "С учётом этого, я вижу, у вас в файле «~a»; мне заменить это на «~a»?")
  (racket-dialect-already-same-#lang-line
   "Я вижу, у вас уже «~a» в файле;"
   " так что у вас всё готово для начала программирования!")

  ;; in the dialog containing the above strings, one of these is a button that appears
  (add-#lang-line "Добавить строку #lang")
  (replace-#lang-line "Заменить строку #lang")

  ;; for the 'new drracket user' dialog
  (use-language-in-source "Использовать язык, указанный в исходниках")

  ;;; from the `not a language language' used initially in drscheme.
  (must-choose-language "DrRacket не способен выполнять программы при невыбранном языке программирования.")
  
  ; next two appear before and after the name of a text book (which will be in italics)
  (using-a-textbook-before "Использовать ")
  (using-a-textbook-after "?")
  
  ; next two are before and after a language
  (start-with-before "Начать с ")
  (start-with-after "")
  
  (seasoned-plt-schemer? "Опытный программист на PLT Scheme?")
  (racketeer? "Вы Racket'ир?")
  (looking-for-standard-scheme? "Просмотреть стандарт для Scheme?")

  ; the three string constants are  together and the middle
  ; one is hyperlinked to the dialog that suggests various languages
  (get-guidance-before "Или выберите пункт \"Выбрать язык...\" в меню \"Язык\", или ")
  (get-guidance-during "получите совет")
  (get-guidance-after ".")
    
  ;;; debug language
  (unknown-debug-frame "[неизвестный]")
  (backtrace-window-title "Обратная трассировка DrRacket")
  (files-interactions "При выполнении ~a") ;; filled with a filename
  (current-interactions "вызовов")
  (current-definitions "определений")
  (mzscheme-w/debug "Текстовый (MzScheme, включая Стандарт 1998 года)")
  (mzscheme-one-line-summary "PLT-реализация Scheme")
  (mred-w/debug "Графический (MrEd, включая MzScheme)")
  (mred-one-line-summary "Добавить поддержку графического интерфейса пользователя к MzScheme")

  ;; profiling
  (profiling-low-color "Нижний")
  (profiling-high-color "Верхний")
  (profiling-choose-low-color "Пожалуйста, выберите нижний цвет")
  (profiling-choose-high-color "Пожалуйста, выберите верхний цвет")
  (profiling "Профилирование")
  (profiling-example-text "(define (whee) (whee))")
  (profiling-color-config "Набор основных цветов") 
  (profiling-scale "Шкала распределения цветов")
  (profiling-sqrt "Пропорциональна корню квадратному")
  (profiling-linear "Линейная")
  (profiling-square "Квадратическая")
  (profiling-number "Число вызовов")
  (profiling-time "Общее время")
  (profiling-update "Обновить профиль")
  (profiling-col-percent-time "% времени")
  (profiling-col-function "Функция")
  (profiling-col-time-in-msec "миллисекунд")
  (profiling-col-calls "Вызовы")
  (profiling-show-profile "Показать профиль")
  (profiling-hide-profile "Скрыть профиль")
  (profiling-unknown-src "<< неизвестный >>")
  (profiling-no-information-available 
   "Информация о профилировании недоступна. Пожалуйста, убедитесь, что"
   " профилирование допускается на выбранном языке, а программа выполнена.")
  (profiling-clear? 
   "Изменения в окне определений лишают профилирующую информацию актуальности. Продолжить?")
  
  ;; test coverage
  (test-coverage-clear? 
   "Изменения в окне определений лишают информацию о тестировании актуальности. Продолжить?")
  (test-coverage-clear-and-do-not-ask-again "Да, больше не спрашивать")
  (test-coverage-ask? "Спрашивать об очистке информации о тестировании")
  (test-coverage-entirely-covered "Все выражения покрыты")
  (test-coverage-next-time-check-box "Показать в следующий раз?")
  (test-coverage-summary "Показать итоговый результат покрытия тестами")

  (test-coverage-on "Тесты покрыли")
  (test-coverage-off "Тесты не покрыли")
  
  ;; tracing
  (tracing-enable-tracing "Допустить трассировку")
  (tracing-show-tracing-window "Показать трассировку")
  (tracing-hide-tracing-window "Скрыть трассировку")
  (tracing-tracing-nothing-to-show 
   "Результаты трассировки еще не доступны. (Убедитесь, что выбранный язык"
   " поддерживает трассировку и что трассировка включена.)")

  ;;; repl stuff
  (evaluation-terminated "Вычисления прерваны")
  (evaluation-terminated-explanation
   "Поток вычислений больше не выполняется, поэтому"
   " никаких вычислений не будет до следующего запуска.")
  
  ; The next three constants show up in the same dialog as the above evaluation-terminated string
  ; constants.
  ; The first two show up only when the user calls 'exit' (possibly with a status code).
  ; The third shows up when the program runs out of memory.
  (exited-successfully "Успешное завершение.")
  ;; ~a is filled in with a number between 1 and 255
  (exited-with-error-code "Завершение с кодом ошибки ~a.")
  (program-ran-out-of-memory "Программе не хватило памяти для завершения выполнения.")

  (show-evaluation-terminated-dialog "Показать диалог «вычисление прекрашено»")
  (evaluation-terminated-ask "Показать этот диалог в следующий раз")

  (last-stack-frame "показать последнее значение стека")
  (last-stack-frames "показать последние ~a значений стека")
  (next-stack-frames "показать следующие ~a значений стека")
  (more-stack-frames "показать больше значений стека")
 
  ;;; welcoming message in repl
  (language "Язык")
  (custom "выбранный")
  (teachpack "Учебный пакет")
  (welcome-to "Добро пожаловать в")
  (version "версия")
  ;; The following is shown on 2nd line of welcome message in repl.
  ;; It is concatenated at end of: "language": LANGUAGE "; memory limit:" LIMIT
  ;; therefore you get to decide punctuation for your language here
  (memory-limit "; ограничение памяти:")
 
  ;;; kill evaluation dialog
  (kill-evaluation? "Вы хотите прервать цикл вычислений?")
  (just-break "Только остановить")
  (kill "Прервать")
  (kill? "Прервать?")

  ;;; version checker
  (version:update-menu-item   "Проверить обновления...")
  (version:update-check       "Проверка обновлений") ; dialog title, with the next line
  (version:connecting-server  "Соединение с сервером версии Racket")
  (version:results-title      "Проверка версии Racket")
  (version:do-periodic-checks "Периодически проверять более новые версии Racket")
  (version:take-me-there      "Обновить") ; ...to the download website
  ;; the next one can appear alone, or followed by a comma and the one after that
  (version:plt-up-to-date     "У Вас новейшая версия Racket")
  (version:but-newer-alpha    "однако заметьте, что есть более новая альфа-версия")
  ;; This is used in this context: "Racket vNNN <<<*>>> http://download..."
  (version:now-available-at   "теперь доступно в")

  ;; insert menu
  (insert-menu "&Вставка")
 
  ;; large semi colon letters
  (insert-large-letters... "Вставить большие буквы...")
  (large-semicolon-letters "Большие закомментированные буквы")
  (text-to-insert "Вставить текст")

  (module-browser-filename-format "Полное имя: ~a (~a строк)")
  (module-browser-root-filename "Основное имя файла: ~a")
  (module-browser-font-size-gauge-label "Размер  шрифта")
  (module-browser-progress-label "Прогресс просмотра модулей")
  (module-browser-adding-file "Добавить файл: ~a...")
  (module-browser-laying-out-graph-label "Граф разметки")
  (module-browser-open-file-format "Открыть ~a")
  (module-browser "Браузер модуля") ;; frame title
  (module-browser... "&Браузер модуля...") ;; menu item title
  (module-browser-in-file "Б&раузер модуля в ~a") ;; menu item title; ~a is filled with a filename
  ;; menu item title for above menu item; used when there is no saved file
  (module-browser-no-file "Браузер модуля на этом сохранённом файле")
  (module-browser-error-expanding "Ошибка раскрытия имени программы:\n\n~a")
  (module-browser-show-lib-paths "Показывать файлы, загружаемые из библиотек")
  (module-browser-progress "Браузер модуля: ~a") ;; prefix in the status line
  (module-browser-compiling-defns "Браузер модуля: компиляция определений")
  ;; check box label in show module browser pane in drscheme window.
  (module-browser-show-lib-paths/short "Показывать пути к библиотекам")
  ;; check box label in show module browser pane in drscheme window.
  (module-browser-show-planet-paths/short "Показывать пути к PLanet")
  (module-browser-refresh "Обновить") ;; button label in show module browser pane in drscheme window.
  ;; used to search in the graph; the label on a text-field% object 
  (module-browser-highlight "Выделение")
  (module-browser-only-in-plt-and-module-langs
   "Браузер модуля доступен только для языков, основанных на модулях.")
  (module-browser-name-length "Длина имени")
  (module-browser-name-short "Короткая")
  (module-browser-name-medium "Средняя")
  (module-browser-name-long "Длинная")
    ;; like 'Long' but shows the phases where this file is loaded
  (module-browser-name-very-long "Длинная, с фазами") 
  (module-browser-open-all "Открыть все показанные здесь файлы")
  (module-browser-main-collects "Главные коллекции")
  (module-browser-unknown-pkg "Неизвестный пакет")
  (module-browser-visible-pkgs "Видимые пакеты")
  (module-browser-visible-submodules "Видимые подмодули")
  (module-browser-top-level-module "Модуль верхнего уровня") ; in the "which submodules?" filter; this is used for when there are no submodules

  (happy-birthday-matthias "С днем рождения, Матиас!")
  (happy-birthday-matthew "С днем рождения, Метью!")
  (happy-birthday-shriram "С днем рождения, Шрирам!")

  (xml-tool-insert-xml-box "Вставить блок XML")
  (xml-tool-insert-scheme-box "Вставить блок Racket")
  (xml-tool-insert-scheme-splice-box "Присоединить блок Racket")
  (xml-tool-xml-box "XML блок")
  (xml-tool-scheme-box "Racket блок")
  (xml-tool-scheme-splice-box "Присоединенный блок Racket")
  (xml-tool-switch-to-scheme "Переключиться на блок Racket")
  (xml-tool-switch-to-scheme-splice "Переключиться присоединенный на блок Racket")
  (xml-tool-eliminate-whitespace-in-empty-tags
   "Убирать пробелы в пустых тегах")
  (xml-tool-leave-whitespace-alone
   "Оставить пробелы в покое")
 
  (show-recent-items-window-menu-item "Показать недавно открытые файлы в отдельном окне")
  (show-recent-items-window-label "Недавно открытые файлы")
  (number-of-open-recent-items "Количество недавних элементов")
  (switch-anyway "Все равно перейти к файлу")

  (stepper-program-has-changed "Предупреждение: Программа была изменена.")
  (stepper-program-window-closed "Предупреждение: Окно программы закрыто.")

  (stepper-name "Пошаговое выполнение")
  (stepper-language-level-message "Пошаговое выполнение не работает для языка \"~a\".")
  (stepper-button-label "Шаг")

  (stepper-previous-application "Программа")
  (stepper-next "Шаг")
  (stepper-jump "Перейти…")
  (stepper-jump-to-beginning "в начало")
  (stepper-jump-to-end "в конец")
  (stepper-jump-to-selected "к началу выбранного")
  (stepper-jump-to-previous-application "к предыдущему шагу применения")
  (stepper-jump-to-next-application "к следующему шагу применения")
  (stepper-out-of-steps 
   "Вычисления завершены ранее, чем достигнут искомый шаг.")
  (stepper-no-such-step/title "Шаг не найден")
  (stepper-no-such-step "Шаг, соответствующий критерию, не найден.")
  (stepper-no-such-step/earlier "Предыдущий шаг, соответствующий критерию, не найден.")
 
  (stepper-no-earlier-application-step "Нет более ранних шагов применения.")
  (stepper-no-later-application-step "Больше нет шагов применения.")
  (stepper-complete "Все определения успешно выполнены.")

  (stepper-no-earlier-step "Нет более ранних шагов.")
  (stepper-no-later-step "Больше нет шагов.")

  (stepper-no-selected-step "Нет шагов в выбранном регоне. Может быть он закоментирован?")

  (stepper-no-last-step "Последний шаг ещё недоступен.")

  (debug-tool-button-name "Отладить")

  (dialog-back "Назад")

  ;; warnings about closing a drscheme frame when the program
  ;; might still be doing something interesting
  (program-is-still-running "Программа в окне определений все еще выполняется. Все равно закрыть?")
  (program-has-open-windows 
   "Программа в окне определений имеет открытые окна. Все равно закрыть?")
 
  ;; ml-command-line-arguments is for the command line arguments
  ;; label in the module language details in the language dialog.
  (ml-command-line-arguments "Аргументы командной строки как вектор строк")

  ;; ml-cp names are all for the module language collection path
  ;; configuration. See the details portion of the language dialog
  ;; for the module language (at the bottom).
  (ml-cp-default-collection-path "<<пути к коллекции по умолчанию>>")

  ;; in std get-directory 
  (ml-cp-choose-a-collection-path "Пожалуйста, выберите путь к коллекции")

  ;; err msg when adding default twice
  (ml-cp-default-already-present
   "Заданные по умолчанию пути к коллекции уже установлены")
  
  ;; title of this section of the dialog (possibly the word
  ;; `Collection' should not be translated)
  (ml-cp-collection-paths "Пути к коллекции")

  ;; button labels
  ;;  The package manager uses these, too
  (ml-cp-add "Добавить")
  (ml-cp-add-default "Добавить по умолчанию")
  (ml-cp-remove "Удалить")
  (ml-cp-raise "Вверх")
  (ml-cp-lower "Вниз")
  
  (ml-always-show-#lang-line "Всегда показывать строку #lang модуля языка")

  ;; Profj
  (profj-java "Java")
  (profj-java-mode "Режим Java")
  (profj-java-coverage "Набор Java") ;; shows up in the preferences dialog under 'Color'

  (profj-beginner-lang "Начинающий")
  (profj-beginner-lang-one-line-summary "Java-подобный язык для обучения начинающих")
  (profj-full-lang "Полный")
  (profj-full-lang-one-line-summary "Подобный Java 1.0 (приблизительно 1.1)")
  (profj-advanced-lang "Опытный")
  (profj-advanced-lang-one-line-summary "Java-подобный язык для опытных пользователей")
  (profj-intermediate-lang "Средний")
  (profj-intermediate-lang-one-line-summary "Java-подобный язык для продолжающих обучение")
  (profj-intermediate-access-lang "Средний + доступ")
  (profj-intermediate-access-lang-one-line-summary 
   "Java-подобый язык для продолжающих обучение с модификаторами доступа")
  (profj-dynamic-lang "Java + динамическая типизация")
  (profj-dynamic-lang-one-summary "Java с возможностью динамической типизации")

  (profj-java-mode-color-heading "Цвета редактирования") ; Heading for preference to choose editing colors  
  (profj-java-mode-color-keyword "ключевые слова")
  (profj-java-mode-color-string "строка")
  (profj-java-mode-color-literal "литерал")
  (profj-java-mode-color-comment "комментарий")
  (profj-java-mode-color-error "ошибка")
  (profj-java-mode-color-identifier "идентификатор")
  (profj-java-mode-color-prim-type "примитивный тип") ; Example text for built-in Java types
  (profj-java-mode-color-default "по умолчанию")

  (profj-coverage-color-heading "Цвета окружения") ; Heading for preference to choose coverage colors
  (profj-coverage-color-covered "окружающее выражение") 
  
  ; Heading for preferences controlling printing
  (profj-language-config-display-preferences "Персональные настройки отображения") ; Heading for preferences controlling printing
  (profj-language-config-display-style "Стиль отображения")
  (profj-language-config-display-field "Класс + Поля")
  (profj-language-config-class "Класс")
  (profj-language-config-display-array "Выводить массивы целиком?")
  ; Heading for preferences controlling test behavior
  (profj-language-config-testing-preferences "Настройки тестирования") ; Heading for preferences controlling test behavior
  ; Run should be the word found on the Run button
  ;(profj-language-config-testing-enable "Отображать результаты тестирования при выполнении?")
  (profj-language-config-testing-coverage "Собрать информацию для тестирования?")
  (profj-language-config-support-test-language "Поддерживать тестирование языковых расширений?")
  (profj-language-config-testing-check "Разрешить проверку выражений?") ; check should not be translated
  (profj-language-config-classpath "Путь к классам")
  (profj-language-config-choose-classpath-directory "Выбрать каталог для добавления к пути к классам")
  ; Button label to print the current classpath
  (profj-language-config-classpath-display "Показать текущий")

  (profj-test-name-close-to-example "Имя класса ~a содержит фразу, близкую к примерам.")
  (profj-test-name-example-miscapitalized "Имя класса ~a с точностью до регистра содержит пример.")
  
   ;; Close testing window and do not run test cases any more
  ;(profj-test-results-close-and-disable "Закрыть и запретить тестирование")
  ;; Hide docked testing window and do not run test cases any more
  ;(profj-test-results-hide-and-disable "Скрыть и запретить тестирование")
  ;Renamed below
  ;(profj-test-results-window-title "Результаты тестирования")
  
  (profj-unsupported "Не поддерживается")
  (profj-executables-unsupported "Извините - в настоящий момент Java не поддерживает исполняемые файлы")

  (profj-convert-to-text-comment "Преобразовать в текстовый комментарий")
  (profj-convert-to-comment "Преобразовать в комментарий")

  (profj-executing-main "запуск main")

  (profj-insert-java-comment-box "Вставить блок Java-комментария")
  (profj-insert-java-interactions-box "Вставить блок Java-кода")

  ;;The Test engine tool
  ;;
  (test-engine-window-title "Результаты тестирования")
  ;;Following two appear in View menu, attach and free test report window from DrRacket frame
  (test-engine-dock-report "Прикрепить отчет о тестировании")
  (test-engine-undock-report "Открепить отчет о тестировании")
  ;;Following two appear in Racket (Java, etc) menu, cause Tests to be Run automatically or not
  (test-engine-enable-tests "Разрешить тестирование")
  (test-engine-disable-tests "Запретить тестирование")
  (test-engine-enable-disable-tests-only-in-teaching-languages
   "Пункт Разрешить/Запретить тестиррование в меню используется только для учебных"
   " языков HtDP и DMdA. Смотрите раздел «Показать подробности» диалога"
   " выбора языка, чтобы управлять подмодулями, которые выполняются на языке Racket.")

  (test-engine-ran-1-test "Выполнен 1 тест.")
  (test-engine-ran-1-check "Выполнена 1 проверка.")
  ;; ditto, only plural
  (test-engine-ran-n-tests "Выполнено ~a тестов.")
  (test-engine-ran-n-checks "Выполнено ~a проверок.")
  (test-engine-1-test-passed "Тест пройден!")
  (test-engine-1-check-passed "Проверка закончена!")
  (test-engine-both-tests-passed "Оба теста пройдены!")
  (test-engine-both-checks-passed "Обе проверки закончены!")
  (test-engine-all-tests-passed "Все тесты пройдены!")
  (test-engine-all-checks-passed "Все проверки закончены!")
  (test-engine-all-n-tests-passed "Все ~a тестов пройдены!")
  (test-engine-all-n-checks-passed "Все ~a проверок закончены!")
  (test-engine-0-tests-passed "0 тестов пройдено.")
  (test-engine-0-checks-passed "0 проверок закончено.")
  (test-engine-m-of-n-tests-failed "~a из ~a тестов ошибочны.")
  (test-engine-m-of-n-checks-failed "~a из ~a проверок ошибочны.")
  (test-engine-must-be-tested "Эта программа должна быть протестирована!")
  (test-engine-is-unchecked "Эта программа непроверена!")
  (test-engine-tests-disabled "Тесты отключены.")
  (test-engine-should-be-tested "Эта программа должна быть проверена.")
  (test-engine-at-line-column "в строке ~a, столбце ~a")
  (test-engine-in-at-line-column "в ~a, строке ~a, столбце ~a")
  ; as in "column (unknown)"
  (test-engine-unknown "(неизвестно)")
  (test-engine-trace-error "Ошибка трассировки")

  ; The ~F is special marker for the offending values, which may be
  ; printed specially in DrRacket.
  (test-engine-check-range-encountered-error
   "ошибка проверки в check-range: вместо ожидаемого значения в [~F, ~F]. ~n   :: ~a")
  (test-engine-check-member-of-encountered-error
   "ошибка проверки в check-member-of: вместо ожидаемого значения в ~L.~n   :: ~a")
  ; obsolete version of this
  (test-engine-check-*-encountered-error
   "~a встретил следующую ошибку вместо ожидаемого значения, ~F. ~n   :: ~a")
  ; deprecated:
  (test-engine-check-encountered-error
   "ошибка проверки в check-expect: вместо ожидаемого значения ~F. ~n   :: ~a")
  (test-engine-check-error-cause
   "из-за выражения")
  (test-engine-actual-value-differs-error
   "Фактическое значение ~F отличается от ожидаемого ~F.")
  ;; need to translate only one of these next two
  ;; (test-engine-actual-value-not-within-error or
  ;;  test-engine-actual-value-not-within-error/alt-word-order)
  ;; if both are present, test-engine-actual-value-not-within-error is used
  (test-engine-actual-value-not-within-error
   "Фактическое значение ~F выходит за пределы ~v ожидаемого значения ~F.")
  ;(test-engine-actual-value-not-within-error/alt-order
  ; "Actual value ~F is not near enough to expected value ~F; expected it to be within ~v.")
  (test-engine-encountered-error-error
   "ошибка проверки в check-error: следующая ошибка вместо ожидаемого ~a~n   :: ~a")
  (test-engine-expected-error-error
   "ошибка проверки в check-error: ожидалась ошибка, но вместо этого получено значение ~F.~n ~a")
  (test-engine-expected-an-error-error
   "ошибка проверки в check-error: ожидалась ошибка, но вместо этого получено значение ~F.")
  ;; members are appended to the message
  (test-engine-not-mem-error "Значение ~F отличается от всех элементов в ")
  (test-engine-not-range-error "Значение ~F не между ~F и ~F, включительно.")

  ;; followed by list of variable bindings
  (test-engine-property-fail-error "Свойство фальсифицируемо с")
  (test-engine-property-error-error "ошибка проверки в check-property ~n:: ~a")

  (signature-enable-checks "Включить проверки соглашений")
  (signature-disable-checks "Выключить проверки соглашений")

  ; section header
  (test-engine-check-failures "Ошибки тестирования:")
  ; section header
  (test-engine-signature-violations "Нарушения соглашения:")

  ; part of one phrase "signature <at line ...> to blame: function <...>
  (test-engine-signature "соглашение")
  (test-engine-to-blame "нарушено: процедура ")

  (test-engine-no-signature-violations "Нет нарушений соглашения.")
  (test-engine-1-signature-violation "1 нарушение соглашения.")
  (test-engine-n-signature-violations "~a нарушений соглашения.")

  ; as in got <value>, signature <at ...>
  (test-engine-got "получено")
  
  (profjWizward-insert-java-class "Вставить класс Java")
  (profjWizard-insert-java-union "Вставить объединение Java")
  
  ;; The Test Suite Tool
  ;; Errors
  (test-case-empty-error "Пустой тестовый набор")
  (test-case-too-many-expressions-error "Слишком много выражений в тестовом наборе.")
  ;; DrRacket window menu items
  (test-case-insert "Вставить тестовый набор")
  (test-case-disable-all "Отключить все тестовые наборы")
  (test-case-enable-all "Включить все тестовые наборы")
  
  ;; NOTE: The following string constants are labels of the test-case fields. The width
  ;;       of the field is determined by the length of the longest of the following three words.
  ;;       if the words are too long the test case will take up too much horizontal room and
  ;;       not look very good.
  ;; This string is the label of the expression that is being tested in a test case.
  (test-case-to-test "Проверяется")
  ;; This string is the label of the expression that is the expected value of the to-test expression.
  (test-case-expected "Должно быть")
  ;; This string is the label of the actual result of the to test expression.
  (test-case-actual "Фактически")
  (test-case-predicate "Предикат")
  (test-case-should-raise "Должен бы")
  ;; The label of a field of the test-case that describes the expected error message of a test case
  (test-case-error-message "Сообщение об ошибке")

  (test-case-menu-title "Тестовый набор")
  (test-case-switch-to-error-box "Переключиться в окно ошибочных тестов")
  (test-case-switch-to-nonerror-box "Переключиться в окно безошибочных тестов")
  (test-case-collapse "Свернуть тестовый набор")
  (test-case-show-actual "Показать фактическое значение")
  (test-case-enable "Разрешить тестовый набор")
  (test-case-show-predicate "Показать предикат")
  (test-case-show-error-message "Показать сообщение об ошибке")
  (test-case-convert-to-text "Преобразовать в текст")
  
  ;; Profj Boxes
  (profjBoxes-empty-error "Не заданы действия")
  (profjBoxes-too-many-expressions-error "Слишком много выражений")
  (profjBoxes-interactions-label "Действия")
  (profjBoxes-bad-java-id-error "Неверный Java ID")
  (profjBoxes-examples-label "Примеры")
  (profjBoxes-add-new-example-button "Добавить новый пример")
  (profjBoxes-type "Тип")
  ;; The Java identifier of an example of data
  (profjBoxes-name "Имя")
  (profjBoxes-value "Значение")
  (profjBoxes-insert-java-examples "Вставить примеры Java")
  (profjBoxes-insert-java-interactions "Вставить Java-код")

  ;; Slideshow
  (slideshow-hide-picts "Показать вложенные поля")
  (slideshow-show-picts "Показать рисунки")
  (slideshow-cannot-show-picts "Невозможно отобразить рисунки; запустите программу для кеширования размеров")
  (slideshow-insert-pict-box "Вставить блок рисунка") 

  ;; GUI Tool
  (gui-tool-heading "Инструмент графического интерфеса пользователя")
  (gui-tool-before-clicking-message 
   "Перед выбором иконки на панеле используйте «Вставить элемент графического интерфейса пользователя» из меню «Специальная вставка» в"
   " корневой элемент графического интерфейса пользователя либо выберите уже вставленный элемент.")
  (gui-tool-show-gui-toolbar "Показать панель инструментов графического интерфейса пользователя")
  (gui-tool-hide-gui-toolbar "Скрыть панель инструментов графического интерфейса пользователя")
  (gui-tool-insert-gui "Вставить элемент графического интерфейса пользователя")

  ;; contract violation tracking
  
  ; tooltip for new planet icon in drscheme window (must have a planet violation logged to see it)
  (show-planet-contract-violations "Показать нарушения от PLaneT")

  ; buttons in the dialog that lists the recorded bug reports
  (bug-track-report "Файл отчета")
  (bug-track-forget "Не обрабатывать")
  (bug-track-forget-all "Все проигнорировать")
    
  ;; planet status messages in the bottom of the drscheme window;
  ;; the ~a is filled with the name of the package
  (planet-downloading "PLaneT: загрузка ~a...")
  (planet-installing "PLaneT: инсталляция ~a...")
  (planet-finished "PLaneT: закончена с ~a.")
  (planet-docs-building "PLaneT: формируется докуменатция (вызвано ~a)…")
  ;; this can happen when there is status shown in a different and then
  ;; the user switches to a tab where planet hasn't been used
  (planet-no-status "PLaneT")
    
  (bug-report-field-pkg "Системная информация пакета")

  ;; string normalization. To see this, paste some text with a ligature into DrRacket
  ;; the first three strings are in the dialog that appears. The last one is in the preferences dialog
  (normalize "Нормализировать")
  (leave-alone "Оставить без изменений")
  (normalize-string-info 
   "Строка, которую Вы вставили, содержит лигатуры и другие ненормализированные знаки. Нормализировать их?")
  (normalize-string-preference "Нормализировать вставленные строки")
  (ask-about-normalizing-strings "Спрашивать о нормализации строк")

  (always-use-platform-specific-linefeed-convention
   "Всегда использовать специфичный для платформы перенос строк")
  (disable-caret-blinking "Отключить мигание курсора")

  ;; optimization coach
  (hide-optimization-coach "Скрыть мастера оптимизации")
  (show-optimization-coach "Показать мастера оптимизации")

  ;; labels used (in a big font) in the background of the definitions and interactions windows
  (definitions-window-label "определения")
  (interactions-window-label "интерпретатор")
  (hide-defs/ints-label "Скрыть заголовки определения/интерпретатор") ;; popup menu
  (show-defs/ints-label "Показать заголовки определения/интерпретатор") ;; preferences checkbox

  ;; menu item in the 'edit' menu; applies to editors with programs in them
  ;; (technically, editors that implement color:text<%>)
  (spell-check-string-constants "Проверитьорфографию строковых констант")
  (spell-check-scribble-text "Проверить орфографию текста (между {} в Scribble)")
  ; (sub)menu whose items are the different possible dictionaries
  (spelling-dictionaries "Орфографические словари")
  (default-spelling-dictionary "Словарь по умолчанию") ; first item in menu from previous line
  (misspelled-text-color "Цвет орфографических ошибок") ;; in the preferences dialog
  (cannot-find-ispell-or-aspell-path "Не могу найти исполняемый файл aspell или ispell")
  ; puts the path to the spell program in the ~a and then the error message
  ; is put following this string (with a blank line in between)
  (spell-program-wrote-to-stderr-on-startup "Программа проверки орфографии (~a) вывела сообщение об ошибке:")
  (spell-program-did-not-respond-after-some-seconds
   "Программа проверки орфографии (~a) не отвечает ~a секунд")
  (spell-skip-to-next-misspelled-word "Перейти к следующему слову с орфографической ошибкой") ;; menu item
  (spell-suggest-corrections "Предложить исправления орфографии…") ;; menu item
  (spell-correction-suggestions "Предложения исправления орфографии") ;; dialog title
  (spell-choose-replacement-word "Выберите заменяющее слово") ;; label in dialog

  ;; GUI for installing a pkg package; available via File|Install Package...
  (install-pkg-install-by-source "Делай что надо")         ; tab label
  (install-pkg-install-from-list "Доступны из каталога") ; tab label
  (install-pkg-install-installed "Установлены")    ; tab label
  (install-pkg-migrate-from "Скопировать из версии")           ; tab label
  (install-pkg-settings "Настройки")                        ; tab label
  (install-pkg-menu-item... "Установить пакет…")
  (install-pkg-dialog-title "Установить пакет")
  (install-pkg-source-label "Источник пакета")
  (install-pkg-package-name "Имя пакета")
  (install-pkg-package-source-desc
   "Источник пакета это имя пакета, файл, каталог, URL или ссылка на GitHub")
  (install-pkg-infer "Вывести")
  (install-pkg-use "Использовать") ; as opposed to "Infer", label for text box
  (install-pkg-type-label "Тип источника пакета")
  (install-pkg-file "Файл")
  (install-pkg-link "Связь")
  (install-pkg-static-link "Статическая связь")
  (install-pkg-dir "Каталог")
  (install-pkg-dir-url "Удалённый каталог")
  (install-pkg-file-url "Удалённый файл")
  (install-pkg-git "Репозиторий git")
  (install-pkg-github "GitHub")
  (install-pkg-name "Имя (по данным распознавателя)")
  (install-pkg-inferred-as "Выведен тип ~a") ; ~a gets install-pkg-{file,dir,...}
  (install-pkg-link-dirs "Локальный каталог как связь")
  (install-pkg-file-or-dir? "Выберите файл или каталог?")
  (install-pkg-force? "Игнорировать конфликты")
  (install-pkg-replace? "Обновления могут заменять установленное")
  (install-pkg-dry-run? "Пробный запуск (ничего не изменится)")
  (install-pkg-command-line "Эквивалентная команда:")
  (install-pkg-error-installing-title "Ошибка установки пакета")
  (install-pkg-action-label "Выполнить действие")
  (install-pkg-install "Установить")
  (install-pkg-update "Обновить")
  (install-pkg-setup "Установить") ; for button
  (install-pkg-setup-long "Пересобрать текущую установку") ; for menu
  (install-pkg-remove "Удалить")
  (install-pkg-do-not-remove "Не удалять")
  (install-pkg-action-inferred-to-be-update "Выведена необходимость обновления")
  (install-pkg-action-inferred-to-be-install "Выведена необходимость установки")
  (install-pkg-default "По умолчанию")
  (install-pkg-scope-label "Область пакета")
  (install-pkg-default-scope-label "Область пакета по умолчанию") ; for picking the scope to be default
  (install-pkg-default-scope-changed "Область по умолчанию успешно изменена на ~a") ; confirming message after change
  (install-pkg-installation "Установка в определённую версию Racket")
  (install-pkg-user "Для определённого пользователя и версии Racket")
  (install-pkg-set-as-default "Установить значением по умолчанию")
  (install-pkg-scope-is "Область пакета ~a") ; ~a gets install-pkg-{installation,user,shared}
  (install-pkg-select-package-directory "Выберите каталог пакета")
  (install-pkg-select-package-file "Выберите файл пакета")
  (install-pkg-update-package-list "Обновить список пакетов")
  (install-pkg-stop-update "Остановить обновление")
  (install-pkg-filter "Отбор")
  (install-pkg-match "~a/~a соответствует")
  (install-pkg-package "Пакет")
  (install-pkg-author "Автор")
  (install-pkg-description "Описание")
  (install-pkg-tags "Теги")
  (install-pkg-checksum "Контрольная сумма")
  (install-pkg-source "Источник")
  (install-pkg-catalog "Каталог")
  (install-pkg-scope "Область")
  (install-pkg-name "Имя")
  (install-pkg-update-catalogs? "Обновить базу данных для соответствия настроенному набору каталогов?")
  (install-pkg-currently-configured-are "Настроенные сейчас каталоги")
  (install-pkg-database-recorded-are "Записанные в базе каталоги")
  (install-pkg-update-catalogs "Обновить")
  (install-pkg-do-not-update-catalogs "Не обновлять")
  (install-pkg-really-remove? "Вы уверены, что хотите удалить следующие выбранные пакеты?")
  (install-pkg-promote "Повысить из установленного автоматически")
  (install-pkg-demote "Понизить до установленного автоматически")
  (install-pkg-abort-install "Прервать установку")
  (install-pkg-abort-update "Прервать обновление")
  (install-pkg-abort-remove "Прервать удаление")
  (install-pkg-abort-demote "Прервать понижение")
  (install-pkg-abort-promote "Прервать повышение")
  (install-pkg-abort-migrate "Прервать миграцию")
  (install-pkg-abort-setup "Прервать настройку")
  (install-pkg-abort-generic-action "Прервать действие")
  (install-pkg-close-terminal-output "Закрыть вывод")
  (install-pkg-show-all-options "Показать все варианты")
  (install-pkg-migrate-available-installations "Доступные установки")
  ;; all ~a will be substituted with the different single characters
  ;; conveying the state, by default these are ✓*!=@
  (install-pkg-legend "~a: установлено ~a: установлено автоматически ~a: не в области по умолчанию ~a: установлено как связь; ~a: установлено из URL")
  (pkg-manager-menu-item "Менеджер пакетов…")
  (install-pkg-title "Менеджер пакетов")
  ;; where ~a gets an installation name:
  (install-pkg-packages-for "Пакеты для ~a")
  (install-pkg-really-remove-installation
   "Вы уверены, что хотите удалить все установленные пакеты и иноформацию для ~a?")
  (install-pkg-installer "Установщик пакетов")
  (install-pkg-copy "Скопировать сообщение")
  (install-pkg-installation "установка")
  (install-pkg-user "пользователь")
  (install-pkg-any "Любой") ;; any file type
  (install-pkg-bad "плохой") ;; bad (not supported) file type
  (install-pkg-catalogs "Каталоги пакетов")
  (install-pkg-updating "Обновление списка пакетов…")
  (install-pkg-updating-from "Обновление из ~a…")
  (install-pkg-details-from "Получение подробностей для ~a из ~a…")

  (install-pkg-abort-set-scope "Прервать изменение области")

  (install-pkg-dependencies-fail "Неудача: отменять установку/обновление, если не хватает зависимостей")
  (install-pkg-dependencies-force
   "Силой: устанавливать, несмотря на отсутствующие или не совпадающие по версии зависимости")
  (install-pkg-dependencies-search-ask
   "Спрашивать: справшивать о каждой отсутствующей зависимости (не поддерживается в графическом интерфейсе)")
  (install-pkg-dependencies-search-auto
   "Авто: устанавливать отсутствующие или не совпадающие по версии зависимости автоматически")
  (install-pkg-dependencies-search-auto+update
   "Auto + Update: обновлять зависимости когда возможно")

  (install-pkg-dependencies-mode "Режим зависимостей")

  (install-pkg-dependencies-search-ask-not-supported-in-gui
   "Режим «спрашивать» для зависимостей не поддерживается в графическом установщике.")
  ;; "~a" is pre-":" part of `install-pkg-dependencies-fail'
  ;; or `install-pkg-dependencies-search-auto':
  (install-pkg-deps-is "Режим зависимостей по умолчанию ~a")

  (install-pkg-package-catalogs "Каталоги пакетов") ; label for a list box
  (install-pkg-add-package-catalog "Добавить каталог пакетов")

  (install-pkg-not-rentrant "Установка и обновление не могут происходить одновременно;"
                            " или прервите ту, что идёт сейчас, или дождитесь завершения.")

  ;; open a file via a collection path (new "Open" menu item in DrRacket)
  (open-require-path "Открыть путь для require…")
  (enter-subcollection "Войти в подколлекцию") ; button in new dialog
  (path-to-racket-binary "Путь к исполнимому файлу")
  (use-a-different-racket "Используйте другой racket")

  ;; adding racket/bin to the path; only under mac os x
  ; first ~a is filled with either the empty string or an error message from elsewhere
  ;  (bracketed by some newlines to separate it out)
  ; second ~a is filled with /etc/paths.d/racket (or some other path like it in the future)
  ; third ~a is filled with the path to the bin directory of the current drracket
  (adding-racket/bin-to-path-failed
   "Попытка добавить поддержку racket в командную строку окончилась неудачей.~aКонкретнее,"
   " не могу создать «~a» с содержимы «~a».")
  ; first and third ~a are filled with /etc/paths.d/racket (or some other path like it in the future)
  ; and the second one is filled with the path to the bin directory that was put into that file.
  (added-racket/bin-to-path
   "Теперь вы можете использовать racket и его инструменты из"
   " командной строки.\n\nПуть"
   " по умолчанию PATH был настроен для всех пользователей добавлением файла"
   " ~a указывающего на ~a. Вы можете отменить эту настройку"
   " удалив ~a.")
  (adding-racket/bin-no-paths.d
   "Не удалось добавить racket в командную строку, потому что /etc/paths.d не"
   " существует.\n\nВозможно сработает выполнение этой команды в окне терминала"
   " для создания каталога:\n"
   "    sudo mkdir /etc/paths.d\nи повторная попытка.")
  (added-racket/bin-to-path/windows
   "Теперь вы можете использовать racket и его инструменты из"
   " командной строки.\n\nПуть"
   " по умолчанию %PATH% был настроен через запись реестра"
   " HKEY_CURRENT_USER\\Environment\\Path"
   " указывающую на ~a и ~a.")
  (didnt-add-racket/bin-to-path/unix
   "DrRacket не может обновить ваш путь под unix."
   " Но если вы знаете, как настроить PATH самостоятельно,"
   " добавьте\n\n  ~a\n\n"
   " в него.")
  (add-racket/bin-to-path "Настроить командную строку для Racket…") ;; menu item label
  
  ;; quickscript messages
  (qs-my-first-script "Мой первый скрипт")
  (qs-script-library "Библиотека скриптов")
  (qs-directories "Каталоги")
  (qs-add "&Добавить")
  (qs-remove "&Удалить")
  (qs-scripts "Скрипты")
  (qs-disable "&Отключить")
  (qs-enable "&Включить")
  (qs-shadow "&Затенить")
  (qs-recompiling  "Перекомпилировать быстрые скрипты…")
  (qs-recompiling-wait "Перекомпиляция быстрых скриптов, пожалуйста ждите…")
  (qs-scripts "&Скрипты")
  (qs-manage "&Управление")
  (qs-compilation-error "Быстрый скрипт: ошибка при компиляции")
  (qs-caught-exception  "Быстрый скрипт поймал исключение")
  (qs-recompiling-library "Перекомпиляция библиотеки")
  (qs-my-script "Мой потрясающий скрипт")
  (qs-script-help "Строка помощи скрипта.")
  (qs-compiling-scripts "Компиляция скриптов")
  ;; ~a is a script file including its path
  (qs-compiling "Компилируется ~a")
  ;; ~a is a script file including its path
  (qs-file-not-found "Файл не найден: ~a")
  (qs-invalid-hook "Ошибочное имя события.\n Доступные имена:\n")
  ;; the  three `qs-error-detail-*` string constants are put into the same message
  (qs-error-detail-overview "~a ошибок было поймано.") ; the ~a is number of errors
  (qs-error-detail-summary "Свод:")
  (qs-error-detail-details "Подробности:")
  (qs-script-name "Имя скрипта")
  (qs-script-name-enter "Введите имя новогго скрипта:")
  (qs-open-script "Открыть скрипт")
  ;; ~a is the name of a script file
  (qs-error-run "Выполнение: ошибка в файле скрипта ~s:\n" )
  (qs-output "Вывод") ;; not repl-out-color where it means color of the output
  (qs-load-script-menu "Загрузка меню скриптов")
  (qs-loading-file "Загрузка файла ")
  ;; ~a is the name of a script file
  (qs-script-file "Файл скрипта ~s:")
  (qs-build-menu "Построение меню скриптов")
  ;; ~a is number of rebuilds
  (qs-menu-rebuild "Перестройка меню скриптов #~a...")
  (qs-delete-menu "Удаление пунктов меню")
  ;; ~a is a a script entry in menu
  (qs-delete-menu-item "Удаление пункта меню ~a... ")
  (qs-new-script "&Новый скрипт…")
  (qs-open-script "&Открыть скрипт…")
  (qs-disable-scripts "&Отключить скрипты…")
  (qs-library "&Библиотека…")
  (qs-reload-menu "&Перезагрузить меню")
  (qs-compile-scripts "&Скомпилировать скрипты")
  (qs-stop-scripts "&Остановить постоянные скрипты")
  (qs-report-issue "Сообщить о &проблеме")
  (qs-error-load "Быстрый скрипт: ошибки при загрузке свойств скриптов")
  )
