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

(module english-string-constants "string-constant-lang.rkt"
  ;;; when translating this constant, substitute name of actual language for `English'
  (is-this-your-native-language "Czy Polski jest Twoim językiem ojczystym?")

  (#:define drr "DrRacket")

  (are-you-sure-you-want-to-switch-languages
   "This will change the language of the GUI, which requires you to restart DrRacket. Are you sure?")

  (interact-with-drscheme-in-language "Interact with DrRacket in English")

  ;; these two should probably be the same in all languages except English.
  ;; they are the button labels (under macos and windows, respectively)
  ;; that go the with the string above.
  (accept-and-quit "Zaakceptuj i zakończ")
  (accept-and-exit "Zaakceptuj i wyjdź")

  ;;; general purpose (DrRacket is hereby a word in every language, by decree of Robby :)
  (plt "PLT")
  (drscheme drr)
  (drracket drr)
  (ok "OK")
  (cancel "Anuluj")
  (abort "Przerwij")
  (untitled "Bez tytułu")
  (untitled-n "Bez tytułu ~a")
  (warning "Ostrzeżenie")
  (error "Błąd")
  (close "Zamknij") ;; as in, close an open window or tab. must match close-menu-item
  ;; in the sense that, when the &s have been stripped from
  ;; close-menu-item, it must be the same string as this.
  (close-window "Zamknij okno")
  (stop "Stop")
  (&stop "&Stop") ;; for use in button and menu item labels, with short cut.
  (are-you-sure-delete? "Czy na pewno chcesz usunąć ~a?") ;; ~a is a filename or directory name
  (are-you-sure-replace? "Czy na pewno chcesz zastąpić ~a?") ;; ~a is a filename or directory name
  (ignore "Ignoruj")
  (revert "Powtórz")

  ;; label for a generic check box, often supported on dialogs
  ;; that ask a binary choice of the user. If checked, the
  ;; dialog isn't going to be shown again.
  ;; One version for always using the current choice:
  (dont-ask-again-always-current "Nie pytaj ponownie (zawsze używaj aktualnego wyboru)")
  ;; One generic version (ie, on the Quit DrRacket dialog)
  (dont-ask-again                "Nie pytaj ponownie")

  ;;; important urls
  (web-materials "Powiązane strony internetowe") ;; menu item title
  (tool-web-sites "Strony internetowe z narzędziami")   ;; menu item title
  (plt-homepage "Racket")
  (pbd-homepage "Programowanie według projektu")

  ;; having an issue (replaces the bug report form, whose string constants are below)
  (have-an-issue? "Masz problem?…")
  (use-github-or-the-mailing-list-for-issues
   "Jeśli znalazłeś błąd w Racket lub DrRacket, otwórz zgłoszenie na"
   " GitHub.\n\nJeśli znalazłeś coś, co nie ma sensu, ale"
   " nie jesteś pewien, czy jest to błąd, czy nie, spróbuj zapytać na liście mailingowej.")
  (visit-mailing-lists "Odwiedź listy mailingow") ;; button in dialog
  (visit-github "Odwiedź GitHub") ;; button in dialog, goes to 'open issue' page

  ;;; bug report form
  (cancel-bug-report? "Anulować zgłoszenie błędu?")
  (are-you-sure-cancel-bug-report?
   "Czy na pewno chcesz anulować wysyłanie tego zgłoszenia błędu?")
  (do-you-want-to-discard-or-save-this-bug-report
   "Czy chcesz odrzucić lub zapisać ten raport o błędzie?")
  (discard "Odrzuć") ;; a button label for a dialog box with the above question
  (bug-report-form "Formularz zgłaszania błędów")
  (bug-report-field-name "Twoje imię")
  (bug-report-field-email "E-mail")
  (bug-report-field-summary "Podsumowanie")
  (bug-report-field-severity "Poziom istotności")
  (bug-report-field-class "Klasa")
  (bug-report-field-description "Opis")
  (bug-report-field-reproduce1 "Kroki do")
  (bug-report-field-reproduce2 "odtworzenia")                           ;;; ???
  (bug-report-field-environment "Środowisko")
  (bug-report-field-docs-installed "Zainstalowana dokumentacja")
  (bug-report-field-collections "Kolekcje")
  (bug-report-field-links "Linki")  ;; from 'raco link'
  (bug-report-field-human-language "Język ludzki")
  (bug-report-field-memory-use "Wykorzystanie pamięci")
  (bug-report-field-version "Wersja")
  (bug-report-synthesized-information "Zsyntetyzowane informacje")  ;; dialog title
  (bug-report-show-synthesized-info "Pokaż zsyntetyzowane informacje")
  (bug-report-submit "Prześlij")
    ;; button in bug report dialog, next to cancel and bug-report-submit
  (close-and-save-bug-report "Zamknij i zapisz")
  ;; same as above, but used when there are saved bug reports
  (bug-report-submit-menu-item "Prześlij raport o błędzie…")
  ;; in Help Menu, submenu title
  (saved-bug-reports-menu-item "Zapisane raporty o błędach")
  ;; menu item: only shows up when there is more than one saved bug report
  (disacard-all-saved-bug-reports "Odrzuć wszystkie zapisane raporty o błędach")
  ;; an info message that shows up as a disabled menu item when no saved bug reports are around
  (no-saved-bug-reports "Nie zapisano żadnych raportów o błędach")
  ;; button label the user sees when there are saved bug reports,
  ;; but the user asks to save another one.
  (new-bug-report "Nowy raport o błędach")
  ;; button on the bottom of the bug report form
  (close-and-save "Zamknij i zapisz")
  (saved-unsubmitted-bug-reports "Zapisane, niezgłoszone raporty o błędach:")
  ;; the above string constant is next to previous line in same dialog, followed by
  ;; list of bug report subjects (as buttons)
  (error-sending-bug-report "Wystąpił błąd przy wysyłaniu raportu o błędzie")
  (error-sending-bug-report-expln
   "Wystąpił błąd podczas wysyłania tego zgłoszenia błędu."
   " Jeśli połączenie internetowe działa prawidłowo, odwiedź stronę \n\n"
   " https://github.com/racket/racket/issues/new\n\nand"
   " i prześlij błąd za pośrednictwem GitHub. Przepraszamy za trudności.\n\n Komunikat o błędzie to:\n~a")
  (illegal-bug-report "Nielegalny raport o błędzie")
  (pls-fill-in-field "Proszę o wypełnienie pola “~a”")
  (malformed-email-address "Nieprawidłowy adres e-mail")
  (pls-fill-in-either-description-or-reproduce
   "Proszę o wypełnienie pola “Opis” lub “Kroki do odtworzenia”.")

  ;;; check syntax
  (check-syntax "Sprawdź składnię")
  (cs-italic "Kursywa")
  (cs-bold "Pogrubienie")
  (cs-underline "Podkreślenie")
  (cs-smoothing-default "Domyślny")
  (cs-smoothing-partial "Częściowo wygładzone")
  (cs-smoothing-full "Wygładzone")
  (cs-smoothing-none "Niewygładzony")
  (cs-change-color "Zmień kolor")
  (cs-foreground-color "Kolor pierwszego planu")
  (cs-background-color "Kolor tła")
  (cs-tack/untack-arrow "Tack/Untack Arrow(s)")                         ;;; ???
  (cs-tack-crossing-arrows "Tack Crossing Arrows")                      ;;; ???
  (cs-jump-to-next-bound-occurrence "Przejdź do następnego powiązanego wystąpienia")
  (cs-jump-to-previous-bound-occurrence "Przejdź do poprzedniego powiązanego wystąpienia")
  (cs-jump-to-binding "Przeskok do wystąpienia wiązania")
  (cs-jump-to-definition "Przejdź do definicji (w innym pliku)")
  (cs-open-defining-file "Otwórz plik definiujący")
  (cs-error-message "Komunikat o błędzie")
  (cs-open-file "Otwórz ~a")
  (cs-rename-var "Zmień nazwę ~a")
  (cs-rename-id "Zmień nazwę indentyfikatora")
  (cs-rename-var-to "Zmień “~a” na:")
  (cs-name-duplication-error
   "Wybrana nowa nazwa, ~s, koliduje z już ustaloną nazwą w tym zakresie.")
  (cs-rename-anyway "Zmień nazwę mimo wszystko")
  (cs-status-init "Sprawdzanie składni: Inicjowanie środowiska dla kodu użytkownika")
  (cs-status-coloring-program "Sprawdzanie składni: koloryzowanie wyrażeń")
  (cs-status-eval-compile-time "Sprawdzanie składni: czas kompilacji eval")
  (cs-status-expanding-expression "Sprawdzanie składni: rozszerzanie wyrażeń")
  (cs-status-loading-docs-index "Sprawdzanie składni: ładowanie indeksu dokumentacji")
  (cs-syncheck-running "Sprawdzanie składni dzaiła")
  (cs-mouse-over-import "wiązanie “~s” zaimportowane z ~s")
  (cs-mouse-over-import/library-only "zaimportowane z ~s")
  (cs-view-docs "Wyświetl dokumentację dla “~a”")
  (cs-view-docs-from "~a z ~a")  ;; a completed version of the line above
  ;; (cs-view-docs) is put into the first ~a and a list of modules (separated by commas)
  ;; is put into the second ~a. Use check syntax and right-click on a documented variable
  ;; (eg, 'require') to see this in use

  (cs-lexical-variable "lexical variable")
  (cs-set!d-variable "mutated variable")
  (cs-imported-variable "imported variable")
  (cs-unused-require "unused require")
  (cs-free-variable "free variable")

  (cs-binder-count "~a binding occurrences")
  (cs-zero-varrefs "no bound occurrences")
  (cs-one-varref "1 bound occurrence")
  ;; expected to have one ~a formatter that will accept a number
  (cs-n-varrefs "~a bound occurrences")

  (cs-contract-my-obligation "Contract: this module's obligation")
  (cs-contract-their-obligation "Contract: clients modules' obligation")
  (cs-contract-both-obligation "Contract: both this module and client modules' obligation")
  (cs-contract-unk-obligation "Contract: unknown obligation")

  ;; require prefix functionality
  (cs-add-prefix-for-require "Dodaj prefiks dla wymogu (require)")
  (cs-prefix-require-title "Prefiks wymogu")
  (cs-prefix-require "Wybierz prefiks, który zostanie dodany do każdej importowanej zmiennej")
  (cs-all-binders-are-prefixed
   "Wszystkie wymagania wydają się już mieć prefiks; spróbuj zamiast tego zmienić jego nazwę")
  (cs-the-binder-is-prefixed
   "Wygląda na to, że wymaganie ma już prefiks; spróbuj zamiast tego zmienić jego nazwę")

  ;; mode sub-menu in the "view" menu
  (cs-check-syntax-mode "Tryb sprawdzania składni")
  (cs-mode-menu-show-my-obligations "Moje zobowiązania kontraktu")
  (cs-mode-menu-show-client-obligations "Klienckie zobowiązania kontraktu")
  (cs-mode-menu-show-syntax "Kategorie składniowe")

  ;; the documentation blue boxes in the upper-right corner of the drracket window
  (sc-read-more... "czytaj więcej…")
  (sc-f2-to-un/lock "f2 aby (od)blokować")

  ;; the online check syntax status messages (mouse over the bottom right of drracket's
  ;; window to see the messages during online expansion's various phases)
  (online-expansion-running "Uruchomione rozszerzenie w tle")
  (online-expansion-only-raw-text-files-supported "Obsługiwane są tylko pliki czysto tekstowe")
  (online-expansion-abnormal-termination "Rozszerzanie w tle zakończyło się nieprawidłowo")
  (online-expansion-abnormal-termination-out-of-memory
   "Rozszerzanie w tle zakończone nieprawidłowo (brak dostępnej pamięci)")
  (online-expansion-finished-successfully "Rozszerzanie w tle zakończyło się pomyślnie")

  (jump-to-error "Skocz do błędu")
  (copy-error-message "Skopiuj wiadomość o będzie")
  (online-expansion-is-disabled "Rozszerzanie w tle jest wyłaczone")
  ; these next two show up in the bar along the bottom of the drracket window
  (online-expansion-pending "Rozszerzanie w tle w toku…")
  ;; note: there may still be errors in this case
  (online-expansion-finished "Rozszerzanie w tle zakończone")
  ; the next two show up in a menu when you click on the circle in the bottom right corner
  (disable-online-expansion "Wyłączanie rozszerzania w tle")
  (enable-online-expansion "Włączenie rozszerzania w tle")
  ;; the online expansion preferences pane
  (online-expansion "Rozszerzanie w tle") ;; title of prefs pane
  ; the different kinds of errors
  (online-expansion-show-read-errors-as "Pokaż błędy na poziomie odczytu")
  (online-expansion-show-variable-errors-as "Pokaż błędy niezwiązanego identyfikatora")
  (online-expansion-show-other-errors-as "Pokaż inne błędy")
  ; locations the errors can be shown
  (online-expansion-error-gold-highlight "ze złotym podświetleniem")
  (online-expansion-error-margin "na marginesie")
  ; the label of a preference in the (string-constant online-expansion) section
  (show-arrows-on-mouseover "Wyświetlanie strzałek pozycji wiązania i ogona po najechaniu myszą")
  (show-blueboxes "Pokaż pola podpisu i półkole strzałki pola podpisu w prawym górnym rogu")
  ;;; info bar at botttom of drscheme frame
  (collect-button-label "GC")
  (read-only "Tylko do odczytu")
  (auto-extend-selection "Automatyczne rozszerzanie")
  (overwrite "Nadpisywanie")
  (running "uruchomiony")
  (not-running "nie uruchomiony")

  ;; button label: ~a is filled with the name of a pkg
  (install-package-button "Zainstaluj ~a")
  ;; button label; shown when there is a missing module, but no matching package
  (update-catalog "Zaktualizuj katalog")
  ;; message label; used as a status message when updating the pkg catalog
  (updating-catalog-from "Aktualizacja z ~a…")

  ;;; misc
  (welcome-to-something "Witaj w ~a")

  ; this appears in the drscheme about box.
  (welcome-to-drscheme-version/language "Witaj w programie DrRacket, wersji ~a, ~a")

  ; these appear on subsequent lines in the `Help|Welcome to DrRacket' dialog.
  (welcome-to-drscheme "Witaj w programie DrRacket")

  (goto-line "Idź do linii")
  (goto-line-invalid-number
   "~a nie jest prawidłowym numerem linii. Musi to być liczba całkowita pomiędzy 1 a ~a")
  (goto-position "Goto Position")
  (no-full-name-since-not-saved
   "The file does not have a full name because it has not yet been saved.")
  (cannot-open-because-dne "Nie można otworzyć ~a, ponieważ nie istnieje.")

  (needs-execute-language-changed
   "WARNING: Język został zmieniony. Kliknij przycisk Uruchom.")
  (needs-execute-teachpack-changed
   "WARNING: Teachpaki zostały zmienione. Kliknij przycisk Uruchom.")
  (needs-execute-defns-edited
   "WARNING: Okno definicji uległo zmianie. Kliknij przycisk Uruchom.")

  (editor-changed-since-srcloc-recorded
   "Ten edytor został zmieniony od czasu zarejestrowania lokalizacji źródłowej,"
   " więc podświetlony region może już nie odpowiadać prawidłowej lokalizacji źródłowej.")

  (file-is-not-saved "Plik “~a” nie jest zapisany.")
  (save "Zapisz")
  (close-anyway "Zamknij mimo to")
  (dont-save "Nie zapisuj")
  (clear-anyway "Wyczyść w każdym razie")

  ;; menu item title
  (log-definitions-and-interactions "Definicje dziennika i interakcje…")
  (stop-logging "Zatrzymaj rejestrowanie")
  (please-choose-a-log-directory "Wybierz katalog dziennika")
  (logging-to "Rejestrowanie do: ")
  (erase-log-directory-contents "Wymaż zawartość katalogu dziennika: ~a?")
  (error-erasing-log-directory "Błąd kasowania zawartości katalogu dziennika.\n\n~a\n")

  ;; menu items connected to the logger; also in a button in the planet status line in the drs frame
  (show-log "Pokaż &Log")
  (hide-log "Ukryj &Log")
  (logger-scroll-on-output "Przewijanie na wyjściu") ; a checkbox in the logger pane
  (log-messages "Komunikaty dziennika") ;; label for the drracket logging gui panel

  ;; modes
  (mode-submenu-label "Tryby")
  (scheme-mode "Tryb Scheme")
  (racket-mode "Tryb Racket")
  (text-mode "Tryb tekstowy")

  (scheme-mode-color-symbol "Symbol")
  (scheme-mode-color-keyword "Słowo kluczowe")
  (scheme-mode-color-comment "Komentarz")
  (scheme-mode-color-string "Łańcuch znaków")
  (scheme-mode-color-text "Tekst")
  (scheme-mode-color-constant "Stała")
  (scheme-mode-color-parenthesis "Nawias")
  (scheme-mode-color-hash-colon-keyword "#:Słowo-kluczowe")
  (scheme-mode-color-error "Błąd")
  (scheme-mode-color-other "Inne")
  ;; the ~a is filled in with one of the above (scheme-mode-*)
  (syntax-coloring-choose-color "Wybierz kolor dla ~a")
  (preferences-colors "Kolory") ;; used in the preferences dialog

  ;; parenthesis color scheme string constants
  ; label for the choice% menu in the preferences dialog
  (parenthesis-color-scheme "Schemat kolorów nawiasów")
  (paren-color-basic-grey "Podstawowy szary")
  (paren-color-shades-of-gray "Odcienie szarości")
  (paren-color-shades-of-blue "Odcienie niebieskiego")
  (paren-color-spring "Wiosna")
  (paren-color-fall "Jesień")
  (paren-color-winter "Zima")


  (url: "URL:")
  (open-url... "Otwórz URL…")
  (open-url "Otwórz URL")
  (browse... "Przeglądaj…")
  (bad-url "Zły URL")
  (bad-url:this "Zły URL: ~a")

  ;; Help Desk
  (help "Pomoc")
  (racket-documentation "Documentation Racketa")
  (help-desk "Help Desk")
  (plt:hd:search "Wyszukiwanie")
  (plt:hd:feeling-lucky "Feeling Lucky")
  (plt:hd:home "Strona główna Help Desk")
  ; next 3 are popup menu choices in help desk search frame
  (plt:hd:search-for-keyword "Wpis słowa kluczowego")
  (plt:hd:search-for-keyword-or-index "Słowo kluczowe lub wpis indeksu")
  (plt:hd:search-for-keyword-or-index-or-text "Słowo kluczowe, wpis indeksu lub tekst")
  (plt:hd:exact-match "Dokładne dopasowanie")
  (plt:hd:containing-match "Zawierające dopasowanie")
  (plt:hd:regexp-match "Dopasowanie wyrażenia regularnego")
  (plt:hd:find-docs-for "Znajdź dokumenty dla:")
  (plt:hd:search-stopped-too-many-matches "[Wyszukiwanie przerwane: zbyt wiele dopasowań]")
  (plt:hd:nothing-found-for "Nic nie znaleziono dla ~a")
  (plt:hd:and "i")
  (plt:hd:refresh "odśwież")
  (plt:hd:refresh-all-manuals "odśwież wszystkie instrukcje")
  (plt:hd:manual-installed-date "(zainstalowano ~a)")
  ; Help Desk configuration
  ;; refreshing manuals
  (plt:hd:refreshing-manuals "Ponowne pobieranie instrukcji")
  (plt:hd:refresh-downloading... "Pobieranie ~a…")
  (plt:hd:refresh-deleting... "Usuwanaie starej wersji ~a…")
  (plt:hd:refresh-installing... "Instalowenie nowej wersji ~a…")
  (plt:hd:refresh-clearing-indices "Czyszczenie indeksów w pamięci podręcznej")
  (plt:hd:refreshing-manuals-finished "Ukończono.")
  (plt:hd:about-help-desk "O Help Desku")
  (plt:hd:help-desk-about-string
   "Help Desk jest kompletnym źródłem informacji o Rackecie."
   " \n\nWersja ~a\nCopyright (c) ~a-~a PLT")
  (plt:hd:help-on-help "Help on Help")
  (plt:hd:help-on-help-details
   "Aby uzyskać pomoc dotyczącą korzystania z Help Desk, kliknij pierwszy link `Help Desk' na stronie głównej Help Desku."
   " (Aby przejść do strony głównej, jeśli jeszcze tam nie jesteś, kliknij przycisk `Home'"
   " w górnej części okna Help Desk.)")
  (reload "Przeładowanie") ;; refresh the page in a web browser
  (plt:hd:ask-about-separate-browser
   "Wybrano łącze do treści z sieci WWW."
   " Czy chcesz wyświetlić go w przeglądarce Help Desk, czy"
   " chcesz użyć oddzielnego programu przeglądarki, aby go wyświetlić?")
  (plt:hd:homebrew-browser "Przeglądarka dla Help Desk") ;; choice for the above string (in a button)
  (plt:hd:separate-browser "Oddzielna przeglądarka") ;; other choice for the above string (also in a button)
  (plt:hd:external-link-in-help "Zewnętrzne adresy URL w Pomocy (Help)")
  (plt:hd:use-homebrew-browser "Użyj przeglądarki Help Desk dla zewnętrznych adresów URL")
  (plt:hd:new-help-desk "Nowy Help Desk")

  ;; in the Help Desk language dialog, title on the right.
  (plt:hd:manual-search-ordering "Kolejność wyszukiwania w podręcznikach")

  ;; in the help-desk standalone font preference dialog, on a check box
  (use-drscheme-font-size "Użyj rozmiaru czcionki z DrRacket")

  ;; in the preferences dialog in drscheme there is example text for help desk font size.
  ;; clicking the links in that text produces a dialog with this message
  (help-desk-this-is-just-example-text
   "To jest tylko przykładowy tekst do ustawienia rozmiaru czcionki."
   " Otwórz Help Desk (z menu Pomoc), aby skorzystać z tych linków.")

  ;; this appears in the bottom part of the frame the first time the user hits `f1'
  ;; (assuming nothing else has loaded the documentation index first)
  ;; see also: cs-status-loading-docs-index
  (help-desk-loading-documentation-index "Help Desk: ładowanie indeksu dokumentacji")

  ;; the next four are all in the same dialog box (only one of the first two appears)
  (help-desk-materialize-docs-something-changed
   "DrRacket wykrył możliwy problem z indeksem dokumentacji."
   " Czy powinien spróbować go naprawić (może to potrwać kilka"
   " chwil)?\n\nBardziej szczegółowo: katalog dokumentacji ~a nie istnieje,"
   " a zatem wyszukiwanie w przeglądarce prawdopodobnie nie powiedzie się.")
  (help-desk-materialize-docs-first-time
   "DrRacket wykrył możliwy problem z indeksem dokumentacji."
   " Czy powinien spróbować go naprawić (może to potrwać kilka"
   " chwil)?\n\nBardziej szczegółowo, DrRacket nie zmaterializował"
   " dokumentacji użytkownika, a zatem wyszukiwanie w"
   " przeglądarce może się nie powieść.")
  (help-desk-do-nothing "Nie rób nic")
  (help-desk-materialize-user-docs "Materialize User Docs")
  ; this is used in a dialog to let the user know that work is being done based on
  ; choices made from the previous dialog in the above four string constants
  (help-desk-materializing-user-docs... "Materializowanie dokumentacji użytkownika...")

  ;; Help desk htty proxy
  (http-proxy "Serwer proxy HTTP")
  (proxy-direct-connection "Połączenie bezpośrednie")
  (proxy-use-proxy "Użyj serwera proxy:")
  (proxy-host "Host")
  (proxy-port "Port")
  (proxy-bad-host "Zły host serwera proxy")

  ;; browser
  (rewind-in-browser-history "Przewijanie")
  (forward-in-browser-history "Forward")
  (home "Strona domowa")
  (browser "Przeglądarka")
  (external-browser-choice-title "Zewnętrzna przeglądarka") ; title for radio-button set
  (browser-command-line-label "Linia poleceń:") ; label for radio button that is followed by text boxes
  (choose-browser "Wybierz przeglądarkę")
  (no-browser "Zapytaj później")
  ; explanatory text for dialog, line 1
  (browser-cmdline-expl-line-1 "(Wiersz poleceń utworzony przez połączenie tekstu wstępnego, adresu URL")
  ; ... line 2. (Anyone need more lines?)
  (browser-cmdline-expl-line-2 "i post-tekst, bez dodatkowych spacji między nimi).")
  (install? "Zainstalować?")  ;; if a .plt file is found (title of dialog)
  (you-have-selected-an-installable-package "Wybrano pakiet do zainstalowania.")
  (do-you-want-to-install-it? "Czy chcesz go zainstalować?")
  (paren-file-size "(Plik ma ~a bajtów)")
  (download-and-install "Pobierz && zainstaluj") ;; button label
  (download "Pobierz") ;; button label
  (save-downloaded-file/size "Zapisz pobrany plik (~a bajtów) jako") ;; label for get-file dialog
  (save-downloaded-file "Zapisz pobrany plik jako")  ;; label for get-file dialog
  (downloading "Pobieranie") ;; dialog title
  (downloading-file... "Pobieranie pliku…")
  (package-was-installed "Pakiet został zainstalowany.")
  (download-was-saved "Pobrany plik został zapisany.")

  (install-plt-file-menu-item... "Zainstaluj plik .plt…")
  (install-plt-file-dialog-title "Zainstaluj plik .plt")
  (install-plt-web-tab "Sieć")
  (install-plt-file-tab "Plik")
  (install-plt-filename "Nazwa pliku:")
  (install-plt-url "URL:")
  ; an error message from a primitive operation is appended to the end of this message.
  (install-plt-error-downloading "Wystąpił błąd podczas pobierania"
                                 " pliku .plt.\n\nDetale:\n")
  (install-plt-error-header
   "Wystąpił błąd podczas sprawdzania ważności"
   " pobranego pliku .plt. Sprawdź adres URL i spróbuj ponownie.")

  ;; install plt file when opened in drscheme strings
  (install-plt-file "Zainstalować ~a czy otworzyć do edycji?")
  (install-plt-file/yes "Zainstaluj")
  (install-plt-file/no "Edytuj")

  (plt-installer-progress-window-title "Postęp instalatora") ;; frame title
  (plt-installer-abort-installation "Przerwanie instalacji") ;; button label
  ;; msg that appears in the installation window when installation is aborted
  (plt-installer-aborted "Przerwano.")

  ;;; about box
  (about-drscheme-frame-title "O programie DrRacket")

  ;;; save file in particular format prompting.
  (save-as-plain-text "Zapisać ten plik jako zwykły tekst?")
  (save-as-binary-format "Przekonwertować ten plik do formatu specyficznego dla DrRacket, aby zachować elementy nietekstowe?")
  (save-in-drs-format "Zapisać ten plik w formacie nietekstowym specyficznym dla DrRacket?")
  (keep-format "Zachowaj (występuje mozliwośc utraty danych)")
  (convert-format "Konwertuj (zalecane)")
  (dont-save "Nie zapisuj")
  (yes "Tak")
  (no "Nie")

  ;; saving image (right click on an image to see the text)
  (save-image "Zapisz obraz…")

  ;;; preferences
  (preferences "Preferencje")
  (error-saving-preferences "Błąd zapisywania preferencji: ~a")
  (error-saving-preferences-title "Błąd zapisywania preferencji")
  ;; in the preferences error dialog; this happens when the lockfile exists (after 3 pref writes).
  (steal-the-lock-and-retry "Zwolnienie blokady i ponowna próba")

  (error-reading-preferences "Błąd odczytu preferencji")
  (error-reading-preferences-explanation
   "Plik preferencji jest zablokowany i dlatego nie można odczytać preferencji ~a")
  ;; in the above, ~a is filled with the name of the preference (a symbol)
  (dont-ask-again-until-drracket-restarted "Nie pytaj ponownie (dopóki DrRacket nie zostanie ponownie uruchomiony)")
  ; difference between the above and below is one comes with a question (steal the lock or not)
  ;; and the other with just a notation saying "the file is locked"
  (dont-notify-again-until-drracket-restarted "Nie powiadamiaj ponownie (dopóki DrRacket nie zostanie ponownie uruchomiony)")
  (prefs-file-locked
   "Plik preferencji jest zablokowany (ponieważ istnieje plik ~a),"
   " więc zmiana preferencji nie mogła zostać zapisana. Anulować zmianę preferencji?")
  (try-again "Spróbuj ponownie") ;; button label
  (give-up-and-use-the-default "Poddaj się i użyj domyślnego") ;; button label

  (prefs-file-still-locked
   "Plik preferencji jest nadal zablokowany (ponieważ plik ~a istnieje),"
   " więc zmiana preferencji nie zostanie zapisana.")
  (prefs-file-locked-nothing-doing
   "Plik preferencji jest zablokowany (przez ~s), więc zmiany preferencji nie mogą zostać zapisane.")
  ;; the  ~s is filled with the lockfile; this string is (currently) used only on
  ;; windows where lockfiles are less friendly (and there is no steal fallback)

  (scheme-prefs-panel-label "Racket")
  (warnings-prefs-panel-label "Ostrzeżenia")
  (editor-prefs-panel-label "Edytowanie")
  (general-prefs-panel-label "Ogólne")
  (editor-general-prefs-panel-label "Edycja ogólna")
  (highlight-parens "Podświetlenie między pasującymi nawiasami")
  (fixup-open-brackets "Automatycznie dostosuj otwierające nawiasy kwadratowe")
  (fixup-close-parens "Automatycznie dostosuj nawiasy zamykające")
  (flash-paren-match "Migające dopasowanie nawiasów")
  (backup-unsaved-files "Tworzenie kopii zapasowych niezapisanych plików")
  (first-change-files "Tworzenie plików pierwszej zmiany")
  (map-delete-to-backspace "Zmapój delete na backspace")
  (verify-exit "Weryfikacja wyjścia")
  (ask-before-changing-format "Zapytaj przed zmianą formatu zapisu")
  (wrap-words-in-editor-buffers "Zawijanie słów w buforach edytora")
  (show-status-line "Pokaż linię statusu")
  (count-columns-from-one "Liczenie numerów kolumn od jednego")
  (display-line-numbers "Wyświetla numery linii w buforze, a nie przesunięcia znaków")
  ; used for popup menu; right click on line/column box in bottom of drs window
  (show-line-and-column-numbers "Pokaż numery wierszy i kolumn")
  ; used for popup menu; right click on line/column box in bottom of drs window
  (show-character-offsets "Pokaż przesunięcia znaków")
  (enable-keybindings-in-menus "Włączenie powiązań klawiszy w menu (zastępuje powiązania klawiszy Emacsa)")
  (printing-mode "Tryb drukowania")
  (print-using-platform-specific-mode "Drukowanie specyficzne dla danej platformy")
  (print-to-ps "Drukowanie do pliku PostScript")
  (print-to-pdf "Drukowanie do pliku PDF")
  (command-as-meta "Traktuj klawisz polecenia jako klawisz meta") ;; macos/macos x only
  (any-control+alt-is-altgr "Traktuj kombinację klawiszy Control-Alt jako AltGr") ; Windows only
  (alt-as-meta "Traktuj klawisz alt jako meta")
  (reuse-existing-frames "Ponowne wykorzystanie istniejących ramek podczas otwierania nowych plików")
  (default-fonts "Domyślne czcionki")
  (basic-gray-paren-match-color "Podstawowy szary kolor podświetlenia nawiasów") ; in prefs dialog
  (online-coloring-active "Interaktywnie koloryzuj składnię")
  (open-files-in-tabs "Otwieranie plików w osobnych kartach (nie w osobnych oknach)")
  (show-interactions-on-execute "Automatyczne otwieranie okna interakcji podczas uruchamiania programu")
  (switch-to-module-language-automatically
   "Automatyczne przełączanie na język modułu podczas jego otwierania")
  ;; in preferences, below the checkbox one line above this one
  (interactions-beside-definitions "Umieść okno interakcji obok okna definicji")
  (show-line-numbers "Show line numbers")
  ;; just like the above, but capitalized for appearance in a menu item
  (show-line-numbers/menu "Pokaż &numery linii")
  (hide-line-numbers/menu "Ukryj &numery linii")
  (show-line-numbers-in-definitions "Pokaż wszystkie numery linii w definicjach")
  ;; the constant above shows up in the popup menu item in the bottom of
  ;; the drracket window; controls the line numbers on each line in the definitions;
  ;; used in a checkable menu item
  (reflow-paragraph-maximum-width "Maksymalna szerokość podczas przelewania akapitów")
  (maximum-char-width-guide-pref-check-box "Wskazówka dotycząca maksymalnej szerokości znaków")
  (hide-column-width-guide "Przewodnik po szerokości kolumn dla plików z ~a kolumnami")
  (show-column-width-guide "Pokaż prowadnicę szerokości kolumny przy ~a kolumnach") ;; filled with a number > 2
  (limit-interactions-size "Ograniczenie rozmiaru interakcji")
  ;; this is in the color section already, so shorten the name a little
  (background-color "Tło")
  ;; used for configuring colors, but doesn't need the word "color"
  (default-text-color "Tekst domyślny")
  (choose-a-background-color "Należy wybrać kolor tła")
  (revert-to-defaults "Przywróć wszystkie ustawienia domyślne")
  ;; used in the preferences dialog to undo preference changes
  (undo-changes "Cofnij zmiany i zamknij")

  (color-schemes "Color Schemes") ;; the label in the preferences dialog for the color scheme panel
  (classic-color-scheme "Classic") ;; formerly called 'black on white'
  (modern-color-scheme "Modern")   ;; an attempt to be more color-blind friendly
  ;; clicking the buttons changes the color schemes to some defaults that've been set up.
  (white-on-black-color-scheme "White on Black")
  ; drracket additions to the color scheme dialog; two buttons
  (design-your-own-color-schemes "Design Your Own Color Schemes") ; pointer to (english-only) docs
  (style-and-color-names "Style && Color Names")

  (add-spacing-between-lines "Add one pixel of extra space between lines")

  (editor-x-selection-mode "Explicitly require a copy operation before"
                           " a paste / Do not automatically copy the selection")

  ; should have entire alphabet
  (font-example-string "The quick brown fox jumped over the lazy dogs.")

  (change-font-button-label "Change")
  (fonts "Fonts")
  (other... "Other…") ;; used in the font choice menu item

  ; filled with type of font, eg modern, swiss, etc.
  (choose-a-new-font "Please choose a new “~a” font")

  (font-size-slider-label "Size")
  (restart-to-see-font-changes "Restart to see font changes")

  (font-prefs-panel-title "Font")
  (font-name "Font Name")
  (font-size "Font Size")
  (set-font "Set Font…")
  (font-smoothing-label  "Font smoothing")
  (font-smoothing-none "None")
  (font-smoothing-some "Some")
  (font-smoothing-all "All")
  (font-smoothing-default "Use system-wide default")
  (font-weight-label "Weight")
  (font-weight-light "Light")
  (font-weight-normal "Normal")
  (font-weight-bold "Bold")

  (select-font-name "Select Font Name")
  (example-text "Example Text:")
  (only-warn-once "Only warn once when definitions and interactions are not synchronized")

  ; font size menu items in the 'view' menu; the ~a is filled with a number (font size)
  (increase-font-size "Increase Font Size (To ~a)")
  (decrease-font-size "Decrease Font Size (To ~a)")

  ; warning message when lockfile is around
  (waiting-for-pref-lock "Waiting for the preferences lockfile…")
  (pref-lock-not-gone
   "The preferences lockfile:\n\n   ~a\n\nprevents the preferences from being saved."
   " Ensure that no Racket software is running and delete this file.")
  (still-locked-exit-anyway? "The preferences were not saved sucessfully. Exit anyway?")

  ;;; indenting preferences panel
  (indenting-prefs-panel-label "Indenting")
  (indenting-prefs-extra-regexp "Extra regexp")

  (square-bracket-prefs-panel-label "Square Bracket")

  ; filled with define, lambda, or begin
  (enter-new-keyword "Enter new ~a-like keyword:")
  (x-keyword "~a Keyword")
  (x-like-keywords "~a-like Keywords")

  ; used in Square bracket panel
  (skip-subexpressions "Number of sub-expressions to skip")

  (expected-a-symbol "expected a symbol, found: ~a")
  (already-used-keyword "“~a” is already a specially indented keyword")
  (add-keyword "Add")
  (remove-keyword "Remove")

  ; repl color preferences
  (repl-colors "REPL")
  (repl-out-color "Output")
  (repl-value-color "Values")
  (repl-error-color "Errors")

  ;;; find/replace
  (search-next "Next")
  (search-previous "Prev")
  (search-match "Match")  ;;; this one and the next one are singular/plural variants of each other
  (search-matches "Matches")
  (search-replace "Replace")
  (search-skip "Skip")
  (search-show-replace "Show Replace")
  (search-hide-replace "Hide Replace")
  (find-case-sensitive "Case sensitive")  ;; the check box in both the docked & undocked search
  (find-anchor-based "Search using anchors")

  ;; these string constants used to be used by searching,
  ;; but aren't anymore. They are still used by other tools, tho.
  (hide "Hide")
  (dock "Dock")
  (undock "Undock")

  ;;; multi-file-search
  (mfs-multi-file-search-menu-item "Search in &Files…")
  (mfs-string-match/graphics "String match (handles files with graphics)")
  (mfs-regexp-match/no-graphics "Regular Expression (only raw text files)")
  (mfs-searching... "Searching…")
  (mfs-configure-search "Configure Search") ;; dialog title
  (mfs-files-section "Files")   ;; section in config dialog
  (mfs-search-section "Search") ;; section in config dialog
  (mfs-dir "Dir")
  (mfs-recur-over-subdirectories "Recur over subdirectories")
  (mfs-regexp-filename-filter "Regexp filename filter")
  (mfs-search-string "Search string")
  (mfs-drscheme-multi-file-search "Multi File Search - DrRacket") ;; error message window title
  (mfs-not-a-dir "“~a” is not a directory")
  (mfs-open-file "Open File")
  (mfs-stop-search "Stop Search")
  (mfs-case-sensitive-label "Case sensitive")
  (mfs-no-matches-found "No matches found.")
  (mfs-search-interrupted "Search aborted.")
  ;; the ~a format specifier is filled in with the search string
  (mfs-drscheme-multi-file-search-title "Multi File Search for “~a” - DrRacket")

  ;;; reverting a file
  (are-you-sure-revert
   "Are you sure that you want to revert this file? This change cannot be undone.")
  (are-you-sure-revert-title
   "Revert?")

  ;;; saving a file
  ; ~a is filled with the filename
  (error-saving "Error Saving") ;; title of error message dialog
  (error-saving-file/name "There was an error saving ~a.")
  (error-loading "Error Loading")
  (error-loading-file/name "There was an error loading ~a.")
  (unknown-filename "<< unknown >>")

  ;;; finder dialog
  (must-specify-a-filename "You must specify a file name")
  (file-does-not-exist "The file “~a” does not exist.")
  (ask-because-file-exists "The file “~a” already exists. Replace it?")
  (dne-or-cycle "The file “~a” contains a nonexistent directory or a cycle.")
  (get-file "Get file")
  (put-file "Put file")
  (full-pathname "Full pathname")
  (show-dot-files "Show files and directories that begin with a dot.")
  (up-directory-button-label "Up directory")
  (add-button-label "Add") ;;; for multi-file selection
  (add-all-button-label "Add all") ;;; for multi-file selection
  (remove-button-label "Remove") ;;; for multi-file selection
  (file-wrong-form "That filename does not have the right form.")
  (select-files "Select files")
  (select-file "Select a file")
  (dir-dne "That directory does not exist.")
  (file-dne "That file does not exist.")
  (empty-filename "The filename must have some letters in it.")
  (that-is-dir-name "That is a directory name.")
  (use-platform-specific-file-dialogs "Use platform-specific file dialogs") ;; a preferences option

  ;;; raw menu names -- these must match the
  ;;; versions below, once the &s have been stripped.
  ;;; if they don't, DrRacket's menus will appear
  ;;; in the wrong order.
  (file-menu "File")
  (edit-menu "Edit")
  (help-menu "Help")
  (windows-menu "Windows")
  (tabs-menu "Tabs") ;; this is the name of the "Windows" menu under linux & windows

  ;;; menus
  ;;; - in menu labels, the & indicates a alt-key based shortcut.
  ;;; - sometimes, things are stuck in the middle of
  ;;; menu item labels. For instance, in the case of
  ;;; the "Save As" menu, you might see: "Save Definitions As".
  ;;; be careful of spacing, follow the English, if possible.
  ;;; - the ellipses in the `after' strings indicates that
  ;;; more information is required from the user before completing
  ;;; the command.

  (file-menu-label "&File")

  (new-info  "Open a new file")
  (new-menu-item "&New")
  (new-...-menu-item "&New…")

  (open-info "Open a file from disk")
  (open-menu-item "&Open…")

  (open-recent-info "A list of the recently opened files")
  (open-recent-menu-item "Open Recen&t")

  (revert-info "Revert this file to the copy on disk")
  (revert-menu-item "&Revert")

  (save-info "Save this file to disk")
  (save-menu-item "&Save")

  (save-as-info "Prompt for a filename and save this file to disk")
  (save-as-menu-item "Save &As…")

  (print-info "Send this file to a printer")
  (print-menu-item "&Print…")

  (page-setup-info "Configure printing parameters")
  (page-setup-menu-item "Page Setup…")

  (close-info "Close this file")
  (close-menu-item "&Close")
  (close-window-menu-item "&Close Window")

  (quit-info "Close all windows")
  (quit-menu-item-windows "E&xit")
  (quit-menu-item-others "&Quit")

  (edit-menu-label "&Edit")

  (undo-info "Undo the most recent action")
  (undo-menu-item "&Undo")

  (redo-info "Undo the most recent undo")
  (redo-menu-item "&Redo")

  (cut-info "Move the selected items to the clipboard for later pasting")
  (cut-menu-item "Cu&t")

  (copy-info "Copy the selected items to the clipboard for later pasting")
  (copy-menu-item "&Copy")

  (paste-info "Paste the most recently copied or cut items, in place of the selected items")
  (paste-menu-item "&Paste")
  (paste-and-indent-menu-item "Paste and Indent")

  (clear-info "Erase the selected items without affecting the clipboard or pasting")
  (clear-menu-item-windows "&Delete")

  (select-all-info "Select the entire document")
  (select-all-menu-item "Select A&ll")

  (find-menu-item "Find") ;; menu item
  (find-from-selection-menu-item "Find From S&election")
  (find-info "Toggles the keyboard focus between the window being searched and the search bar")

  (find-next-info "Skip to the next occurrence of the string in the find window")
  (find-next-menu-item "Find Next")

  (find-previous-info "Skip to the previous occurrence of the string in the find window")
  (find-previous-menu-item "Find Previous")

  (show-replace-menu-item "Show Replace")
  (hide-replace-menu-item "Hide Replace")
  (show/hide-replace-info "Toggles the visibility of the replace panel")

  (replace-menu-item "Replace")
  (replace-info "Replace the search hit in the dark circle")

  (replace-all-info "Replace all occurrences of the search string")
  (replace-all-menu-item "Replace All")

  (find-case-sensitive-info "Toggles between case-sensitive and case-insensitive search")
  (find-case-sensitive-menu-item "Find Case Sensitive")

  (complete-word "Complete Word") ; the complete word menu item in the edit menu
  ; shows up in the completions menu when there are no completions (in italics)
  (no-completions "… no completions available")

  (overwrite-mode "Overwrite Mode")
  (enable-overwrite-mode-keybindings "Enable overwrite mode keybindings")

  (enable-automatic-parens "Enable automatic parentheses, square brackets, and quotes")

  (preferences-info "Configure your preferences")
  (preferences-menu-item "Preferences…")

  (keybindings-info "Show the currently active keybindings")
  (keybindings-menu-item "Keybindings")
  (keybindings-show-active "Show Active Keybindings")
  (keybindings-frame-title "Keybindings")
  (keybindings-sort-by-name "Sort by Name")
  (keybindings-sort-by-key "Sort by Key")
  (keybindings-add-user-defined-keybindings "Add User-defined Keybindings…")
  (keybindings-add-user-defined-keybindings/planet "Add User-defined Keybindings from PLaneT…")
  (keybindings-menu-remove "Remove ~a")
  (keybindings-choose-user-defined-file "Please choose a file containing keybindings.")
  ; the string will be what the user typed in
  (keybindings-planet-malformed-spec "The PLaneT spec is malformed: ~a")
  (keybindings-type-planet-spec "Please enter a PLaneT require spec (without the `require')")

  ; first ~a will be a string naming the file or planet package where the keybindings come from;
  ; second ~a will be an error message
  (keybindings-error-installing-file "Error when installing the keybindings ~a:\n\n~a")

  (user-defined-keybinding-error "Error running keybinding ~a\n\n~a")
  (user-defined-keybinding-malformed-file
   "The file ~a does not contain a module written in the framework/keybinding-lang language.")
  (user-defined-keybinding-malformed-file/found-lang
   "The file ~a does not contain a module written in the"
   " framework/keybinding-lang language. Instead, found the language ~s.")

  ;; menu items in the "special" menu
  (insert-text-box-item "Insert Text Box")
  (insert-image-item "Insert Image…")
  (insert-comment-box-menu-item-label "Insert Comment Box")
  (insert-lambda "Insert λ")

  (wrap-text-item "Wrap Text")

  ;; windows menu
  (windows-menu-label "&Windows")
  (tabs-menu-label "&Tabs") ;; this is the name of the menu under linux & windows
  (minimize "Minimize") ;; minimize and zoom are only used under mac os x
  (zoom "Zoom")
  (bring-frame-to-front "Bring Frame to Front")       ;;; title of dialog
  (bring-frame-to-front... "Bring Frame to Front…") ;;; corresponding title of menu item
  (most-recent-window "Most Recent Window")
  (next-tab "Next Tab")
  (prev-tab "Previous Tab")
  (move-current-tab-right "Move Tab &Right")
  (move-current-tab-left "Move Tab &Left")
  ;; menu item in the windows menu under mac os x. first ~a is filled
  ;; with anumber between 1 and 9; second one is the filename of the tab
  (tab-i "Tab ~a: ~a")
  (tab-i/no-name "Tab ~a")
  (last-tab "Last Tab: ~a")

  (view-menu-label "&View")
  (show-overview "Show &Program Contour")
  (hide-overview "Hide &Program Contour")
  (show-module-browser "Show &Module Browser")
  (hide-module-browser "Hide &Module Browser")

  (help-menu-label "&Help")
  (about-info "Credits and details for this application")
  (about-menu-item "About…")

  ;; open here's new menu item
  (create-new-window-or-clear-current
   "Would you like to create a new window, or clear out the current one?")
  (clear-current "Clear Current")
  (new-window "New Window")

  ;; popup menu when right-clicking in the gap between
  ;; the definitions and interactions window
  (change-to-vertical-alignment "Change to vertical")
  (change-to-horizontal-alignment "Change to horizontal")

  ;;; exiting and quitting ``are you sure'' dialog
  ;;; exit is used on windows, quit on macos, in English. Other
  ;;; languages probably use the same word on both platforms.
  (exit "Exit")
  (quit "Quit")
  (are-you-sure-exit "Are you sure you want to exit?")
  (are-you-sure-quit "Are you sure you want to quit?")
  ; these next two are only used in the quit/exit dialog
  ; on the button whose semantics is "dismiss this dialog".
  ; they are there to provide more flexibility for translations
  ; in English, they are just cancel.
  (dont-exit "Cancel")
  (dont-quit "Cancel")

  ;;; autosaving
  (error-autosaving "Error autosaving “~a”.") ;; ~a will be a filename
  (autosaving-turned-off "Autosaving is turned off\nuntil the file is saved.")
  (recover-autosave-files-frame-title "Recover Files")
  (autosave-details "Details")
  (autosave-recover "Recover")
  (autosave-unknown-filename "<<unknown>>")

  ;;; autoloading
  ;; the ~a is replaced with a path
  (autoload-file-changed-on-disk/with-name
   "The file:\n  ~a\nhas changed on the disk. Do you want"
   " to revert the buffer's contents to match the file on disk?")
  ;; One file per line is appended to the end of this message
  (autoload-files-changed-on-disk/with-name
   "Some files have changed on the disk. Do you want to revert their"
   " buffers’ contents to match the files on disk?\n\nFiles changed:")
  ;; the ~a is replaced with a path
  (autoload-file-changed-on-disk-editor-dirty/with-name
   "The file:\n  ~a\nhas changed on the disk and is also modified in the editor."
   " Do you want to revert the buffer's contents to match the file on disk?")
  ;; One file per line is appended to the end of this message
  (autoload-files-changed-on-disk-editor-dirty/with-name
   "Some files have changed on the disk and they are also modified in the editor."
   " Do you want to revert their buffers’ contents to match the files on"
   " disk?\n\nFiles changed:")
  ;; One file per line is appended to the end of this message
  (autoload-files-changed-on-disk-editor-dirty&clean/with-name
   "Some files have changed on the disk and some of them are also modified in the editor."
   " Do you want to revert their buffers’ contents to match the files on"
   " disk?\n\nFiles changed (a ◇ indicates that the editor’s version is modified):")
  ;; a specialized version of dont-ask-again-always-current
  (dont-ask-again-always-current/clean-buffer
   "Do not ask again for files with no unsaved edits (always use current choice)")

  (autoload-automatically-reload "Automatically Reload Changed Files")
  (autoload-when-the-editor-isnt-dirty "When the editor has not been modified")
  (autoload-never-revert "Never")
  (autoload-ask-about-reverting "Ask me each time")

  ;; these are labels in a dialog that drscheme displays
  ;; if you have leftover autosave files. to see the dialog,
  ;; start up drscheme and modify (but don't save) a file
  ;; (also, do this with an unsaved file). Wait for the autosave
  ;; files to appear (typically 5 minutes). Kill DrRacket
  ;; and restart it. You'll see the dialog
  (autosave-autosave-label: "Backup file:")
  (autosave-original-label: "Original file:")
  (autosave-autosave-label "Backup file")
  (autosave-original-label "Original file")
  (autosave-compare-files "Compare backup files")

  (autosave-show-autosave "Backup file") ;; title of a window showing the autosave file

  (autosave-explanation "DrRacket found backup files, which may contain your unsaved work.")

  (autosave-recovered! "Recovered!") ;; status of an autosave file
  (autosave-deleted "Deleted")       ;; status of an autosave file

  ;; first is a filename, second is an error message from racket.
  (autosave-error-deleting "Error deleting ~a\n\n~a")
  (autosave-delete-button "Delete")
  (autosave-delete-title "Delete")  ;; title of a dialog asking for deletion confirmation
  (autosave-done "Done")

  ;; appears in the file dialog
  (autosave-restore-to-where? "Choose a place to save the backup file.")

  ;;; file modified warning
  (file-has-been-modified
   "The file has been modified since it was last saved. Overwrite the modifications?")
  (overwrite-file-button-label "Overwrite")

  (definitions-modified
    "The definitions text has been modified in the file-system;"
    " please save or revert the definitions text.")

  ;; for a dialog that appears when Run is clicked and there are unsaved files
  ; the ~a is filled with a filename (same string that appears in a tab)
  (one-file-not-saved-do-the-save?
   "The file “~a” is not saved; save it before Run?")
  ; the string is suffixed with a list of filenames (which are separated by newlines)
  (many-files-not-saved-do-the-save?
   "Some other files are not saved; save them before Run?\n\nFiles:")
  ; button label to go ahead with saving
  (save-all-files "Save All Files")
  ; check box in the dialog and also used in the preferences dialog
  (save-after-switching-tabs "Save files whenever switching tabs or windows")
  (dont-ask-about-saving-after-switching-tabs
   "Don't ask and don't save files when clicking Run with unsaved tabs or windows")
  
  (drscheme-internal-error "DrRacket Internal Error")

  ;;; tools
  (invalid-tool-spec
   "The tool specification in collection ~a's info.rkt file is invalid."
   " Expected either a string or a non-empty list of strings, got: ~e")
  (error-invoking-tool-title "Error invoking tool ~s;~s")
  ;; ~s filled with a path, ~a filled with an error message from an exn
  (error-loading-tool-title "Error loading tool ~s\n~a")
  (tool-tool-names-same-length
   "expected `tool-names' and `tools' to be lists of the same length,"
   " in info.rkt file for ~s, got ~e and ~e")
  (tool-tool-icons-same-length
   "expected `tool-icons' and `tools' to be lists of the same length,"
   " in info.rkt file for ~s, got ~e and ~e")
  (tool-tool-urls-same-length
   "expected `tool-urls' and `tools' to be lists of the same length,"
   " in info.rkt file for ~s, got ~e and ~e")
  (error-getting-info-tool
   "error loading info.rkt file for ~s")
  (tool-error-phase1 "Error in phase 1 for tool ~s; ~s")
  (tool-error-phase2 "Error in phase 2 for tool ~s; ~s")
  ;; tool preferences panel
  (tool-config-changes
   "Changes to tool configuration will take effect the next time you start DrRacket.")
  (installed-tools "Installed tools")
  (tool-prefs-panel-tool:-label "Tool: ")
  (tool-prefs-panel-title "Tools")
  (load-tool-when-drracket-starts? "Load the tool when DrRacket starts?")
  (load-tool-load "Load the tool")
  (load-tool-skip "Skip the tool")
  (unnamed-tool "unnamed tool ~a")
  (note-that-tool-loaded " (loaded)")
  (note-that-tool-was-skipped " (skipped)")
  (note-that-tool-failed-to-load " (failed to load)")

  ;;; define popup menu
  (end-of-buffer-define "<< end of buffer >>")
  (sort-by-name "Sort by name")
  (sort-by-position "Sort by position in file")
  (no-definitions-found "<< no definitions found >>")
  (jump-to-defn "Jump to definition of ~a")
  (define-menu-configure "Configure") ;; label of a submenu to configure the (define ...) popup menu

  (recent-items-sort-by-age "Sort by Age")
  (recent-items-sort-by-name "Sort by Name")

  ;;; view menu
  (hide-definitions-menu-item-label "Hide &Definitions")
  (show-definitions-menu-item-label "Show &Definitions")
  (definitions-menu-item-help-string "Show/Hide the definitions window")
  (show-interactions-menu-item-label "Show &Interactions")
  (hide-interactions-menu-item-label "Hide &Interactions")
  (use-horizontal-layout "Use Horizontal Layout")
  (use-vertical-layout "Use Vertical Layout")
  (interactions-menu-item-help-string "Show/Hide the interactions window")
  (toolbar "Toolbar")
  (toolbar-on-top "Toolbar On Top")
  (toolbar-on-top-no-label "Toolbar On Top With Small Buttons")
  (toolbar-on-left "Toolbar On Left")
  (toolbar-on-right "Toolbar On Right")
  (toolbar-hidden "Toolbar Hidden")

  ;;; file menu
  (save-definitions-as "Save Definitions &As…")
  (save-definitions "Save Definitions")
  (print-definitions "Print Definitions…")
  (about-drscheme "About DrRacket")
  (save-other "Save Other")
  (save-definitions-as-text "Save Definitions As Text…")
  (save-interactions "Save Interactions")
  (save-interactions-as "Save Interactions As…")
  (save-interactions-as-text "Save Interactions As Text…")
  (print-interactions "Print Interactions…")
  (new-tab "New Tab")
  (close-tab "Close Tab") ;; must not have any &s in it.
   ;; like close-tab, but with an ampersand on the same letter as the one in close-menu-item
  (close-tab-amp "&Close Tab")
  (reopen-closed-tab "Reopen Closed Tab")
  
  ;;; edit menu
  (split-menu-item-label "&Split")
  (collapse-menu-item-label "C&ollapse")
  (find-longest-line "Find Longest Line")

  ;;; language menu
  (language-menu-name "&Language")

  ;;; scheme-menu
  (scheme-menu-name "Ra&cket")
  (execute-menu-item-label "Run")
  (execute-menu-item-help-string "Restart the program in the definitions window")
  (ask-quit-menu-item-label "Ask the Program to Quit")
  (ask-quit-menu-item-help-string
   "Uses break-thread to stop the primary thread of the current evaluation")
  (force-quit-menu-item-label "Force the Program to Quit")
  (force-quit-menu-item-help-string "Uses custodian-shutdown-all to abort the current evaluation")
  (limit-memory-menu-item-label "Limit Memory…")
  (limit-memory-msg-1 "The limit will take effect the next time the program")
  (limit-memory-msg-2 "is Run, and it must be at least eight megabytes.")
  (limit-memory-unlimited "Unlimited")
  (limit-memory-limited "Limited")
  (limit-memory-megabytes "Megabytes")
  ; the next two constants are used together in the limit memory dialog; they are inserted
  ; one after another. The first one is shown in a bold font and the second is not.
  ; (the first can be the empty string)
  (limit-memory-warning-prefix "Warning: ")
  (limit-memory-warning
   "the unlimited memory setting is unsafe. With this setting,"
   " DrRacket cannot protect itself against programs that allocate too much, and DrRacket may crash.")

  (clear-error-highlight-menu-item-label "Clear Error Highlight")
  (clear-error-highlight-item-help-string "Removes the pink error highlighting")
  (jump-to-next-error-highlight-menu-item-label "Jump to Next Error Highlight")
  (jump-to-prev-error-highlight-menu-item-label "Jump to Previous Error Highlight")
  (reindent-menu-item-label "&Reindent")
  (reindent-all-menu-item-label "Reindent &All")
  (semicolon-comment-out-menu-item-label "&Comment Out with Semicolons")
  (box-comment-out-menu-item-label "Comment Out with a &Box")
  (uncomment-menu-item-label "&Uncomment")

  (convert-to-semicolon-comment "Convert to Semicolon Comment")

  ;;; executables
  (create-executable-menu-item-label "Create &Executable…")
  (create-executable-title "Create Executable")
  (drracket-creates-executables-only-in-some-languages
   "The creation of executables in DrRacket is supported only when you"
   " have selected one of the teaching languages (DMdA or HtDP) in"
   " DrRacket's language dialog, or when you have selected “The Racket"
   " Language” in DrRacket's language dialog and the #lang line at the"
   " start of your program specifies a language.\n\nConsider"
   " using the raco exe command-line tool instead.")
  (must-save-before-executable "You must save your program before creating an executable.")
  (save-a-mred-launcher "Save a GRacket Launcher")
  (save-a-mzscheme-launcher "Save a Racket Launcher")
  (save-a-mred-stand-alone-executable "Save a GRacket Stand-alone Executable")
  (save-a-mzscheme-stand-alone-executable "Save a Racket Stand-alone Executable")
  (save-a-mred-distribution "Save a GRacket Distribution")
  (save-a-mzscheme-distribution "Save a Racket Distribution")
  ;; this is suffixed with an error message ala error-display-handler
  (error-creating-executable "Error creating executable:")

  (definitions-not-saved
    "The definitions window has not been saved. The executable will use the"
    " latest saved version of the definitions window. Continue?")
  ;; The "-explanatory-label" variants are the labels used for the radio buttons in
  ;;  the "Create Executable..." dialog for the "(module ...)" language.
  (launcher "Launcher")
  (launcher-explanatory-label "Launcher (for this machine only, runs from source)")
  (stand-alone "Stand-alone")
  (stand-alone-explanatory-label "Stand-alone (for this machine only, run compiled copy)")
  (distribution "Distribution")
  (distribution-explanatory-label "Distribution (to install on other machines)")
  (embed-dlls? "Embed DLLs in the executable?") ;; appears in the GUI only under windows
  (executable-type "Type")
  (executable-base "Base")
  (filename "Filename: ")
  (create "Create")
  (files-for-icons-etc "Files for icons, etc.")
  (please-specify-a-filename "Please specify a filename to create.")
  (~a-must-end-with-~a
   "The ~a filename\n\n  ~a\n\nis illegal. The filename must end with “.~a”.")
  (macosx-executables-must-end-with-app
   "The filename\n\n  ~a\n\nis illegal. Under Mac OS, an executable"
   " must be a directory whose name ends with .app.")
  (warning-directory-will-be-replaced
   "WARNING: the directory:\n\n  ~a\n\nwill be replaced. Proceed?")

  (distribution-progress-window-title "Distribution Progress")
  (creating-executable-progress-status "Creating executable for distribution…")
  (assembling-distribution-files-progress-status "Assembling files for distribution…")
  (packing-distribution-progress-status "Packing distribution…")

  (create-servlet "Create Servlet…")

  ; the ~a is a language such as "module" or "algol60"
  (create-servlet-unsupported-language
   "Create Servlet does not work with the ~a language.")

  ;;; buttons
  (execute-button-label "Run")
  (save-button-label "Save")
  (break-button-label "Stop")
  (break-button-kill-label "Kill")

  ;;; search help desk popup menu
  (search-help-desk-for "Search in Help Desk for “~a”")
  (exact-lucky-search-help-desk-for "Exact lucky search in Help Desk for “~a”")

  ;; collapse and expand popup menu items
  (collapse-sexp "Collapse S-expression")
  (expand-sexp "Expand S-expression")

  ;;; fraction dialog
  (enter-fraction "Enter Fraction")
  (whole-part "Whole Part")
  (numerator "Numerator")
  (denominator "Denominator")
  (insert-number/bad-whole-part "The whole part of the number must be an integral number")
  (insert-number/bad-numerator
   "The numerator part of the number must be a non-negative, integral number")
  (insert-number/bad-denominator
   "The denominator part of the number must be a positive, integral number")
  (insert-fraction-menu-item-label "Insert Fraction…")

  ;; number snip popup menu
  (show-decimal-expansion "View decimal expansion")
  (show-mixed-fraction-view "View as mixed fraction")
  (show-improper-fraction-view "View as improper fraction")
  (show-more-decimal-places "Show more decimal places")

  ;;; Teachpack messages
  (select-a-teachpack "Select a Teachpack")
  (clear-teachpack "Clear ~a Teachpack")
  (teachpack-error-label "DrRacket - Teachpack error")
  (teachpack-didnt-load "The teachpack file ~a did not load properly.")
  (add-teachpack-menu-item-label "Add Teachpack…")
  (clear-all-teachpacks-menu-item-label "Clear All Teachpacks")
  (drscheme-teachpack-message-title "DrRacket Teachpack")
  (already-added-teachpack "Already added ~a teachpack")

  ; ~a is filled with the teachpack's name; the message appears in the
  ; teachpack selection dialog when a user installs a new teachpack
  (compiling-teachpack "Compiling ~a teachpack…")
  (teachpack-pre-installed "Preinstalled Teachpacks")
  (teachpack-pre-installed/htdp "Preinstalled HtDP Teachpacks")
  (teachpack-pre-installed/2htdp "Preinstalled HtDP/2e Teachpacks")
  (teachpack-user-installed "User-installed Teachpacks")
  (add-teachpack-to-list... "Add Teachpack to List…")
  ; first and second ~a are teachpack names, third is a symbol identifing an export
  (teachpack-conflict
   "WARNING: the already installed teachpack ~a conflicts with ~a (the export ~a is in both)")
  ;; a button label; the two ~a are filled with teachpack names
  (remove-and-add-teachpack "Remove ~a and add ~a")
  (teachpack-already-installed
   "A teachpack with the name '~a' has already been installed. Overwrite it?")
  ; ~a is filled with a list of language names. Each name is separated
  ; by a newline and is indented two spaces (no commas, no 'and')
  (teachpacks-only-in-languages
   "The Teachpack menu is only available in these languages: ~a\n\nIn"
   " other languages, use 'require' instead.")


  ;;; Language dialog
  (introduction-to-language-dialog
   "Please select a language. Students in most introductory courses should use the default language.")
  (language-dialog-title "Choose Language")
  (case-sensitive-label "Case sensitive")
  (output-style-label "Output Style")
  (constructor-printing-style "Constructor")
  (quasiquote-printing-style "Quasiquote")
  (write-printing-style "write")
  (print-printing-style "print")
  (true-false-empty-style-label "Constant Style")
  (true-false-empty-style-read "#true #false '()")
  (true-false-empty-style-ids "true false empty")
  (sharing-printing-label "Show sharing in values")
  (use-pretty-printer-label "Insert newlines in printed values")
  (input-syntax "Input Syntax")
  (dynamic-properties "Dynamic Properties")
  (output-syntax "Output Syntax")
  (teachpacks "Teachpacks") ;; label in the language dialog for the teaching languages
  (teachpacks-none "<< none >>") ;; shows up under the previous string, when there are no teachpacks
  (no-debugging-or-profiling "No debugging or profiling")
  (debugging "Debugging")
  (debugging-and-profiling "Debugging and profiling")
  (test-coverage "Syntactic test suite coverage")
  (show-details-button-label "Show Details")
  (hide-details-button-label "Hide Details")
  (choose-language-menu-item-label "Choose Language…")
  (revert-to-language-defaults "Revert to Language Defaults")
  (fraction-style "Fraction Style")
  (use-mixed-fractions "Mixed fractions")
  (use-repeating-decimals "Repeating decimals")
  (decimal-notation-for-rationals "Use decimal notation for rationals")
  (enforce-primitives-group-box-label "Initial Bindings")
  (enforce-primitives-check-box-label "Disallow redefinition of initial bindings")
  (automatically-compile "Populate “compiled” directories (for faster loading)")
  (preserve-stacktrace-information "Preserve stacktrace (disable some optimizations)")
  (enforce-module-constants-checkbox-label "Enforce constant definitions (enables some inlining)")
  (expression-level-stacktrace "Expression-level stacktrace")
  (function-level-stacktrace "Function-level stacktrace")
  (submodules-to-run "Submodules to Run")
  (add-submodule "Add Submodule Option…") ;; menu item
  (add-submodule-title "Add Submodule") ;; title of dialog opened by above menu item


  ; used in the bottom left of the drscheme frame
  ; used the popup menu from the just above; greyed out and only
  ; visible when some languages are in the history
  (recent-languages "Recent languages:")
  ; shows up in bottom-left programming language menu popup, when no langs are recorded
  (no-recently-chosen-languages "no recently chosen languages")

  ;; startup wizard screen language selection section
  (please-select-a-language "Please select a language")


  ;;; languages
  (beginning-one-line-summary "define, cond, structs, constants, and primitives")
  (beginning/abbrev-one-line-summary "Beginner, with list style printing in the REPL")
  (intermediate-one-line-summary "Beginner plus lexical scope")
  (intermediate/lambda-one-line-summary "Intermediate plus higher-order functions")
  (advanced-one-line-summary "Intermediate plus lambda and mutation")
  (pretty-big-scheme "Pretty Big")
  (pretty-big-scheme-one-line-summary
   "Adds syntax and functions from the HtDP languages, mzscheme, & mred/mred")
  (r5rs-language-name "R5RS")
  (r5rs-one-line-summary "R5RS, with no frills")
  (expander "Expander")
  (expander-one-line-summary "Expands, rather than evaluates, expressions")
  (legacy-languages "Legacy Languages")
  (teaching-languages "Teaching Languages")
  (experimental-languages "Experimental Languages")
  (initial-language-category "Initial language")
  (no-language-chosen "No language chosen")
  (other-languages "Other Languages")

  (module-language-name "Determine language from source")
  (module-language-one-line-summary "The #lang line specifies the actual language")
   ;; shows up in the details section of the module language
  (module-language-auto-text "Automatic #lang line")
  (module-language-auto-text-most-recent "Most recently used #lang line")
  ; to the right of this string is a text entry field whose content is the #lang line that'll be used.
  (module-language-auto-text-always-same "Always use the same #lang line:")
  ;; the next four string constants show up in the REPL in DrRacket in the "Racket Language",
  ;; which is also the "Determine language from source" language. They are put right after the name
  ;; of the language from the "#lang" line at the beginning of the source file
  (module-language-repl-no-annotations "")
  (module-language-repl-debug-annotations ", with debugging")
  (module-language-repl-debug/profile-annotations ", with debugging and profiling")
  (module-language-repl-test-annotations ", with test coverage")

  (module-language-#lang-error-more-information "More Information")
  (module-language-#lang-flush-cache "Reload")
  (module-language-#lang-flush-cache-menu-item "Reload #lang Extensions")

  ;; for the upper portion of the language dialog
  (the-racket-language "The Racket Language")
  (choose-a-language "Choose a language")

  ;; the next two string constants appear in the
  ;; language dialog with a list
  ;; of example languages appearing between them
  (racket-language-discussion
   "Start your program with #lang to specify the desired dialect. For example:\n\n")
  (racket-language-discussion-end "\n… and many more")

  ;; the next three string constants are put into a message-box dialog
  ;; that appears when the user clicks on the example #lang languages
  ;; in the language dialog. The first one always appears and then either
  ;; the second or the third appears. The second one has the clicked
  ;; on #lang line placed into the ~a, and third one has the
  ;; current #lang line in the first ~a and the clicked on in the second one.
  ;; The two comments are separated by a blank line.
  (racket-dialect-in-buffer-message
   "Racket dialects are generally chosen by editing the buffer directly,"
   " not by selecting these entries in the language dialog.")
  (racket-dialect-add-new-#lang-line
   "That said, shall I add “~a” to the beginning of the definitions window?")
  (racket-dialect-replace-#lang-line
   "That said, I see you have “~a” in your file; shall I replace it with “~a”?")
  (racket-dialect-already-same-#lang-line
   "I see you already have “~a” in your file, however;"
   " so you should be all set to start programming!")

  ;; in the dialog containing the above strings, one of these is a button that appears
  (add-#lang-line "Add #lang line")
  (replace-#lang-line "Replace #lang line")

  ;; for the 'new drracket user' dialog
  (use-language-in-source "Use the language declared in the source")

  ;;; from the `not a language language' used initially in drscheme.
  (must-choose-language "DrRacket cannot process programs until you choose a programming language.")

  ; next two appear before and after the name of a text book (which will be in italics)
  (using-a-textbook-before "Using ")
  (using-a-textbook-after "?")

  ; next two are before and after a language
  (start-with-before "Start with ")
  (start-with-after "")

  (seasoned-plt-schemer? "Seasoned PLT Schemer?")
  (racketeer? "Are you a Racketeer?")
  (looking-for-standard-scheme? "Looking for standard Scheme?")

  ; the three string constants are concatenated together and the middle
  ; one is hyperlinked to the dialog that suggests various languages
  (get-guidance-before "Either select the “Choose Language…” item in the “Language” menu, or ")
  (get-guidance-during "get guidance")
  (get-guidance-after ".")

  ;;; debug language
  (unknown-debug-frame "[unknown]")
  (backtrace-window-title "Backtrace - DrRacket")
  (files-interactions "~a's interactions") ;; filled with a filename
  (current-interactions "interactions")
  (current-definitions "definitions")
  (mzscheme-w/debug "Textual (MzScheme, includes R5RS)")
  (mzscheme-one-line-summary "PLT's implementation Scheme")
  (mred-w/debug "Graphical (MrEd, includes MzScheme)")
  (mred-one-line-summary "Adds GUI support to MzScheme")

  ;; profiling
  (profiling-low-color "Low")
  (profiling-high-color "High")
  (profiling-choose-low-color "Please select a low color")
  (profiling-choose-high-color "Please select a high color")
  (profiling "Profiling")
  (profiling-example-text "(define (whee) (whee))")
  (profiling-color-config "Profiling Color Range")
  (profiling-scale "Profiling Color Scale")
  (profiling-sqrt "Square root")
  (profiling-linear "Linear")
  (profiling-square "Square")
  (profiling-number "Number of Calls")
  (profiling-time "Cumulative Time")
  (profiling-update "Update Profile")
  (profiling-col-percent-time "% Time")
  (profiling-col-function "Function")
  (profiling-col-time-in-msec "Msec")
  (profiling-col-calls "Calls")
  (profiling-show-profile "Show Profile")
  (profiling-hide-profile "Hide Profile")
  (profiling-unknown-src "<< unknown >>")
  (profiling-no-information-available
   "There is no profiling information available. Please be sure that"
   " profiling is enabled in your language and you have run your program.")
  (profiling-clear?
   "Changing the definitions window invalidates the profiling information. Continue?")

  ;; test coverage
  (test-coverage-clear?
   "Changing the definitions window invalidates the test coverage information. Continue?")
  (test-coverage-clear-and-do-not-ask-again "Yes, and don't ask again")
  (test-coverage-ask? "Ask about clearing test coverage")
  (test-coverage-entirely-covered "All expressions are covered")
  (test-coverage-next-time-check-box "Show next time?")
  (test-coverage-summary "Show test coverage results summary")

  (test-coverage-on "Tests covered")
  (test-coverage-off "Tests didn't cover")

  ;; tracing
  (tracing-enable-tracing "Enable tracing")
  (tracing-show-tracing-window "Show Tracing")
  (tracing-hide-tracing-window "Hide Tracing")
  (tracing-tracing-nothing-to-show
   "No tracing results are available, yet. (Make sure that your language"
   " supports tracing and that tracing is enabled.)")

  ;;; repl stuff
  (evaluation-terminated "Evaluation Terminated")
  (evaluation-terminated-explanation
   "The evaluation thread is no longer running, so"
   " no evaluation can take place until the next execution.")

  ; The next three constants show up in the same dialog as the above evaluation-terminated string
  ; constants.
  ; The first two show up only when the user calls 'exit' (possibly with a status code).
  ; The third shows up when the program runs out of memory.
  (exited-successfully "Exited successfully.")
  ;; ~a is filled in with a number between 1 and 255
  (exited-with-error-code "Exited with error code ~a.")
  (program-ran-out-of-memory "The program ran out of memory.")

  (show-evaluation-terminated-dialog "Show the ‘evaluation terminated’ dialog")
  (evaluation-terminated-ask "Show this dialog next time")

  (last-stack-frame "show the last stack frame")
  (last-stack-frames "show the last ~a stack frames")
  (next-stack-frames "show the next ~a stack frames")
  (more-stack-frames "show more stack frames")

  ;;; welcoming message in repl
  (language "Language")
  (custom "custom")
  (teachpack "Teachpack")
  (welcome-to "Welcome to")
  (version "version")
  ;; The following is shown on 2nd line of welcome message in repl.
  ;; It is concatenated at end of: "language": LANGUAGE "; memory limit:" LIMIT
  ;; therefore you get to decide punctuation for your language here
  (memory-limit "; memory limit:")

  ;;; kill evaluation dialog
  (kill-evaluation? "Do you want to kill the evaluation?")
  (just-break "Just Break")
  (kill "Kill")
  (kill? "Kill?")

  ;;; version checker
  (version:update-menu-item   "Check for Updates…")
  (version:update-check       "Update check") ; dialog title, with the next line
  (version:connecting-server  "Connecting to Racket version server")
  (version:results-title      "Racket Version Check")
  (version:do-periodic-checks "Periodically check for newer Racket versions")
  (version:take-me-there      "Take Me There") ; ...to the download website
  ;; the next one can appear alone, or followed by a comma and the one after that
  (version:plt-up-to-date     "Your Racket version is up-to-date")
  (version:but-newer-alpha    "but note that there is a newer alpha-release")
  ;; This is used in this context: "Racket vNNN <<<*>>> http://download..."
  (version:now-available-at   "is now available at")

  ;; insert menu
  (insert-menu "&Insert")

  ;; large semi colon letters
  (insert-large-letters... "Insert Large Letters…")
  (large-semicolon-letters "Large Semicolon Letters")
  (text-to-insert "Text to insert")

  (module-browser-filename-format "Full Filename: ~a (~a lines)")
  (module-browser-root-filename "Root Filename: ~a")
  (module-browser-font-size-gauge-label "Font Size")
  (module-browser-progress-label "Module Browser Progress")
  (module-browser-adding-file "Adding file: ~a…")
  (module-browser-laying-out-graph-label "Laying out graph")
  (module-browser-open-file-format "Open ~a")
  (module-browser "Module Browser") ;; frame title
  (module-browser... "&Module Browser…") ;; menu item title
  (module-browser-in-file "M&odule Browser on ~a") ;; menu item title; ~a is filled with a filename
  ;; menu item title for above menu item; used when there is no saved file
  (module-browser-no-file "Module Browser on This Saved File")
  (module-browser-error-expanding "Error expanding the program:\n\n~a")
  (module-browser-show-lib-paths "Show files loaded by (lib ..) paths")
  (module-browser-progress "Module Browser: ~a") ;; prefix in the status line
  (module-browser-compiling-defns "Module Browser: compiling definitions")
  ;; check box label in show module browser pane in drscheme window.
  (module-browser-show-lib-paths/short "Follow lib requires")
  ;; check box label in show module browser pane in drscheme window.
  (module-browser-show-planet-paths/short "Follow PLaneT requires")
  (module-browser-refresh "Refresh") ;; button label in show module browser pane in drscheme window.
  ;; used to search in the graph; the label on a text-field% object
  (module-browser-highlight "Highlight")
  (module-browser-only-in-plt-and-module-langs
   "The module browser is only available for module-based programs.")
  (module-browser-name-length "Name length")
  (module-browser-name-short "Short")
  (module-browser-name-medium "Medium")
  (module-browser-name-long "Long")
    ;; like 'Long' but shows the phases where this file is loaded
  (module-browser-name-very-long "Long, with phases")
  (module-browser-open-all "Open all files shown here")
  (module-browser-main-collects "Main Collects")
  (module-browser-unknown-pkg "Unknown Package")
  (module-browser-visible-pkgs "Visible Packages")

  (happy-birthday-matthias "Happy Birthday, Matthias!")
  (happy-birthday-matthew "Happy Birthday, Matthew!")
  (happy-birthday-shriram "Happy Birthday, Shriram!")

  (xml-tool-insert-xml-box "Insert XML Box")
  (xml-tool-insert-scheme-box "Insert Racket Box")
  (xml-tool-insert-scheme-splice-box "Insert Racket Splice Box")
  (xml-tool-xml-box "XML Box")
  (xml-tool-scheme-box "Racket Box")
  (xml-tool-scheme-splice-box "Racket Splice Box")
  (xml-tool-switch-to-scheme "Switch to Racket box")
  (xml-tool-switch-to-scheme-splice "Switch to Racket splice box")
  (xml-tool-eliminate-whitespace-in-empty-tags
   "Eliminate whitespace in empty tags")
  (xml-tool-leave-whitespace-alone
   "Leave whitespace alone")

  (show-recent-items-window-menu-item "Show Recently Opened Files in Separate Window")
  (show-recent-items-window-label "Recently Opened Files")
  (number-of-open-recent-items "Number of recent items")
  (switch-anyway "Switch File Anyway")

  (stepper-program-has-changed "WARNING: The program has changed.")
  (stepper-program-window-closed "WARNING: The program window is gone.")

  (stepper-name "Stepper")
  (stepper-language-level-message "The stepper does not work for language “~a”.")
  (stepper-button-label "Step")

  (stepper-previous "Step")
  (stepper-next "Step")
  (stepper-jump "Jump…")
  (stepper-jump-to-beginning "to beginning")
  (stepper-jump-to-end "to end")
  (stepper-jump-to-selected "to beginning of selected")
  (stepper-jump-to-previous-application "to previous application step")
  (stepper-jump-to-next-application "to next application step")
  (stepper-out-of-steps
   "Reached the end of evaluation before finding the kind of step you were looking for.")
  (stepper-no-such-step/title "Step Not Found")
  (stepper-no-such-step "Couldn't find a step matching that criterion.")
  (stepper-no-such-step/earlier "Couldn't find an earlier step matching that criterion.")

  (stepper-no-earlier-application-step "No earlier application steps.")
  (stepper-no-later-application-step "No more application steps.")
  (stepper-complete "All of the definitions have been successfully evaluated.")

  (stepper-no-earlier-step "No earlier steps.")
  (stepper-no-later-step "No more steps.")

  (stepper-no-selected-step "No steps taken in the highlighted region. Perhaps it's commented out?")

  (stepper-no-last-step "No final step available yet.")

  (debug-tool-button-name "Debug")

  (dialog-back "Back")

  ;; warnings about closing a drscheme frame when the program
  ;; might still be doing something interesting
  (program-is-still-running "The program in the definitions window is still running. Close anyway?")
  (program-has-open-windows
   "The program in the definitions window has open windows. Close this window anyway?")

  ;; ml-command-line-arguments is for the command line arguments
  ;; label in the module language details in the language dialog.
  (ml-command-line-arguments "Command-line arguments as a vector of strings, in read syntax")

  ;; ml-cp names are all for the module language collection path
  ;; configuration. See the details portion of the language dialog
  ;; for the module language (at the bottom).
  (ml-cp-default-collection-path "<<default collection paths>>")

  ;; in std get-directory
  (ml-cp-choose-a-collection-path "Please choose a collection path")

  ;; err msg when adding default twice
  (ml-cp-default-already-present
   "Default collection paths are already present")

  ;; title of this section of the dialog (possibly the word
  ;; `Collection' should not be translated)
  (ml-cp-collection-paths "Collection Paths")

  ;; button labels
  ;;  The package manager uses these, too
  (ml-cp-add "Add")
  (ml-cp-add-default "Add Default")
  (ml-cp-remove "Remove")
  (ml-cp-raise "Raise")
  (ml-cp-lower "Lower")

  (ml-always-show-#lang-line "Always show #lang line in the Module language")

  ;; Profj
  (profj-java "Java")
  (profj-java-mode "Java mode")
  (profj-java-coverage "Java Coverage") ;; shows up in the preferences dialog under 'Color'

  (profj-beginner-lang "Beginner")
  (profj-beginner-lang-one-line-summary "Java-like Beginner teaching language")
  (profj-full-lang "Full")
  (profj-full-lang-one-line-summary "Like Java 1.0 (some 1.1)")
  (profj-advanced-lang "Advanced")
  (profj-advanced-lang-one-line-summary "Java-like Advanced teaching language")
  (profj-intermediate-lang "Intermediate")
  (profj-intermediate-lang-one-line-summary "Java-like Intermediate teaching language")
  (profj-intermediate-access-lang "Intermediate + access")
  (profj-intermediate-access-lang-one-line-summary
   "Java-like Intermediate teaching language, with access modifiers")
  (profj-dynamic-lang "Java+dynamic")
  (profj-dynamic-lang-one-summary "Java with dynamic typing capabilities")

  (profj-java-mode-color-heading "Edit Colors") ; Heading for preference to choose editing colors
  (profj-java-mode-color-keyword "keyword")
  (profj-java-mode-color-string "string")
  (profj-java-mode-color-literal "literal")
  (profj-java-mode-color-comment "comment")
  (profj-java-mode-color-error "error")
  (profj-java-mode-color-identifier "identifier")
  (profj-java-mode-color-prim-type "primitive type") ; Example text for built-in Java types
  (profj-java-mode-color-default "default")

  (profj-coverage-color-heading "Coverage Colors") ; Heading for preference to choose coverage colors
  (profj-coverage-color-covered "covered expression")

  ; Heading for preferences controlling printing
  (profj-language-config-display-preferences "Display Preferences")
  (profj-language-config-display-style "Display style")
  (profj-language-config-display-field "Class + Fields")
  (profj-language-config-class "Class")
  (profj-language-config-display-array "Print entire contents of arrays?")
  ; Heading for preferences controlling test behavior
  (profj-language-config-testing-preferences "Testing Preferences")
  ; Run should be the word found on the Run button
  ;(profj-language-config-testing-enable "Display testing results on Run?")
  (profj-language-config-testing-coverage "Collect coverage information for tests?")
  (profj-language-config-support-test-language "Support test Language extension?")
  (profj-language-config-testing-check "Allow check expression?") ; check should not be translated
  (profj-language-config-classpath "Classpath")
  (profj-language-config-choose-classpath-directory "Choose the directory to add to class path")
  ; Button label to print the current classpath
  (profj-language-config-classpath-display "Show current")

  (profj-test-name-close-to-example "Class ~a's name contains a phrase close to Example.")
  (profj-test-name-example-miscapitalized "Class ~a's name contains a miscapitalized example.")

  ;; Close testing window and do not run test cases any more
  ;(profj-test-results-close-and-disable "Close and Disable Testing")
  ;; Hide docked testing window and do not run test cases any more
  ;(profj-test-results-hide-and-disable "Hide and Disable Testing")
  ;Renamed below
  ;(profj-test-results-window-title "Test Results")

  (profj-unsupported "Unsupported")
  (profj-executables-unsupported "Sorry - executables are not supported for Java at this time")

  (profj-convert-to-text-comment "Convert to text comment")
  (profj-convert-to-comment "Convert to comment")

  (profj-executing-main "executing main")

  (profj-insert-java-comment-box "Insert Java Comment Box")
  (profj-insert-java-interactions-box "Insert Java Interactions Box")

  ;;The Test engine tool
  ;;
  (test-engine-window-title "Test Results")
  ;;Following two appear in View menu, attach and free test report window from DrRacket frame
  (test-engine-dock-report "Dock Test Report")
  (test-engine-undock-report "Undock Test Report")
  ;;Following two appear in Racket (Java, etc) menu, cause Tests to be Run automatically or not
  (test-engine-enable-tests "Enable Tests")
  (test-engine-disable-tests "Disable Tests")
  (test-engine-enable-disable-tests-only-in-teaching-languages
   "The Enable/Disable Tests menu item is used only to disable and enable the HtDP"
   " and DMdA teaching languages support for testing. See the “Show Details” section"
   " of the language dialog for controlling the submodules that are run in The Racket Language.")

  (test-engine-ran-1-test "Ran 1 test.")
  (test-engine-ran-1-check "Ran 1 check.")
  ;; ditto, only plural
  (test-engine-ran-n-tests "Ran ~a tests.")
  (test-engine-ran-n-checks "Ran ~a checks.")
  (test-engine-1-test-passed "The test passed!")
  (test-engine-1-check-passed "The check passed!")
  (test-engine-both-tests-passed "Both tests passed!")
  (test-engine-both-checks-passed "Both checks passed!")
  (test-engine-all-tests-passed "All tests passed!")
  (test-engine-all-checks-passed "All checks passed!")
  (test-engine-all-n-tests-passed "All ~a tests passed!")
  (test-engine-all-n-checks-passed "All ~a checks passed!")
  (test-engine-0-tests-passed "0 tests passed.")
  (test-engine-0-checks-passed "0 checks passed.")
  (test-engine-m-of-n-tests-failed "~a of the ~a tests failed.")
  (test-engine-m-of-n-checks-failed "~a of the ~a checks failed.")
  (test-engine-must-be-tested "This program must be tested!")
  (test-engine-is-unchecked "This program is unchecked!")
  (test-engine-tests-disabled "Tests disabled.")
  (test-engine-should-be-tested "This program should be tested.")
  (test-engine-at-line-column "at line ~a, column ~a")
  (test-engine-in-at-line-column "in ~a, line ~a, column ~a")
  ; as in "column (unknown)"
  (test-engine-unknown "(unknown)")
  (test-engine-trace-error "Trace error")

  ; The ~F is special marker for the offending values, which may be
  ; printed specially in DrRacket.
  (test-engine-check-encountered-error
   "check-expect encountered the following error instead of the expected value, ~F. ~n   :: ~a")
  (test-engine-check-error-cause
   "caused by expression")
  (test-engine-actual-value-differs-error
   "Actual value ~F differs from ~F, the expected value.")
  ;; need to translate only one of these next two
  ;; (test-engine-actual-value-not-within-error or
  ;;  test-engine-actual-value-not-within-error/alt-word-order)
  ;; if both are present, test-engine-actual-value-not-within-error is used
  (test-engine-actual-value-not-within-error
   "Actual value ~F is not within ~v of expected value ~F.")
  (test-engine-actual-value-not-within-error/alt-order
   "Actual value ~F is not near enough to expected value ~F; expected it to be within ~v.")
  (test-engine-encountered-error-error
   "check-error encountered the following error instead of the expected ~a~n   :: ~a")
  (test-engine-expected-error-error
   "check-error expected the following error, but instead received the value ~F.~n ~a")
  (test-engine-expected-an-error-error
   "check-error expected an error, but instead received the value ~F.")
  ;; members are appended to the message
  (test-engine-not-mem-error "Actual value ~F differs from all given members in ")
  (test-engine-not-range-error "Actual value ~F is not between ~F and ~F, inclusive.")

  ;; followed by list of variable bindings
  (test-engine-property-fail-error "Property falsifiable with")
  (test-engine-property-error-error "check-property encountered the following error~n:: ~a")

  (signature-enable-checks "Enable Signature Checks")
  (signature-disable-checks "Disable Signature Checks")

  ; section header
  (test-engine-check-failures "Check failures:")
  ; section header
  (test-engine-signature-violations "Signature violations:")

  ; part of one phrase "signature <at line ...> to blame: function <...>
  (test-engine-signature "signature")
  (test-engine-to-blame "to blame: function")

  (test-engine-no-signature-violations "No signature violations.")
  (test-engine-1-signature-violation "1 signature violation.")
  (test-engine-n-signature-violations "~a signature violations.")

  ; as in got <value>, signature <at ...>
  (test-engine-got "got")

  (profjWizward-insert-java-class "Insert Java Class")
  (profjWizard-insert-java-union "Insert Java Union")

  ;; The Test Suite Tool
  ;; Errors
  (test-case-empty-error "Empty test case")
  (test-case-too-many-expressions-error "Too many expressions in a test case.")
  ;; DrRacket window menu items
  (test-case-insert "Insert Test Case")
  (test-case-disable-all "Disable all Test Cases")
  (test-case-enable-all "Enable all Test Cases")

  ;; NOTE: The following string constants are labels of the test-case fields. The width
  ;;       of the field is determined by the length of the longest of the following three words.
  ;;       if the words are too long the test case will take up too much horizontal room and
  ;;       not look very good.
  ;; This string is the label of the expression that is being tested in a test case.
  (test-case-to-test "Test")
  ;; This string is the label of the expression that is the expected value of the to-test expression.
  (test-case-expected "Should be")
  ;; This string is the label of the actual result of the to test expression.
  (test-case-actual "Actual")
  (test-case-predicate "Predicate")
  (test-case-should-raise "Should Raise")
  ;; The label of a field of the test-case that describes the expected error message of a test case
  (test-case-error-message "Error Message")

  (test-case-menu-title "Test Case")
  (test-case-switch-to-error-box "Switch to Error Test Box")
  (test-case-switch-to-nonerror-box "Switch to Nonerror Test box")
  (test-case-collapse "Collapse Test Case")
  (test-case-show-actual "Show Actual Value")
  (test-case-enable "Enable Test Case")
  (test-case-show-predicate "Show Predicate")
  (test-case-show-error-message "Show Error Message")
  (test-case-convert-to-text "Convert to text")

  ;; Profj Boxes
  (profjBoxes-empty-error "Empty interaction")
  (profjBoxes-too-many-expressions-error "Too many expressions in a box")
  (profjBoxes-interactions-label "Interactions")
  (profjBoxes-bad-java-id-error "Malformed Java ID")
  (profjBoxes-examples-label "Examples")
  (profjBoxes-add-new-example-button "Add New Example")
  (profjBoxes-type "Type")
  ;; The Java identifier of an example of data
  (profjBoxes-name "Name")
  (profjBoxes-value "Value")
  (profjBoxes-insert-java-examples "Insert Java Examples")
  (profjBoxes-insert-java-interactions "Insert Java Interactions")

  ;; Slideshow
  (slideshow-hide-picts "Show Nested Boxes")
  (slideshow-show-picts "Show Picts")
  (slideshow-cannot-show-picts "Cannot show picts; run program to cache sizes first")
  (slideshow-insert-pict-box "Insert Pict Box")

  ;; GUI Tool
  (gui-tool-heading "GUI Tool")
  (gui-tool-before-clicking-message
   "Before clicking a tool icon, use “Insert GUI” from the “Special” menu"
   " to insert a root GUI item, or select an already inserted GUI.")
  (gui-tool-show-gui-toolbar "Show GUI Toolbar")
  (gui-tool-hide-gui-toolbar "Hide GUI Toolbar")
  (gui-tool-insert-gui "Insert GUI")

  ;; contract violation tracking

  ; tooltip for new planet icon in drscheme window (must have a planet violation logged to see it)
  (show-planet-contract-violations "Show PLaneT contract violations")

  ; buttons in the dialog that lists the recorded bug reports
  (bug-track-report "File Ticket")
  (bug-track-forget "Forget")
  (bug-track-forget-all "Forget All")

  ;; planet status messages in the bottom of the drscheme window;
  ;; the ~a is filled with the name of the package
  (planet-downloading "PLaneT: Downloading ~a…")
  (planet-installing "PLaneT: Installing ~a…")
  (planet-finished "PLaneT: Finished with ~a.")
  (planet-docs-building "PLaneT: Building docs (triggered by ~a)…")
  ;; this can happen when there is status shown in a different and then
  ;; the user switches to a tab where planet hasn't been used
  (planet-no-status "PLaneT")

  (bug-report-field-pkg "Package system info")

  ;; string normalization. To see this, paste some text with a ligature into DrRacket
  ;; the first three strings are in the dialog that appears. The last one is in the preferences dialog
  (normalize "Normalize")
  (leave-alone "Leave alone")
  (normalize-string-info
   "The string you pasted contains ligatures or other non-normalized characters. Normalize them?")
  (normalize-string-preference "Normalize pasted strings")
  (ask-about-normalizing-strings "Ask about normalizing strings")

  (always-use-platform-specific-linefeed-convention
   "Always use the platform-specific linefeed convention")
  (disable-caret-blinking "Disable caret blinking")

  ;; optimization coach
  (hide-optimization-coach "Hide Optimization Coach")
  (show-optimization-coach "Show Optimization Coach")

  ;; labels used (in a big font) in the background of the definitions and interactions windows
  (definitions-window-label "definitions")
  (interactions-window-label "interactions")
  (hide-defs/ints-label "Hide Definitions/Interactions Labels") ;; popup menu
  (show-defs/ints-label "Show definitions/interactions labels") ;; preferences checkbox

  ;; menu item in the 'edit' menu; applies to editors with programs in them
  ;; (technically, editors that implement color:text<%>)
  (spell-check-string-constants "Spell Check String Constants")
  (spell-check-scribble-text "Spell Check Text (between {} in Scribble)")
  ; (sub)menu whose items are the different possible dictionaries
  (spelling-dictionaries "Spelling Dictionaries")
  (default-spelling-dictionary "Default Dictionary") ; first item in menu from previous line
  (misspelled-text-color "Misspelled Text Color") ;; in the preferences dialog
  (cannot-find-ispell-or-aspell-path "Cannot find the aspell or ispell binary")
  ; puts the path to the spell program in the ~a and then the error message
  ; is put following this string (with a blank line in between)
  (spell-program-wrote-to-stderr-on-startup "The spell program (~a) printed an error message:")
  (spell-program-did-not-respond-after-some-seconds
   "The spell program (~a) did not respond after ~a seconds")
  (spell-skip-to-next-misspelled-word "Skip to Next Misspelled Word") ;; menu item
  (spell-suggest-corrections "Suggest Spelling Corrections…") ;; menu item
  (spell-correction-suggestions "Spelling Correction Suggestions") ;; dialog title
  (spell-choose-replacement-word "Select a replacement word") ;; label in dialog

  ;; GUI for installing a pkg package; available via File|Install Package...
  (install-pkg-install-by-source "Do What I Mean")         ; tab label
  (install-pkg-install-from-list "Available from Catalog") ; tab label
  (install-pkg-install-installed "Currently Installed")    ; tab label
  (install-pkg-migrate-from "Copy from Version")           ; tab label
  (install-pkg-settings "Settings")                        ; tab label
  (install-pkg-menu-item... "Install Package…")
  (install-pkg-dialog-title "Install Package")
  (install-pkg-source-label "Package Source")
  (install-pkg-package-name "Package Name")
  (install-pkg-package-source-desc
   "A package source is a package name, file, directory, URL, or GitHub reference")
  (install-pkg-infer "Infer")
  (install-pkg-use "Use") ; as opposed to "Infer", label for text box
  (install-pkg-type-label "Package Source Type")
  (install-pkg-file "File")
  (install-pkg-link "Link")
  (install-pkg-static-link "Static link")
  (install-pkg-dir "Directory")
  (install-pkg-dir-url "Remote Directory")
  (install-pkg-file-url "Remote File")
  (install-pkg-git "Git Repository")
  (install-pkg-github "GitHub")
  (install-pkg-name "Name (consulting resolver)")
  (install-pkg-inferred-as "Type inferred to be ~a") ; ~a gets install-pkg-{file,dir,...}
  (install-pkg-link-dirs "Local directory as link")
  (install-pkg-file-or-dir? "Choose a file or a directory?")
  (install-pkg-force? "Ignore conflicts")
  (install-pkg-replace? "Updates can replace existing installations")
  (install-pkg-dry-run? "Dry run (no installation changes)")
  (install-pkg-command-line "Equivalent command line invocation:")
  (install-pkg-error-installing-title "Error Installing Package")
  (install-pkg-action-label "Action to Take")
  (install-pkg-install "Install")
  (install-pkg-update "Update")
  (install-pkg-setup "Setup") ; for button
  (install-pkg-setup-long "Setup Current Installation") ; for menu
  (install-pkg-remove "Remove")
  (install-pkg-do-not-remove "Don't Remove")
  (install-pkg-action-inferred-to-be-update "Action inferred to be Update")
  (install-pkg-action-inferred-to-be-install "Action inferred to be Install")
  (install-pkg-default "Default")
  (install-pkg-scope-label "Package Scope")
  (install-pkg-default-scope-label "Default Package Scope") ; for picking the scope to be default
  (install-pkg-default-scope-changed "Default scope successfully changed to ~a") ; confirming message after change
  (install-pkg-installation "Specific Racket Installation")
  (install-pkg-user "Specific User and Racket Version")
  (install-pkg-set-as-default "Set as Default")
  (install-pkg-scope-is "Package scope is ~a") ; ~a gets install-pkg-{installation,user,shared}
  (install-pkg-select-package-directory "Select Package Directory")
  (install-pkg-select-package-file "Select Package File")
  (install-pkg-update-package-list "Update Package List")
  (install-pkg-stop-update "Stop Update")
  (install-pkg-filter "Filter")
  (install-pkg-match "~a/~a match")
  (install-pkg-package "Package")
  (install-pkg-author "Author")
  (install-pkg-description "Description")
  (install-pkg-tags "Tags")
  (install-pkg-checksum "Checksum")
  (install-pkg-source "Source")
  (install-pkg-catalog "Catalog")
  (install-pkg-scope "Scope")
  (install-pkg-name "Name")
  (install-pkg-update-catalogs? "Update database to match the configured set of catalogs?")
  (install-pkg-currently-configured-are "The currently configured catalogs are")
  (install-pkg-database-recorded-are "The database-recorded catalogs are")
  (install-pkg-update-catalogs "Update")
  (install-pkg-do-not-update-catalogs "Don't Update")
  (install-pkg-really-remove? "Are you sure you want to remove the following selected packages?")
  (install-pkg-promote "Promote from Auto-Installed")
  (install-pkg-demote "Demote to Auto-Installed")
  (install-pkg-abort-install "Abort Install")
  (install-pkg-abort-update "Abort Update")
  (install-pkg-abort-remove "Abort Remove")
  (install-pkg-abort-demote "Abort Demote")
  (install-pkg-abort-promote "Abort Promote")
  (install-pkg-abort-migrate "Abort Migrate")
  (install-pkg-abort-setup "Abort Setup")
  (install-pkg-abort-generic-action "Abort Action")
  (install-pkg-close-terminal-output "Close Output")
  (install-pkg-show-all-options "Show All Options")
  (install-pkg-migrate-available-installations "Available Installations")
  ;; all ~a will be substituted with the different single characters
  ;; conveying the state, by default these are ✓*!=@
  (install-pkg-legend "~a: installed ~a: auto-installed ~a: not default scope ~a: installed as link; ~a: installed from URL")
  (pkg-manager-menu-item "Package Manager…")
  (install-pkg-title "Package Manager")
  ;; where ~a gets an installation name:
  (install-pkg-packages-for "Packages for ~a")
  (install-pkg-really-remove-installation
   "Are you sure you want to remove all installed packages and information for ~a?")
  (install-pkg-installer "Package Installer")
  (install-pkg-copy "Copy Message")
  (install-pkg-installation "installation")
  (install-pkg-user "user")
  (install-pkg-any "Any") ;; any file type
  (install-pkg-bad "bad") ;; bad (not supported) file type
  (install-pkg-catalogs "Package Catalogs")
  (install-pkg-updating "Updating package list…")
  (install-pkg-updating-from "Updating from ~a…")
  (install-pkg-details-from "Getting details for ~a from ~a…")

  (install-pkg-abort-set-scope "Abort Scope Change")

  (install-pkg-dependencies-fail "Fail: cancels installation/update if dependencies are unmet")
  (install-pkg-dependencies-force
   "Force: install despite missing or version-mismatched dependencies")
  (install-pkg-dependencies-search-ask
   "Ask: prompt about each missing dependency (not supported in GUI)")
  (install-pkg-dependencies-search-auto
   "Auto: install missing or version-mismatched dependencies automatically")
  (install-pkg-dependencies-search-auto+update
   "Auto + Update: update dependencies whenever possible")

  (install-pkg-dependencies-mode "Dependencies Mode")

  (install-pkg-dependencies-search-ask-not-supported-in-gui
   "The “ask“ mode for dependencies is not supported in the GUI installer.")
  ;; "~a" is pre-":" part of `install-pkg-dependencies-fail'
  ;; or `install-pkg-dependencies-search-auto':
  (install-pkg-deps-is "Default dependency mode is ~a")

  (install-pkg-package-catalogs "Package Catalogs") ; label for a list box
  (install-pkg-add-package-catalog "Add Package Catalog")

  (install-pkg-not-rentrant "Installation and updating cannot happen simultaneously;"
                            " either abort the current one or wait for it to finish.")

  ;; open a file via a collection path (new "Open" menu item in DrRacket)
  (open-require-path "Open Require Path…")
  (enter-subcollection "Enter subcollection") ; button in new dialog
  (path-to-racket-binary "Path to binary")
  (use-a-different-racket "Use a different racket")

  ;; adding racket/bin to the path; only under mac os x
  ; first ~a is filled with either the empty string or an error message from elsewhere
  ;  (bracketed by some newlines to separate it out)
  ; second ~a is filled with /etc/paths.d/racket (or some other path like it in the future)
  ; third ~a is filled with the path to the bin directory of the current drracket
  (adding-racket/bin-to-path-failed
   "Attempt to add racket support to the command line failed.~aSpecifically,"
   " could not create “~a” with the contents “~a”.")
  ; first and third ~a are filled with /etc/paths.d/racket (or some other path like it in the future)
  ; and the second one is filled with the path to the bin directory that was put into that file.
  (added-racket/bin-to-path
   "You should now be able to use racket and its tools at the"
   " command-line.\n\nThe"
   " default PATH has been configured for all users by adding the file"
   " ~a to point to ~a. You can undo this"
   " configuration by deleting ~a.")
  (adding-racket/bin-no-paths.d
   "Failed to add racket to the command line because /etc/paths.d does not"
   " exist.\n\nIt may work to run this command in the terminal window to"
   " create the directory:\n"
   "    sudo mkdir /etc/paths.d\nand then try again.")
  (added-racket/bin-to-path/windows
   "You should now be able to use racket and its tools at the"
   " command-line.\n\nThe"
   " default %PATH% has been configured via the registry entry"
   " HKEY_CURRENT_USER\\Environment\\Path"
   " to point to ~a and ~a.")
  (didnt-add-racket/bin-to-path/unix
   "DrRacket cannot update your path under unix, but if you"
   " know how to adjust your PATH yourself,"
   " add\n\n  ~a\n\n"
   " to it.")
  (add-racket/bin-to-path "Configure Command Line for Racket…") ;; menu item label
  )
