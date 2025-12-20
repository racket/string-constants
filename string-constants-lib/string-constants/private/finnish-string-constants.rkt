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

(module finnish-string-constants "string-constant-lang.rkt"
  ;;; when translating this constant, substitute name of actual language for `English'
  (is-this-your-native-language "Is Finnish Your Native Language?")

  (#:define drr "DrRacket")

  (are-you-sure-you-want-to-switch-languages
   "Tämä tulee vaihtamaan käyttöliittymän kielen, mikä vaatii DrRacketin uudelleenkäynnistämisen. Oletko varma?")

  (interact-with-drscheme-in-language "Käytä DrRacket-sovellusta suomen kielellä")

  ;; these two should probably be the same in all languages except English.
  ;; they are the button labels (under macos and windows, respectively)
  ;; that go the with the string above.
  (accept-and-quit "Hyväksy ja lopeta")
  (accept-and-exit "Hyväksy ja lopeta")

  ;;; general purpose (DrRacket is hereby a word in every language, by decree of Robby :)
  (plt "PLT")
  (drscheme drr)
  (drracket drr)
  (ok "OK")
  (cancel "Peruuta")
  (abort "Keskeytä")
  (untitled "Nimetön")
  (untitled-n "Nimetön ~a")
  (warning "Varoitus")
  (error "Virhe")
  (close "Sulje") ;; as in, close an open window or tab. must match close-menu-item
  ;; in the sense that, when the &s have been stripped from
  ;; close-menu-item, it must be the same string as this.
  (close-window "Sulje Ikkuna")
  (stop "Pysäytä")
  (&stop "&Pysäytä") ;; for use in button and menu item labels, with short cut.
  (are-you-sure-delete? "Haluatko varmasti poistaa tiedoston ~a?") ;; ~a is a filename or directory name
  (are-you-sure-replace? "Haluatko varmasti korvata tiedoston ~a?") ;; ~a is a filename or directory name
  (ignore "Sivuuta")
  (revert "Palauta")

  ;; label for a generic check box, often supported on dialogs
  ;; that ask a binary choice of the user. If checked, the
  ;; dialog isn't going to be shown again.
  ;; One version for always using the current choice:
  (dont-ask-again-always-current "Älä kysy uudestaan (käytä aina nykyistä valintaa)")
  ;; One generic version (ie, on the Quit DrRacket dialog)
  (dont-ask-again                "Älä kysy uudestaan")

  ;;; important urls
  (web-materials "Aiheeseen liittyvät sivustot") ;; menu item title
  (tool-web-sites "Työkalujen verkkosivuja")   ;; menu item title
  (plt-homepage "Racket")
  (pbd-homepage "Program by Design")

  ;; having an issue (replaces the bug report form, whose string constants are below)
  (have-an-issue? "Onko jokin ongelma?…")
  (use-github-or-the-mailing-list-for-issues
   "Jos olet löytänyt bugin Racketistä tai DrRacketista, ilmoita siitä"
   " GitHubissa.\n\nJos olet löytänyt jotain mikä ei kä järkeen, mutta"
   " et ole varma onko se bugi vai ei, kysy asiasta postituslistalla.")
  (visit-mailing-lists "Visit Mailing Lists") ;; button in dialog
  (visit-github "Visit GitHub") ;; button in dialog, goes to 'open issue' page

  ;;; bug report form
  (cancel-bug-report? "Peruuta bugiraportti")
  (are-you-sure-cancel-bug-report?
   "Haluatko varmasti peruuttaa bugiraportin lähettämisen?")
  (do-you-want-to-discard-or-save-this-bug-report
   "Haluatko hylätä vai tallentaa tämän bugiraportin?")
  (discard "Hylkää") ;; a button label for a dialog box with the above question
  (bug-report-form "Bugiraportti-lomake")
  (bug-report-field-name "Nimesi")
  (bug-report-field-email "Sähköposti")
  (bug-report-field-summary "Kooste")
  (bug-report-field-severity "Vakavuus")
  (bug-report-field-class "Luokka")
  (bug-report-field-description "Kuvaus")
  (bug-report-field-reproduce1 "Vaiheet")
  (bug-report-field-reproduce2 "Toistamista varten")
  (bug-report-field-environment "Ympäristö")
  (bug-report-field-docs-installed "Asennetut dokumentaatiot")
  (bug-report-field-collections "Kokoelmat")
  (bug-report-field-links "Linkit")  ;; from 'raco link'
  (bug-report-field-human-language "Ihmisen kieli")
  (bug-report-field-memory-use "Muistinkäyttö")
  (bug-report-field-version "Versio")
  (bug-report-synthesized-information "Syntetisoitu Tieto")  ;; dialog title
  (bug-report-show-synthesized-info "Näytä Syntetisoitu Tieto")
  (bug-report-submit "Lähetä")
    ;; button in bug report dialog, next to cancel and bug-report-submit
  (close-and-save-bug-report "Sulje && Tallenna")
  ;; same as above, but used when there are saved bug reports
  (bug-report-submit-menu-item "Lähetä bugiraportti…")
  ;; in Help Menu, submenu title
  (saved-bug-reports-menu-item "Tallennetut bugiraportit")
  ;; menu item: only shows up when there is more than one saved bug report
  (disacard-all-saved-bug-reports "Hylkää Kaikki Tallennetut Bugiraportit")
  ;; an info message that shows up as a disabled menu item when no saved bug reports are around
  (no-saved-bug-reports "Yhtään bugiraporttia ei ole tallennettu")
  ;; button label the user sees when there are saved bug reports,
  ;; but the user asks to save another one.
  (new-bug-report "Uusi bugiraportti")
  ;; button on the bottom of the bug report form
  (close-and-save "Sulje ja Tallenna")
  (saved-unsubmitted-bug-reports "Tallennetut, lähettämättömät bugiraportit")
  ;; the above string constant is next to previous line in same dialog, followed by
  ;; list of bug report subjects (as buttons)
  (error-sending-bug-report "Virhe Bugiraporttia Lähetettäessä")
  (error-sending-bug-report-expln
   "Tapahtui virhe lähettäessä tätä bugiraporttia."
   " Jos internet-yhteytesi toimii muuten hyvin, vieraile:\n\n"
   "    https://github.com/racket/racket/issues/new\n\nand"
   " lähetä bugiraportti GitHubin kautta. Pahoittelut hankaluudesta.\n\nVirheviesti on:\n~a")
  (illegal-bug-report "Laiton Bugiraportti")
  (pls-fill-in-field "Täytä kenttä “~a”")
  (malformed-email-address "Vääränmuotoinen sähköpostiosoite")
  (pls-fill-in-either-description-or-reproduce
   "Täytä joko Kuvaus-kenttä tai Vaiheet toistamista varten -kenttä.")

  ;;; check syntax
  (check-syntax "Tarkasta Syntaksi")
  (cs-italic "Kursivointi")
  (cs-bold "Lihavointi")
  (cs-underline "Alleviivaus")
  (cs-smoothing-default "Oletus")
  (cs-smoothing-partial "Osittainen tasoitus")
  (cs-smoothing-full "Tasoitettu(Smoothed)") ;; FI&EN
  (cs-smoothing-none "Tasoittamaton(Unsmoothed)") ;; FI&EN
  (cs-change-color "Muuta Väri")
  (cs-foreground-color "Edustan Väri")
  (cs-background-color "Taustan väri")
  (cs-tack/untack-arrow "Kiinnitä/Irroita Nuoli/Nuolet")
  (cs-tack-crossing-arrows "Kiinnitä risteävät Nuolet")
  ;; Occurrence = tapaus
  (cs-jump-to-next-bound-occurrence "Siirry Seuraavaan Sidontatapaukseen")
  (cs-jump-to-previous-bound-occurrence "Siirry Edelliseen Sidontatapaukseen")
  (cs-jump-to-binding "Siirry Sidontatapaukseen")
  (cs-jump-to-definition "Siirry Määritelmään (Toisessa Tiedostossa)")
  (cs-open-defining-file "Avaa Määritystiedosto")
  (cs-error-message "Virheviesti")
  (cs-open-file "Avaa ~a")
  (cs-rename-var "Uudelleennimeä ~a")
  (cs-rename-id "Nimeä Tunniste Uudelleen")
  (cs-rename-var-to "Vaihda “~a”:n nimeksi:")
  ;; Scope = Skooppi
  (cs-name-duplication-error
   "Valitsemasi uusi nimi, ~s, on jo käytössä tässä skoopissa.")
  (cs-rename-anyway "Nimeä siitä huolimatta uudelleen")
  (cs-status-init "Check Syntax: Alustetaan ympäristöä käyttäjän koodille")
  (cs-status-coloring-program "Check Syntax: lausekkeen värjääminen")
  (cs-status-eval-compile-time "Check Syntax: eval compile time")
  (cs-status-expanding-expression "Check Syntax: lausekkeen laajentaminen")
  (cs-status-loading-docs-index "Check Syntax: ladataan dokumentaation indeksiä")
  (cs-syncheck-running "Check Syntax Käynnissä")
  (cs-mouse-over-import "sidotaan “~s” tuotu (paketista?) ~s")
  (cs-mouse-over-import/library-only "tuotu (paketista?) ~s")
  (cs-view-docs "Selaa dokumentaatiota kohdasta “~a”")
  (cs-view-docs-from "~a paikasta ~a")  ;; a completed version of the line above
  ;; (cs-view-docs) is put into the first ~a and a list of modules (separated by commas)
  ;; is put into the second ~a. Use check syntax and right-click on a documented variable
  ;; (eg, 'require') to see this in use

  (cs-lexical-variable "leksikaalinen muuttuja")
  (cs-set!d-variable "mutatoitu muuttuja")
  (cs-imported-variable "tuotu(imported) muuttuja")
  (cs-unused-require "käyttämätön require")
  (cs-free-variable "vapaa muuttuja")

  (cs-binder-count "~a sidontatapausta")
  (cs-zero-varrefs "ei sidontoja")
  (cs-one-varref "1 sidontatapaus")
  ;; expected to have one ~a formatter that will accept a number
  (cs-n-varrefs "~a sidontatapausta")
  ;; Finnish terminology based on https://fi.wikipedia.org/wiki/Sopimuspohjainen_ohjelmointi
  (cs-contract-my-obligation "Sopimus: tämän moduulin velvoite")
  (cs-contract-their-obligation "Sopimus: asiakkaan moduulien velvoite")
  (cs-contract-both-obligation "Sopimus: tämän sekä asiakkaan moduulien velvoite")
  (cs-contract-unk-obligation "Sopimus: tuntematon velvoite")

  ;; require prefix functionality
  (cs-add-prefix-for-require "Lisää etuliite requirelle")
  (cs-prefix-require-title "Require vaatii etuliitteen")
  (cs-prefix-require "Valitse jokaiseen tuotuun muuttujaan lisättävä etuliite")
  (cs-all-binders-are-prefixed
   "Kaikille require-lausekkeilla on jo etuliitteet; kokeile sen sijaan uudelleennimeämistä")
  (cs-the-binder-is-prefixed
   "Requirella vaikuttaa olevan jo etuliite, kokeile uudelleennimeämistä")

  ;; mode sub-menu in the "view" menu
  (cs-check-syntax-mode "Check Syntax Moodi")
  (cs-mode-menu-show-my-obligations "Sopimukseni Velvoitteet")
  (cs-mode-menu-show-client-obligations "Asiakkaan Sopimuksen Velvoitteet")
  (cs-mode-menu-show-syntax "Syntaktiset Kategoriat")

  ;; the documentation blue boxes in the upper-right corner of the drracket window
  (sc-read-more... "lue lisää")
  (sc-f2-to-un/lock "f2 avaa/lukitse")

  ;; the online check syntax status messages (mouse over the bottom right of drracket's
  ;; window to see the messages during online expansion's various phases)
  (online-expansion-running "Taustalla laajentaminen käynnissä")
  (online-expansion-only-raw-text-files-supported "Vain tekstitiedostot ovat tuettuja")
  (online-expansion-abnormal-termination "Taustalla laajentaminen keskeytyi epänormaalisti")
  (online-expansion-abnormal-termination-out-of-memory
   "Taustalla laajentaminen päättyi epänormaalisti (muisti loppu)")
  (online-expansion-finished-successfully "Taustalla laajentaminen suoritettiin onnistuneesti")

  (jump-to-error "Hyppää Virheeseen")
  (copy-error-message "Kopioi Virheviesti")
  (online-expansion-is-disabled "Taustalla laajentaminen ei ole käytössä")
  ; these next two show up in the bar along the bottom of the drracket window
  (online-expansion-pending "Taustalla laajentaminen odottaa…")
  ;; note: there may still be errors in this case
  (online-expansion-finished "Taustalla laajentaminen on valmistunut")
  ; the next two show up in a menu when you click on the circle in the bottom right corner
  (disable-online-expansion "Poista taustala laajentaminen käystöstä")
  (enable-online-expansion "Ota taustalla laajentaminen käyttöön")
  ;; the online expansion preferences pane
  (online-expansion "Taustalla laajentaminen") ;; title of prefs pane
;  ; the different kinds of errors
  (online-expansion-show-read-errors-as "Näytä luku-tason virheet")
  (online-expansion-show-variable-errors-as "Näytä sitomaton tunniste -virheet")
  (online-expansion-show-other-errors-as "Näytä muut virheet")
  ; locations the errors can be shown
  (online-expansion-error-gold-highlight "kulta-korostuksella")
  (online-expansion-error-margin "marginaalissa")
  ; the label of a preference in the (string-constant online-expansion) section
  (show-arrows-on-mouseover "Näytä sidonta- ja häntäpositionuolet hiiren ollessa yllä")
  (show-blueboxes "Näytä allekirjoitus-laatikot and allekirjoituslaatinno nuoli puoliympyrä oikeassa ylänurkassa")
  ;;; info bar at botttom of drscheme frame
  (collect-button-label "GC")
  (read-only "Vain luku")
  (auto-extend-selection "Laajenna automaattisesti")
  (overwrite "Ylikirjoita")
  (running "käynnissä")
  (not-running "ei käynnissä")

  ;; button label: ~a is filled with the name of a pkg
  (install-package-button "Asenna ~a")
  ;; button label; shown when there is a missing module, but no matching package
  (update-catalog "Päivitä Luettelo")
  ;; message label; used as a status message when updating the pkg catalog
  (updating-catalog-from "Päivitetään lähteestä ~a…")

  ;;; misc
  (welcome-to-something "Tervetuloa kohtaan ~a")

  ; this appears in the drscheme about box.
  (welcome-to-drscheme-version/language "Tervetuloa DrRackettiin, versioon ~a, ~a")

  ; these appear on subsequent lines in the `Help|Welcome to DrRacket' dialog.
  (welcome-to-drscheme "Tervetuloa DrRackettiin")

  (goto-line "Mene Riville")
  (goto-line-invalid-number
   "~a ei ole kelpaava rivinumero. Sen pitää ollo kokonaisluku välillä 1 and ~a")
  (goto-position "Mene Positioon")
  (no-full-name-since-not-saved
   "Tiedostolla ei ole kokonaista nimeä, koska sitä ei ole vielä tallennettu.")
  (cannot-open-because-dne "Ei voi avata ~a koska sitä ei ole olemassa.")

  (needs-execute-language-changed
   "VAROITUS: Kieli on muuttunut. Paina Aja.")
  (needs-execute-teachpack-changed
   "VAROITUS: Opetuspaketit ovat muuttuneet. Paina Aja.")
  (needs-execute-defns-edited
   "VAROITUS: Määrittelyikkuna on muuttunut. Paina Aja.")

  (editor-changed-since-srcloc-recorded
   "Tämä editori on muuttunut lähdesijainnin tallentamisen jälkeen,"
   " joten korostettu alue ei välttämättä vastaa oikeaa lähdesijaintia.")

  (file-is-not-saved "Tiedostoa “~a” ei ole tallennettu.")
  (save "Tallenna")
  (close-anyway "Sulje Kuitenkin")
  (dont-save "Älä Tallenna")
  (clear-anyway "Tyhjennä Kuitenkin")

  ;; menu item title
  (log-definitions-and-interactions "Kirjaa Määritelmät ja Interaktiot…")
  (stop-logging "Lopeta Kirjaaminen")
  (please-choose-a-log-directory "Valitse Kansio Lokeille")
  (logging-to "Kirjataan kohteeseen: ")
  (erase-log-directory-contents "Poistetaanko sisältö lokikansiosta: ~a?")
  (error-erasing-log-directory "Virhe poistaessa lokikansion sisältöjä.\n\n~a\n")

  ;; menu items connected to the logger; also in a button in the planet status line in the drs frame
  (show-log "Näytä &Loki")
  (hide-log "Piilota &Loki")
  (logger-scroll-on-output "Vieritä tulostettaessa") ; a checkbox in the logger pane
  (log-messages "Lokiviestit") ;; label for the drracket logging gui panel

  ;; modes
  (mode-submenu-label "Moodit")
  (scheme-mode "Scheme-moodi")
  (racket-mode "Racket-moodi")
  (text-mode "Teksti-moodi")

  (scheme-mode-color-symbol "Symboli")
  (scheme-mode-color-keyword "Avainsana")
  (scheme-mode-color-comment "Kommentti")
  (scheme-mode-color-string "Merkkijono")
  (scheme-mode-color-text "Teksti")
  (scheme-mode-color-constant "Vakio")
  (scheme-mode-color-parenthesis "Sulkeet")
  (scheme-mode-color-hash-colon-keyword "#:Avainsana")
  (scheme-mode-color-error "Virhe")
  (scheme-mode-color-other "Muu")
  ;; the ~a is filled in with one of the above (scheme-mode-*)
  (syntax-coloring-choose-color "Valitse väri kategorialle ~a")
  (preferences-colors "Värit") ;; used in the preferences dialog

  ;; parenthesis color scheme string constants
  ; label for the choice% menu in the preferences dialog
  (parenthesis-color-scheme "Sulkeiden väriskeema")
  (paren-color-basic-grey "Harmaa")
  (paren-color-shades-of-gray "Harmaan sävyjä")
  (paren-color-shades-of-blue "Sinisen sävyjä")
  (paren-color-spring "Kevät")
  (paren-color-fall "Syksy")
  (paren-color-winter "Talvi")


  (url: "URL:")
  (open-url... "Avaa URL…")
  (open-url "Avaa URL")
  (browse... "Selaa…")
  (bad-url "Huono URL")
  (bad-url:this "Huono URL: ~a")

  ;; Help Desk
  (help "Ohje")
  (racket-documentation "Racket-Dokumentaatio")
  (x-documentation "~a-Dokumentaatio") ;; ~a is filled with a language family name, eg Racket, Rhombus, or HtDP
  (help-desk "Tukipalvelu")
  (plt:hd:search "Haku")
  (plt:hd:feeling-lucky "Onnekas olo")
  (plt:hd:home "Tukipalvelu koti")
  ; next 3 are popup menu choices in help desk search frame
  (plt:hd:search-for-keyword "Avainsanan merkintä")
  (plt:hd:search-for-keyword-or-index "Avainsana- tai hakemistomerkintä")
  (plt:hd:search-for-keyword-or-index-or-text "Avainsanan-, hakemistomerkintä tai teksti")
  (plt:hd:exact-match "Kokonaiset sanat")
  (plt:hd:containing-match "Sisältää osuman")
  (plt:hd:regexp-match "Regexp osuma")
  (plt:hd:find-docs-for "Etsi dokumentaatiota asiasta:")
  (plt:hd:search-stopped-too-many-matches "[Haku keskeytetty: liian monta osumaa]")
  (plt:hd:nothing-found-for "Ei löytynyt mitään haulla ~a")
  (plt:hd:and "ja")
  (plt:hd:refresh "päivitä")
  (plt:hd:refresh-all-manuals "päivitä kaikki manuaalit")
  (plt:hd:manual-installed-date "(asennettu ~a)")
  ; Help Desk configuration
  ;; refreshing manuals
  (plt:hd:refreshing-manuals "Ladataan uudelleen manuaaleja")
  (plt:hd:refresh-downloading... "Ladataa ~a…")
  (plt:hd:refresh-deleting... "Poistetaan uutta versiota ~a…")
  (plt:hd:refresh-installing... "Asennetaan uutta versiota ~a…")
  (plt:hd:refresh-clearing-indices "Poisteaan välimuistin indeksejä")
  (plt:hd:refreshing-manuals-finished "Valmis.")
  (plt:hd:about-help-desk "Tukipalvelusta")
  (plt:hd:help-desk-about-string
   "Tukipalvelu on sisältää kattavan määrän tietoa Racket-"
   " ohjelmistosta.\n\nVersio ~a\nCopyright (c) ~a-~a PLT")
  (plt:hd:help-on-help "Ohjeita Ohjeesta")
  (plt:hd:help-on-help-details
   "Ohjeita tukipalvelun käyttöön, seuraa ensimmäistä linkkiä `Tukipalvelu' on Tukipalvelun kotisivulla."
   " (Päästäksesi kotisivulle, jos et jo ole sillä, paina `Home'-"
   " painiketta Tukipalvelun-yläosassa.)")
  (reload "Lataa Uudelleen") ;; refresh the page in a web browser
  (plt:hd:ask-about-separate-browser
   "Olet valinnut selata sisältöä world-wide webissä."
   " Haluaisitko selata sitä Tukipalvelu-selaimella, vai"
   " haluaisitko käyttää erillistä selainohjelmaa sen selaamiseen?")
  (plt:hd:homebrew-browser "Tukipalvelu-selain") ;; choice for the above string (in a button)
  (plt:hd:separate-browser "Erillinen Selain") ;; other choice for the above string (also in a button)
  (plt:hd:external-link-in-help "Ulkoiset URLit in Ohjeissa")
  (plt:hd:use-homebrew-browser "Käytä Tukipalvelu-selainta ulkoisille URLeille")
  (plt:hd:new-help-desk "Uusi Tukipalvelu")

  ;; in the Help Desk language dialog, title on the right.
  (plt:hd:manual-search-ordering "Manuaalinen Hakujärjestys")

  ;; in the help-desk standalone font preference dialog, on a check box
  (use-drscheme-font-size "Käytä DrRacketin fonttikokoa")

  ;; in the preferences dialog in drscheme there is example text for help desk font size.
  ;; clicking the links in that text produces a dialog with this message
  (help-desk-this-is-just-example-text
   "Tämä on vain esimerkkiteksti fonttikoon asettamista varten."
   " Avaa Tukipalvelu kunnolla (Ohje-valikosta) seurataksesi näitä linkkejä.")

  ;; this appears in the bottom part of the frame the first time the user hits `f1'
  ;; (assuming nothing else has loaded the documentation index first)
  ;; see also: cs-status-loading-docs-index
  (help-desk-loading-documentation-index "Tukipalvelu: ladataan dokumentaation indeksiä")

  ;; the next four are all in the same dialog box (only one of the first two appears)
  (help-desk-materialize-docs-something-changed
   "DrRacket havaitsi mahdollisen ongelman dokumentaation"
   " indeksissä. Yrittääkö se korjata ongelman(saattaa kestää muutaman"
   " hetken)?\n\nTarkemmin, dokumentaatiokansiota ~a ei"
   " ole, ja siten haku selaimessa todennäköisesti epäonnistuu.")
  (help-desk-materialize-docs-first-time
   "DrRacket havaitsi mahdollisen ongelman dokumentaation"
   " indeksissä. Yrittääkö se korjata ongelman(saattaa kestää muutaman"
   " hetken)?\n\nTarkemmin, DrRacket luonut"
   " käyttäjädokumentaatiota aiemmin, täten haku selaimessa"
   " saattaa epäonnistua.")
  (help-desk-do-nothing "Älä Tee Mitään")
  (help-desk-materialize-user-docs "Luo Käyttäjädokumentaatio")
  ; this is used in a dialog to let the user know that work is being done based on
  ; choices made from the previous dialog in the above four string constants
  (help-desk-materializing-user-docs... "Luodaan käyttäjädokumentaatiota...")

  ;; Help desk htty proxy
  (http-proxy "HTTP Välityspalvelin")
  (proxy-direct-connection "Suora Yhteys")
  (proxy-use-proxy "Käytä välityspalvelinta:")
  (proxy-host "Nimi")
  (proxy-port "Portti")
  (proxy-bad-host "Huono Välityspalvelin")

  ;; browser
  (rewind-in-browser-history "Taaksepäin")
  (forward-in-browser-history "Eteeinpäin")
  (home "Koti")
  (browser "Selain")
  (external-browser-choice-title "Ulkoinen Selain") ; title for radio-button set
  (browser-command-line-label "Komentorivi:") ; label for radio button that is followed by text boxes
  (choose-browser "Valitse Selain")
  (no-browser "Kysy Myöhemmin")
  ; explanatory text for dialog, line 1
  (browser-cmdline-expl-line-1 "(Komentorivi muodostetaan liittämällä pre-text, URL,")
  ; ... line 2. (Anyone need more lines?)
  (browser-cmdline-expl-line-2 "ja post-text, ilman ylimääräisiä välejä niiden välissä.)")
  (install? "Asenna")  ;; if a .plt file is found (title of dialog)
  (you-have-selected-an-installable-package "Olet valinnut asentamiskelpoisen paketin.")
  (do-you-want-to-install-it? "Haluatko asentaa sen?")
  (paren-file-size "(Tiedoston koko on ~a tavua)")
  (download-and-install "Lataa && Asenna") ;; button label
  (download "Lataa") ;; button label
  (save-downloaded-file/size "Tallenna ladattu tiedosto (~a tavua) nimellä") ;; label for get-file dialog
  (save-downloaded-file "Tallenna ladattu tiedosto nimellä")  ;; label for get-file dialog
  (downloading "Ladataan") ;; dialog title
  (downloading-file... "Ladataan tiedostoa…")
  (package-was-installed "Paketti asennettiin.")
  (download-was-saved "Ladattu tiedosto tallennettiin.")

  (install-plt-file-menu-item... "Asenna .plt Tiedosto…")
  (install-plt-file-dialog-title "Asenna .plt Tiedosto")
  (install-plt-web-tab "Web")
  (install-plt-file-tab "Tiedosto")
  (install-plt-filename "Tiedostonimi")
  (install-plt-url "URL:")
  ; an error message from a primitive operation is appended to the end of this message.
  (install-plt-error-downloading "Tapahtui virhe ladatessa"
                                 " .plt tiedostoa .\n\nTietoja:\n")
  (install-plt-error-header
   "Tapahtui virhe tarkastettaessa ladatun"
   " .plt-tiedoston validiteettia. Tarkasta url ja yritä uudelleen.")

  ;; install plt file when opened in drscheme strings
  (install-plt-file "Asenna ~a tai avaa muokkausta varten?")
  (install-plt-file/yes "Asenna")
  (install-plt-file/no "Muokkaa")

  (plt-installer-progress-window-title "Asennusohjelman Eteneminen") ;; frame title
  (plt-installer-abort-installation "Keskeytä Asennus") ;; button label
  ;; msg that appears in the installation window when installation is aborted
  (plt-installer-aborted "Keskeytetty.")

  ;;; about box
  (about-drscheme-frame-title "Tietoa DrRacketista") ;vai "DrRacket-sovelluksesta"?

  ;;; save file in particular format prompting.
  (save-as-plain-text "Tallenna tiedosto tekstitiedostona")
  (save-as-binary-format "Muuta tämä tiedosto DrRacket-kohtaiseen muotoon säilyttääksesi ei-teksti -elementit?")
  (save-in-drs-format "Tallenna tämä tiedosto DrRacket-kohtaiseen ei-teksti -muotoon?")
  (keep-format "Säilytä (saatat menettää dataa)")
  (convert-format "Muuta (suositeltu)")
  (dont-save "Älä Tallenna")
  (yes "Kyllä")
  (no "Ei")

  ;; saving image (right click on an image to see the text)
  (save-image "Tallenna Kuva…")

  ;;; preferences
  (preferences "Asetukset")
  (error-saving-preferences "Virhe tallentaessa asetuksia: ~a")
  (error-saving-preferences-title "Virhe tallentaessa asetuksia")
  ;; in the preferences error dialog; this happens when the lockfile exists (after 3 pref writes).
  (steal-the-lock-and-retry "Varasta lukko && yritä uudelleen")

  (error-reading-preferences "Virhe lukiessa asetuksia")
  (error-reading-preferences-explanation
   "Asetukset-tiedosto on lukittu ja siten asetusta ~a ei voida lukea")
  ;; in the above, ~a is filled with the name of the preference (a symbol)
  (dont-ask-again-until-drracket-restarted "Älä Kysy Uudelleen (kunnes DrRacket on käynnistetty uudelleen)")
  ; difference between the above and below is one comes with a question (steal the lock or not)
  ;; and the other with just a notation saying "the file is locked"
  (dont-notify-again-until-drracket-restarted "Älä ilmoita uudelleen (kunnes DrRacket on käynnistetty uudelleen)")
  (prefs-file-locked
   "Asetukset-tiedosto on lukittu (koska tiedosto ~a on olemassa),"
   " so your preference change could not be saved. Cancel preference change?")
  (try-again "Yritä uudelleen") ;; button label
  (give-up-and-use-the-default "Anna olla ja käytä oletusasetusta") ;; button label

  (prefs-file-still-locked
   "Asetukset-tiedosto on edelleen lukittu (koska tiedosto ~a on olemassa),"
   " joten muuttamaasi asetusta ei tallenneta.")
  (prefs-file-locked-nothing-doing
   "Asetukset-tiedoston on lukittu (tiedoston ~s toimesta) joten asetusten muutoksia ei tallenneta.")
  ;; the  ~s is filled with the lockfile; this string is (currently) used only on
  ;; windows where lockfiles are less friendly (and there is no steal fallback)

  (scheme-prefs-panel-label "Racket")
  (warnings-prefs-panel-label "Varoitukset")
  (editor-prefs-panel-label "Editing")
  (general-prefs-panel-label "Yleistä")
  (editor-general-prefs-panel-label "Yleistä Editoinnista")
  (highlight-parens "Korosta vastaavien sulkeiden väli")
  (fixup-open-brackets "Mukauta automaattisesti avaavaa hakasuljetta")
  (fixup-close-parens "Mukauta automaattisesti sulkevaa suljetta")
  (flash-paren-match "Väläytä vastaavaa suljetta")
  (backup-unsaved-files "Tee varmuuskopioita tallentamattomista tiedostoista")
  (first-change-files "Tee ensimmäinen muutos -tiedostoja")
  (map-delete-to-backspace "Aseta delete to askelpalauttimeen")
  (verify-exit "Vahvista lopettaminen")
  (ask-before-changing-format "Kysy ennen tallennusmuodon muuttamista")
  (wrap-words-in-editor-buffers "Rivitä sanat editori-puskureissa")
  (show-status-line "Näytä status-rivi")
  (count-columns-from-one "Laske sarakkeet yhdestä alkaen")
  (display-line-numbers "Näytä rivinumerot puskurissa; ei merkki offsettiä") ; FI&EN
  ; used for popup menu; right click on line/column box in bottom of drs window
  (show-line-and-column-numbers "Näytä Rivi- && Sarakenumerot")
  ; used for popup menu; right click on line/column box in bottom of drs window
  (show-character-offsets "Näytä merkkien Offsets") ; FI&EN
  (enable-keybindings-in-menus "Aktivoi pikanäppäimet valikoissa (ylikirjoittaa Emacs näppäinyhdistelmät)")
  (printing-mode "Tulostus-moodi")
  (print-using-platform-specific-mode "Alusta-kohtainen tulostus")
  (print-to-ps "Tulosta PostScript-tiedostoon")
  (print-to-pdf "Tulosta PDF-tiedostoon")
  (command-as-meta "Käsittele komento-näppäintä meta-näppäimenä") ;; macos/macos x only
  (any-control+alt-is-altgr "Käsittele Control-Alt yhdistelmää AltGr:nä") ; Windows only
  (alt-as-meta "Käsittele alt-näppäintä meta-näppäimenä")
  (reuse-existing-frames "Uudelleenkäytä olemassaolevia kehyksiä(frames) avatessa uusia tiedostoja")
  (default-fonts "Oletusfontit")
  (basic-gray-paren-match-color "Perusharmaa sulkeiden korostusväri") ; in prefs dialog
  (online-coloring-active "Väritä syntaksi interaktiivisesti(Color syntax interactively)") ; FI&EN
  (open-files-in-tabs "Avaa tiedostot erillisissä välilehdissä (ei erillisissä ikkunoissa)")
  (show-interactions-on-execute "Avaa interaktio-ikkuna automaattisesta ajaessa ohjelmaa")
  (switch-to-module-language-automatically
   "Vaihda automaattisesti moduulin kieleen avatessa moduulia")
  ;; in preferences, below the checkbox one line above this one
  (interactions-beside-definitions "Laita interaktioikkuna määrittelyikkunan viereen")
  (show-line-numbers "Näytä rivinumerot")
  ;; just like the above, but capitalized for appearance in a menu item
  (show-line-numbers/menu "Näytä Rivi&Numerot")
  (hide-line-numbers/menu "Piilota Rivi&Numerot")
  (show-line-numbers-in-definitions "Näytä kaikki rivinumerot Määrittelyissä")
  ;; the constant above shows up in the popup menu item in the bottom of
  ;; the drracket window; controls the line numbers on each line in the definitions;
  ;; used in a checkable menu item
  (reflow-paragraph-maximum-width "Maksimileveys uudelleensovittaessa(reflowing) kappaleita") ; FI&EN
  (maximum-char-width-guide-pref-check-box "Maksimi merkin pituus opas")
  (hide-column-width-guide "Piilota Sarakaleveysohjain Sarakemäärän ~a Omaavilta Tiedostoilta")
  (show-column-width-guide "Näytä Sarakeleveysohjain Sarakemäärällä ~a") ;; filled with a number > 2
  (limit-interactions-size "Rajoita interaktioiden kokoa")
  ;; this is in the color section already, so shorten the name a little
  (background-color "Tausta")
  ;; used for configuring colors, but doesn't need the word "color"
  (default-text-color "Oletusteksti")
  (choose-a-background-color "Valitse taustaväri")
  (revert-to-defaults "Palauta kaikki asetukset oletusarvoihin")
  ;; used in the preferences dialog to undo preference changes
  (undo-changes "Kumoa Muutokset ja Sulje")

  (color-schemes "Väriskeemat") ;; the label in the preferences dialog for the color scheme panel
  (classic-color-scheme "Perinteinen") ;; formerly called 'black on white'
  (modern-color-scheme "Moderni")   ;; an attempt to be more color-blind friendly
  ;; clicking the buttons changes the color schemes to some defaults that've been set up.
  (white-on-black-color-scheme "Valkoinen mustalla")
  ; drracket additions to the color scheme dialog; two buttons
  (design-your-own-color-schemes "Suunnittele Omat Väriskeemasi") ; pointer to (english-only) docs
  (style-and-color-names "Tyylien && Värien Nimet")

  (add-spacing-between-lines "Lisää yksi pikseli lisää tilaa rivien väliin")

  (editor-x-selection-mode "Vaadi eksplisiittisesti kopio-opreaatio ennen"
                           " liittämistä / Älä kopioi valintaa automaattisesti")

  ; should have entire alphabet
  (font-example-string "Yöllä susi hyppäsi kohti å-kirjainta.")

  (change-font-button-label "Muuta")
  (fonts "Fontit")
  (other... "Muut…") ;; used in the font choice menu item

  ; filled with type of font, eg modern, swiss, etc.
  (choose-a-new-font "Valitse uusi “~a” fontti")

  (font-size-slider-label "Koko")
  (restart-to-see-font-changes "Käynnistä uudelleen nähdäksesi fontin muutokset")

  (font-prefs-panel-title "Fontti")
  (font-name "Fontin Nimi")
  (font-size "Fontin Koko")
  (set-font "Aseta Fonti…")
  (font-smoothing-label  "Font smoothing")
  (font-smoothing-none "Ilman")
  (font-smoothing-some "Hieman")
  (font-smoothing-all "Kokonaan")
  (font-smoothing-default "Käytä järjestelmänlaajuisia oletuksia")
  (font-weight-label "Korostus")
  (font-weight-light "Kevyt")
  (font-weight-normal "Normaali")
  (font-weight-bold "Lihavoitu")

  (select-font-name "Valitse Fontin Nimi")
  (example-text "Esimerkkiteksti:")
  (only-warn-once "Varoita kertaalleen kun määrittelyt ja interaktiot eivät ole synkassa")

  ; font size menu items in the 'view' menu; the ~a is filled with a number (font size)
  (increase-font-size "Kasvata Fonttikokoa (kokoon ~a)")
  (decrease-font-size "Pienennä Fonttikokoa (kokoon ~a)")

  ; warning message when lockfile is around
  (waiting-for-pref-lock "Odotetaan asetukset-lukkotiedostoa…")
  (pref-lock-not-gone
   "Asetukset-lukkotiedosto:\n\n   ~a\n\nestää tallentamasta asetuksia."
   " Varmista, ettei Racket-sovellus ole käynnissä ja poista tämä tiedosto.")
  (still-locked-exit-anyway? "Asetuksia ei saatu tallennettua. Lopeta kuitenkin?")

  ;;; indenting preferences panel
  (indenting-prefs-panel-label "Sisennys")
  (indenting-prefs-extra-regexp "Ylimääräinen säännöllinen lauseke")

  (square-bracket-prefs-panel-label "Hakasulkeet")

  ; filled with define, lambda, or begin
  (enter-new-keyword "Syötä uusi ~a-tyylinen avainsana:")
  (x-keyword "~a avainsana")
  (x-like-keywords "~a-tyyliset Avainsanat")

  ; used in Square bracket panel
  (skip-subexpressions "Ohitettavien alilausekkeiden määrä")

  (expected-a-symbol "odotettiin symbolia, löydettiin: ~a")
  (already-used-keyword "“~a” on jo erityisesti sisennetty avainsana")
  (add-keyword "Lisää")
  (remove-keyword "Poista")

  ; repl color preferences
  (repl-colors "REPL")
  (repl-out-color "Tuloste")
  (repl-value-color "Arvot")
  (repl-error-color "Virheet")

  ;;; find/replace
  (search-next "Seuraava")
  (search-previous "Edellinen")
  (search-match "Osuma")  ;;; this one and the next one are singular/plural variants of each other
  (search-matches "Osumat")
  (search-replace "Korvaa")
  (search-skip "Ohita")
  (search-show-replace "Näytä Korvaa")
  (search-hide-replace "Piilota Korvaa")
  (find-case-sensitive "Sama kirjainkoko")  ;; the check box in both the docked & undocked search
  (find-anchor-based "Etsi ankkureilla(Search using anchors)") ; FI&EN

  ;; these string constants used to be used by searching,
  ;; but aren't anymore. They are still used by other tools, tho.
  (hide "Piilota")
  (dock "Kiinnitä(Dock)") ; FI&EN
  (undock "Irrota(Undock)") ; FI&EN

  ;;; multi-file-search
  (mfs-multi-file-search-menu-item "Etsi &Tiedostoissa…")
  (mfs-string-match/graphics "Merkkijono osuma (hoitaa grafiikkaa sisältävät tiedostot)")
  (mfs-regexp-match/no-graphics "Säännöllinen lauseke (vain tekstitiedostot)")
  (mfs-searching... "Etsitään…")
  (mfs-configure-search "Muokkaa Hakua") ;; dialog title
  (mfs-files-section "Tiedostot")   ;; section in config dialog
  (mfs-search-section "Haku") ;; section in config dialog
  (mfs-dir "Dir")
  (mfs-recur-over-subdirectories "Recur over subdirectories")
  (mfs-regexp-filename-filter "Säänn. laus. tiedostonimi suodatin")
  (mfs-search-string "Etsi merkkijono")
  (mfs-drscheme-multi-file-search "Monitiedostohaku - DrRacket") ;; error message window title
  (mfs-not-a-dir "“~a” ei ole hakemisto")
  (mfs-open-file "Avaa Tiedosto")
  (mfs-stop-search "Lopeta Haku")
  (mfs-case-sensitive-label "Sama kirjainkoko")
  (mfs-no-matches-found "Etsittävää ei löytynyt")
  (mfs-search-interrupted "Haku keskeytetty.")
  ;; the ~a format specifier is filled in with the search string
  (mfs-drscheme-multi-file-search-title "Monitiedostohaku merkkijonolle “~a” - DrRacket")

  ;;; reverting a file
  (are-you-sure-revert
   "Haluatko varmasti palauttaa tämän tiedoston? Muutosta ei voida peruuttaa.")
  (are-you-sure-revert-title
   "Palauta?")

  ;;; saving a file
  ; ~a is filled with the filename
  (error-saving "Virhe Tallentaessa") ;; title of error message dialog
  (error-saving-file/name "Tapahtui virhe tallentaessa tiedostoa ~a.")
  (error-loading "Virhe Ĺadattessa")
  (error-loading-file/name "Tapahtui virhe ladattaessa tiedostoa ~a.")
  (unknown-filename "<< tuntematon >>")

  ;;; finder dialog
  (must-specify-a-filename "Sinun täytyy määrittää tiedostonimi")
  (file-does-not-exist "Tiedostoa “~a” ei ole olemassa.")
  (ask-because-file-exists "Tiedosto “~a” on jo olemassa. Korvaa se?")
  (dne-or-cycle "Tiedosto “~a” sisältää olemattoman hakemiston tai syklin.")
  (get-file "Hae tiedosto")
  (put-file "Vie tiedosto")
  (full-pathname "Koko tiedostopolku")
  (show-dot-files "Näytä tiedostot ja hakemistot jotka alkavat pisteellä.")
  (up-directory-button-label "Siirry yläkansioon")
  (add-button-label "Valitse") ;;; for multi-file selection
  (add-all-button-label "Valitse kaikki") ;;; for multi-file selection
  (remove-button-label "Poista") ;;; for multi-file selection
  (file-wrong-form "Tiedostonimi ei ole oikeassa muodossa.")
  (select-files "Valitse tiedostoja")
  (select-file "Valitse tiedosto")
  (dir-dne "Sitä hakemistoa ei ole olemassa.")
  (file-dne "Sitä tiedostoa ei ole olemassa.")
  (empty-filename "Tiedostonimen tulee sisältää kirjaimia.")
  (that-is-dir-name "Tämä on hakemiston nimi.")
  (use-platform-specific-file-dialogs "Käytä alustakohtaisia tiedosto-dialogeja") ;; a preferences option

  ;;; raw menu names -- these must match the
  ;;; versions below, once the &s have been stripped.
  ;;; if they don't, DrRacket's menus will appear
  ;;; in the wrong order.
  (file-menu "Tiedosto")
  (edit-menu "Muokkaa")
  (help-menu "Ohje")
  (windows-menu "Ikkuna")
  (tabs-menu "Välilehdet") ;; this is the name of the "Windows" menu under linux & windows

  ;;; menus
  ;;; - in menu labels, the & indicates a alt-key based shortcut.
  ;;; - sometimes, things are stuck in the middle of
  ;;; menu item labels. For instance, in the case of
  ;;; the "Save As" menu, you might see: "Save Definitions As".
  ;;; be careful of spacing, follow the English, if possible.
  ;;; - the ellipses in the `after' strings indicates that
  ;;; more information is required from the user before completing
  ;;; the command.

  (file-menu-label "&Tiedosto")

  (new-info  "Avaa uusi tiedosto")
  (new-menu-item "&Uusi")
  (new-...-menu-item "&Uusi…")

  (open-info "Avaa tiedosto levyltä")
  (open-menu-item "&Avaa…")

  (open-recent-info "Lista viimeisimmistä avatuista tiedostoista")
  (open-recent-menu-item "Avaa Viimeisimmis&tä")

  (revert-info "Palauta tiedosto levyllä olevaan kopioon")
  (revert-menu-item "&Palauta")

  (save-info "Tallenna tämä tiedosto levylle")
  (save-menu-item "&Tallenna")

  (save-as-info "Kysy tiedoston nimeä ja tallenna tämä tiedosto levylle")
  (save-as-menu-item "Tallenna &Nimellä…")

  (print-info "Lähetä tiedosto tulostimelle")
  (print-menu-item "&Tulosta…")

  (page-setup-info "Muuta tulostamisen asetuksia")
  (page-setup-menu-item "Sivun asetukset…")

  (close-info "Sulje tiedosto")
  (close-menu-item "&Sulje")
  (close-window-menu-item "&Sulje Ikkuna")

  (quit-info "Sulje kaikki ikkunat")
  (quit-menu-item-windows "&Poistu")
  (quit-menu-item-others "&Lopeta")

  (edit-menu-label "&Muokkaa")

  (undo-info "Kumoa viimeisin toiminto")
  (undo-menu-item "&Kumoa")

  (redo-info "Kumoa viimeisin kumous")
  (redo-menu-item "&Tee uudelleen")

  (cut-info "Siirrä valitut asiat leikepöydälle myöhempää liittämistä varten")
  (cut-menu-item "&Leikkaa")

  (copy-info "Kopioi valitut asiat leikepöydälle myöhempää liittämästä varten")
  (copy-menu-item "&Kopioi")

  (paste-info "Liitä viimeisimät kopioidut tai leikatut asia valittujen asioiden tilalle")
  (paste-menu-item "&Liitä")
  (paste-and-indent-menu-item "Liitä ja Sisennä")

  (clear-info "Poista valitut asiat vaikuttamatta leikepöytään tai liittämiseen")
  (clear-menu-item-windows "&Poista")

  (select-all-info "Valitse koko dokumentti")
  (select-all-menu-item "&Valitse kaikki")

  (find-menu-item "Etsi") ;; menu item
  (find-from-selection-menu-item "&Etsi valinnasta")
  (find-info "Vaihtaa näppäimistön fokusta haettavan ikkunan ja etsi-rivin välillä")

  (find-next-info "Siirry seuraavaan merkkijonon osumaan etsi-ikkunassa(find window)") ; FI&EN
  (find-next-menu-item "Etsi seuraava")

  (find-previous-info "Siirry edelliseen osumaan etsi-ikkunassa")
  (find-previous-menu-item "Etsi Edellinen")

  (show-replace-menu-item "Näytä Korvaa")
  (hide-replace-menu-item "Piilota Korvaa")
  (show/hide-replace-info "Vaihtelee Korvaa-paneelin näkyvyyttä")

  (replace-menu-item "Korvaa")
  (replace-info "Korvaa osuma tummassa ympyrässä")

  (replace-all-info "Korvaa merkkijonon kaikki osumat")
  (replace-all-menu-item "Korvaa Kaikki")

  (find-case-sensitive-info "Aseta \"Sama kirjainkoko\" -vaatimus päälle/pois päältä")
  (find-case-sensitive-menu-item "Etsi samalla kirjainkoolla")

  (complete-word "Täydennä Sana") ; the complete word menu item in the edit menu
  ; shows up in the completions menu when there are no completions (in italics)
  (no-completions "… täydennyksiä ei saatavilla")

  (overwrite-mode "Ylikirjoitus-Moodi")
  (enable-overwrite-mode-keybindings "Aktivoi ylikirjoituksen pikanäppäimet (overwrite mode keybindings)") ; FI&EN

  (enable-automatic-parens "Aktivoi automaattiset sulkeet, hakasulkeet ja heittomerkit")

  (preferences-info "Muuta asetuksiasi")
  (preferences-menu-item "Asetukset…")

  (keybindings-info "Näytä aktiiviset pikanäppäimet")
  (keybindings-menu-item "Pikanäppäimet")
  (keybindings-show-active "Näytä Aktiiviset Pikanäppäimet")
  (keybindings-frame-title "Pikanäppäimet")
  (keybindings-sort-by-name "Lajittele Nimen Perusteella")
  (keybindings-sort-by-key "Lajittele Avaimen Perusteella")
  (keybindings-add-user-defined-keybindings "Lisää käyttäjän määrittelemät pikanäppäimet…")
  (keybindings-add-user-defined-keybindings/planet "Lisää käyttäjän määrittelemät pikanäppäimet PLaneTista…")
  (keybindings-menu-remove "Poista ~a")
  (keybindings-choose-user-defined-file "Valitse pikanäppäimet sisältävä tiedosto.")
  ; the string will be what the user typed in
  (keybindings-planet-malformed-spec "PLaneT speksi on väärässä muodossa: ~a")
  (keybindings-type-planet-spec "Syötä PLaneT require speksi (ilman `require'a)")

  ; first ~a will be a string naming the file or planet package where the keybindings come from;
  ; second ~a will be an error message
  (keybindings-error-installing-file "Virhe asennettaessa pikanäppäimiä ~a:\n\n~a")

  (user-defined-keybinding-error "Virhe suorittaessa pikanäppäintä ~a\n\n~a")
  (user-defined-keybinding-malformed-file
   "Tiedosto ~a ei sisällä moduulia, joka on kirjoitettu framework/keybinding-lang -kielellä.")
  (user-defined-keybinding-malformed-file/found-lang
   "Tiedosto ~a ei sisällä moduulia, joka on kirjoitettu"
   " framework/keybinding-lang -kielellä. Sen sijaan löytyi kieli ~s.")

  ;; menu items in the "special" menu
  (insert-text-box-item "Lisää Tekstilaatikko")
  (insert-image-item "Lisää Kuva…")
  (insert-comment-box-menu-item-label "Lisää Kommenttilaatikko")
  (insert-lambda "Lisää λ")

  (wrap-text-item "Rivitä Teksti")

  ;; windows menu
  (windows-menu-label "&Ikkunat")
  (tabs-menu-label "&Välilehdet") ;; this is the name of the menu under linux & windows
  (minimize "Pienennä") ;; minimize and zoom are only used under mac os x
  (zoom "Zoomaa")
  (bring-frame-to-front "Tuo Kehys(Frame) Eteen")       ;;; title of dialog
  (bring-frame-to-front... "Tuo Kehys(Frame) Eteen…") ;;; corresponding title of menu item
  (most-recent-window "Viimeisin Ikkuna")
  (next-tab "Seuraava Välilehti")
  (prev-tab "Edellinen Välilehti")
  (move-current-tab-right "Siirrä Välilehti &Oikealle")
  (move-current-tab-left "Siirrä Välilehti &Vasemmalle")
  ;; menu item in the windows menu under mac os x. first ~a is filled
  ;; with anumber between 1 and 9; second one is the filename of the tab
  (tab-i "Välilehti ~a: ~a")
  (tab-i/no-name "Välilehti ~a")
  (last-tab "Viimeinen Välilehti: ~a")

  (view-menu-label "&Näytä")
  (show-overview "Näytä &Ohjelman Muoto")
  (hide-overview "Piilota &Ohjelman Muoto")
  (show-module-browser "Näytä &Moduuli Selain")
  (hide-module-browser "Piilota &Moduuli Selain")

  (help-menu-label "O&hje")
  (about-info "Tekijät ja tietoja sovelluksesta")
  (about-menu-item "Tietoja…")

  ;; open here's new menu item
  (create-new-window-or-clear-current
   "Haluaisitko luoda uuden ikkunan, vai tyhjentää nykyisen?")
  (clear-current "Tyhjennä Nykyinen")
  (new-window "Uusi Ikkuna")

  ;; popup menu when right-clicking in the gap between
  ;; the definitions and interactions window
  (change-to-vertical-alignment "Muuta Pystysuuntaiseksi")
  (change-to-horizontal-alignment "Muuta Sivusuuntaiseksi")

  ;;; exiting and quitting ``are you sure'' dialog
  ;;; exit is used on windows, quit on macos, in English. Other
  ;;; languages probably use the same word on both platforms.
  (exit "Lopeta")
  (quit "Lopeta")
  (are-you-sure-exit "Haluatko varmasti lopettaa?")
  (are-you-sure-quit "Haluatko varmasti lopettaa?")
  ; these next two are only used in the quit/exit dialog
  ; on the button whose semantics is "dismiss this dialog".
  ; they are there to provide more flexibility for translations
  ; in English, they are just cancel.
  (dont-exit "Peruuta")
  (dont-quit "Peruuta")

  ;;; autosaving
  (error-autosaving "Virhe tallentaessa automaattisesti tiedostoa “~a”.") ;; ~a will be a filename
  (autosaving-turned-off "Automaattinen tallennus on pois päältä\nkunnes tiedosto on tallennettu.")
  (recover-autosave-files-frame-title "Palauta Tiedostot")
  (autosave-details "Tiedot")
  (autosave-recover "Palauta")
  (autosave-unknown-filename "<<tuntematon>>")

  ;;; autoloading
  ;; the ~a is replaced with a path
  (autoload-file-changed-on-disk/with-name
   "Tiedosto:\n  ~a\nmuuttui levyllä. Haluatko"
   " palauttaa puskurin sisällön vastaamaan levyn tiedostoa?")
  ;; One file per line is appended to the end of this message
  (autoload-files-changed-on-disk/with-name
   "Jotkin tiedostot ovat muuttuneet levyllä. Haluatko palauttaa niiden"
   " puskureiden sisällöt vastaamaan levyn tiedostoja?\n\nMuuttuneet Tiedostot:")
  ;; the ~a is replaced with a path
  (autoload-file-changed-on-disk-editor-dirty/with-name
   "Tiedosto:\n  ~a\non muuttunut sekä levyllä että editorissa."
   " Haluatko palauttaa puskurin sisällön vastaamaan levyn tiedostoa?")
  ;; One file per line is appended to the end of this message
  (autoload-files-changed-on-disk-editor-dirty/with-name
   "Jotkin tiedostot ovat muuttuneet sekä levyllä että editorissa."
   " Haluatko palauttaa näiden puskureiden sisällön vastaamaan levyn"
   " tiedostoja?\n\nMuuttuneet Tiedostot:")
  ;; One file per line is appended to the end of this message
  (autoload-files-changed-on-disk-editor-dirty&clean/with-name
   "Jotkin tiedostot ovat muuttuneet sekä levyllä että editorissa."
   " Haluatko palauttaa niiden puskureiden sisällöt vastaamaa levyn tiedostojen"
   " sisältöjä?\n\nMuuttuneet tiedostot ( ◇ kertoo editorin version olevan muutettu):")
  ;; a specialized version of dont-ask-again-always-current
  (dont-ask-again-always-current/clean-buffer
   "Älä kysy uudestaan tiedostoilla, joissa ei ole tallentamattomia muutoksia (käytä aina nykyistä valintaa)")

  (autoload-automatically-reload "Lataa Muuttuneet Tiedostot Automaattisesti")
  (autoload-when-the-editor-isnt-dirty "Kun editoria ei ole muutettu")
  (autoload-never-revert "Ei koskaan")
  (autoload-ask-about-reverting "Kysy jokaisella kerralla")

  ;; these are labels in a dialog that drscheme displays
  ;; if you have leftover autosave files. to see the dialog,
  ;; start up drscheme and modify (but don't save) a file
  ;; (also, do this with an unsaved file). Wait for the autosave
  ;; files to appear (typically 5 minutes). Kill DrRacket
  ;; and restart it. You'll see the dialog
  (autosave-autosave-label: "Varmuuskopiotiedosto:")
  (autosave-original-label: "Alkuperäinen tiedosto:")
  (autosave-autosave-label "Varmuuskopiotiedosto")
  (autosave-original-label "Alkuperäinen tiedosto")
  (autosave-compare-files "Vertaa varmuuskopiotiedostoja")

  (autosave-show-autosave "Varatiedosto") ;; title of a window showing the autosave file

  (autosave-explanation "DrRacket löysi varmuuskopiotiedostoja, jotka saattavat sisältää tallentamatonta työtäsi.")

  (autosave-recovered! "Palautettu!") ;; status of an autosave file
  (autosave-deleted "Poistettu")       ;; status of an autosave file

  ;; first is a filename, second is an error message from racket.
  (autosave-error-deleting "Virhe poistaessa tiedostoa ~a\n\n~a")
  (autosave-delete-button "Poista")
  (autosave-delete-title "Poista")  ;; title of a dialog asking for deletion confirmation
  (autosave-done "Tehty")

  ;; appears in the file dialog
  (autosave-restore-to-where? "Valitse varmuuskopioiden tallennuspaikka.")

  ;;; file modified warning
  (file-has-been-modified
   "Tiedostoa on muutettu tallentamisen jälkeen. Ylikirjoita muutokset?")
  (overwrite-file-button-label "Ylikirjoita")

  (definitions-modified
    "Määrittelytekstiä on muokattu tiedostojärjestemlässä;"
    " tallenna tai palauta määrittelyteksti.")

  ;; for a dialog that appears when Run is clicked and there are unsaved files
  ; the ~a is filled with a filename (same string that appears in a tab)
  (one-file-not-saved-do-the-save?
   "Tiedostoa “~a” ei ole tallennettu; Tallenna ennen Suorittamista?")
  ; the string is suffixed with a list of filenames (which are separated by newlines)
  (many-files-not-saved-do-the-save?
   "Joitain muita tiedostoja ei ole tallennettu; Tallennetaanko ne ennen Suorittamista?\n\nTiedostot:")
  ; button label to go ahead with saving
  (save-all-files "Tallenna Kaikki Tiedostot")
  ; check box in the dialog and also used in the preferences dialog
  (save-after-switching-tabs "Tallenna tiedostot ennen välilehden tai ikkunan vaihtamista")
  (dont-ask-about-saving-after-switching-tabs
   "Don't ask and don't save files when clicking Run with unsaved tabs or windows")
  
  (drscheme-internal-error "DrRacketin Sisäinen Virhe")

  ;;; tools
  (invalid-tool-spec
   "Työkalun spesifikaatio kokoelman ~a info.rkt-tiedostossa on epäkelpo."
   " Odotetaan joko merkkijonoa tai ei-tyhjää(non-empty) merkkijonojen listaa, saatiin: ~e")
  (error-invoking-tool-title "Virhe kutsuessa(invoke) työkalua ~s;~s") ; EN&FI
  ;; ~s filled with a path, ~a filled with an error message from an exn
  (error-loading-tool-title "Virhe ladattaessa työkalua ~s\n~a")
  (tool-tool-names-same-length
   "`tool-names' ja `tools' pitäsi olla saman pituisia listoja,"
   " tiedostossa info.rkt  ~s:lle, saatiin ~e ja ~e")
  (tool-tool-icons-same-length
   "`tool-icons' ja `tools' pitäisi olla saman pituisia listoja,"
   " tiedostossa info.rkt ~s:lle, saatiin ~e ja ~e")
  (tool-tool-urls-same-length
   "`tool-urls' ja `tools' pitäisi olla saman pituisia listoja,"
   " tiedostossa info.rkt ~s:lle, saatiin ~e ja ~e")
  (error-getting-info-tool
   "virhe ladattaessa tiedostoa info.rkt ~s:lle")
  (tool-error-phase1 "Virhe vaiheessa 1 työkalulla ~s; ~s")
  (tool-error-phase2 "Virhe vaiheessa 2 työkalulla ~s; ~s")
  ;; tool preferences panel
  (tool-config-changes
   "Muutokset työkalun asetuksiin tulevat voimaan, kun DrRacket käynnistetään seuraavan kerran.")
  (installed-tools "Asennetut työkalut")
  (tool-prefs-panel-tool:-label "Työkalu: ")
  (tool-prefs-panel-title "Työkalut")
  (load-tool-when-drracket-starts? "Lataa työkalu, kun DrRacket käynnistyy?")
  (load-tool-load "Lataa työkalu")
  (load-tool-skip "Ohita työkalu")
  (unnamed-tool "nimetön työkalu ~a")
  (note-that-tool-loaded " (ladattu)")
  (note-that-tool-was-skipped " (ohitettu)")
  (note-that-tool-failed-to-load " (lataus epäonnistui)")

  ;;; define popup menu
  (end-of-buffer-define "<< puskurin loppu >>")
  (sort-by-name "Lajittele nimen mukaan")
  (sort-by-position "Lajittele sijainnin mukaan tiedostossa")
  (no-definitions-found "<< määritelmiä löytynyt >>")
  (jump-to-defn "Siirry ~a:n määritelmään")
  (define-menu-configure "Mukauta(Configure)") ;; FI&EN  ;; label of a submenu to configure the (define ...) popup menu

  (recent-items-sort-by-age "Lajittele Iän mukaan")
  (recent-items-sort-by-name "Lajittele Nimen mukaan")

  ;;; view menu
  (hide-definitions-menu-item-label "Piilota &Määritelmät")
  (show-definitions-menu-item-label "Näytä &Määritelmät")
  (definitions-menu-item-help-string "Näytä/Piilota määrittelyikkuna")
  (show-interactions-menu-item-label "Näytä &Interaktioikkuna")
  (hide-interactions-menu-item-label "Piilota &Interaktiot")
  (use-horizontal-layout "Käytä Vaakasuoraa asettelua")
  (use-vertical-layout "Käytä Pystysuoraa asettelua")
  (interactions-menu-item-help-string "Näytä/Piilota interaktioikkuna")
  (toolbar "Työkalupalkki")
  (toolbar-on-top "Työkalupalkki Ylhäällä")
  (toolbar-on-top-no-label "Työkalupalkki Ylhäällä Pienin Painikkein")
  (toolbar-on-left "Työkalupalkki Vasemmalla")
  (toolbar-on-right "Työkalupalkki Oikealla")
  (toolbar-hidden "Työkalupalkki piilotettuna")

  ;;; file menu
  (save-definitions-as "Tallenna Määritelmät &Nimellä…")
  (save-definitions "Tallenna Määritelmät")
  (print-definitions "Tulosta Määritelmät…")
  (about-drscheme "Tietoa DrRacketista")
  (save-other "Tallenna Muu")
  (save-definitions-as-text "Tallenna Määritelmät Tekstinä…")
  (save-interactions "Tallenna Interaktiot")
  (save-interactions-as "Tallenna Interaktiot Nimellä…")
  (save-interactions-as-text "Tallenna Interaktiot Tekstinä…")
  (print-interactions "Tulosta Interaktiot…")
  (new-tab "Uusi Välilehti")
  (close-tab "Sulje Välilehti") ;; must not have any &s in it.
   ;; like close-tab, but with an ampersand on the same letter as the one in close-menu-item
  (close-tab-amp "&Sulje Välilehti")
  (reopen-closed-tab "Avaa Suljettu Välilehti Uudelleen")
  
  ;;; edit menu
  (split-menu-item-label "&Jaa")
  (collapse-menu-item-label "&Lytistä")
  (find-longest-line "Etsi Pisin Rivi")

  ;;; language menu
  (language-menu-name "&Kieli")

  ;;; scheme-menu
  (scheme-menu-name "Ra&cket")
  (execute-menu-item-label "Suorita")
  (execute-menu-item-help-string "Käynnistä ohjelma uudelleen määrittelyikkunassa")
  (ask-quit-menu-item-label "Pyydä Ohjelmaa Lopettamaan")
  (ask-quit-menu-item-help-string
   "Käyttää break-threadia lopettamaan nykyisen evaluoinnin pääsäikeen")
  (force-quit-menu-item-label "Pakota Ohjelma Lopettamaan")
  (force-quit-menu-item-help-string "Käyttää custodian-shutdown-all keskeyttämään nykyisen evaluoinnin")
  (limit-memory-menu-item-label "Rajoita Muistia…")
  (limit-memory-msg-1 "Tämä raja tulee voimaan, kun ohjelma seuraavan kerran")
  (limit-memory-msg-2 "Suoritetaan, ja sen täytyy olla vähintään kahdeksan megatavua.")
  (limit-memory-unlimited "Rajaton")
  (limit-memory-limited "Rajattu")
  (limit-memory-megabytes "Megatavua")
  ; the next two constants are used together in the limit memory dialog; they are inserted
  ; one after another. The first one is shown in a bold font and the second is not.
  ; (the first can be the empty string)
  (limit-memory-warning-prefix "Varoitus: ")
  (limit-memory-warning
   "rajaton-muistiasetus on turvaton. Tällä asetuksella,"
   " DrRacket ei voi suojata itseään ohjelmilta jotka varaavat liikaa, tällöin DrRacket saattaa kaatua.")

  (clear-error-highlight-menu-item-label "Poista Virheen Korostaminen")
  (clear-error-highlight-item-help-string "Poistaa vaaleanpunaisen virheenkorostuksen")
  (jump-to-next-error-highlight-menu-item-label "Hyppää Seuraavaan Virhekorosteeseen")
  (jump-to-prev-error-highlight-menu-item-label "Hyppää Edelliseen Virhekorosteeseen")
  (reindent-menu-item-label "&Uudelleensisennys")
  (reindent-all-menu-item-label "Uudelleensisennä &Kaikki")
  (semicolon-comment-out-menu-item-label "Kommentoi &Puolipistein")
  (box-comment-out-menu-item-label "Kommentoi &Laatikolla")
  (uncomment-menu-item-label "&Poista kommentti")

  (convert-to-semicolon-comment "Muuta Puolipiste-kommentiksi")

  ;;; executables
  (create-executable-menu-item-label "Luo Ohj&elmatiedosto…")
  (create-executable-title "Luo Ohjelmatiedosto")
  (drracket-creates-executables-only-in-some-languages
   "Ohjelmatiedostoja voi tehdä DrRacketilla vain"
   " kun olet valinnut opetuskielen (DMdA tai HtDP) DrRacketin"
   " kieli-dialogissa, tai kun olet valinnut “The Racket"
   " Language” DrRacketin kieli-dialogissa ja #lang-rivi ohjelman"
   " alussa määrittää kielen.\n\nHarkitse sen sijaan"
   " raco exe -komentorivityökalun käyttämistä.")
  (must-save-before-executable "Sinun täytyy tallentaa ohjelmasi, ennen ohjelmatiedoston luontia.")
  (save-a-mred-launcher "Tallenna GRacket Käynnistin(Launcher)") ;; FI&EN
  (save-a-mzscheme-launcher "Tallenna Racket Käynnistin(Launcher)") ;; FI&EN
  (save-a-mred-stand-alone-executable "Save a GRacket Stand-alone Executable")
  (save-a-mzscheme-stand-alone-executable "Tallenna Racket Irrallinen(Stand-alone) Ohjelmatiedosto") ;; FI&EN
  (save-a-mred-distribution "Tallenna GRacket-jakelu")
  (save-a-mzscheme-distribution "Tallenna Racket-jakelu")
  ;; this is suffixed with an error message ala error-display-handler
  (error-creating-executable "Virhe luotaessa ohjelmatiedostoa:")

  (definitions-not-saved
    "Määrittelyikkunaa ei ole tallennettu. Ohjelmatiedosto käyttää"
    " määrittelyikkunan viimeisintä versiota. Jatka?")
  ;; The "-explanatory-label" variants are the labels used for the radio buttons in
  ;;  the "Create Executable..." dialog for the "(module ...)" language.
  (launcher "Käynnistin(Launcher)") ;; FI&EN
  (launcher-explanatory-label "Käynnistin (vain tälle koneelle, suorittaa lähteestä)")
  (stand-alone "Irrallinen(Stand-alone)") ;; FI&EN
  (stand-alone-explanatory-label "Irrallinen(Stand-alone) (vain tälle koneelle, suorittaa käännetyn kopion)") ;; FI&EN
  (distribution "Jakelu (Distribution)") ;; FI&EN
  (distribution-explanatory-label "Jakelu (toiselle koneelle asennettavaksi)")
  (embed-dlls? "Upota(Embed) DLLt ohjelmatiedostoon?") ;; appears in the GUI only under windows
  (executable-type "Tyyppi")
  (executable-base "Perusta(Base)") ;; FI&EN
  (filename "Tiedostonimi: ")
  (create "Luo")
  (files-for-icons-etc "Tiedostot ikoneille, jne.")
  (please-specify-a-filename "Määritä luotava tiedostonimi.")
  (~a-must-end-with-~a
   "Tiedostonimi ~a \n\n  ~a\n\non laiton. Tiedostonimen lopun tulee olla “.~a”.")
  (macosx-executables-must-end-with-app
   "Tiedostonimi\n\n  ~a\n\non laiton. Mac OS:ssa, ohjelmatiedoston"
   " tulee olla hakemisto, jonka nimen loppuosa on .app.")
  (warning-directory-will-be-replaced
   "VAROITUS: hakemisto:\n\n  ~a\n\nkorvataan. Jatketaanko?")

  (distribution-progress-window-title "Jakelun Eteneminen")
  (creating-executable-progress-status "Luodaan ohjelmatiedostoa jakelulle…")
  (assembling-distribution-files-progress-status "Kasataan tiedostoja jakelulle…")
  (packing-distribution-progress-status "Pakataan jakelua…")

  (create-servlet "Luo Servlet…")

  ; the ~a is a language such as "module" or "algol60"
  (create-servlet-unsupported-language
   "Luo Servlet ei toimi kielen ~a kanssa.")

  ;;; buttons
  (execute-button-label "Suorita")
  (save-button-label "Tallenna")
  (break-button-label "Pysäytä")
  (break-button-kill-label "Lopeta(Kill)") ;; FI&EN

  ;;; search help desk popup menu
  (search-help-desk-for "Etsi Tukipalvelusta asiaa: “~a”")
  (exact-lucky-search-help-desk-for "Tarkka onnekashaku (exact lucky search) Tukipalvelusta asialle “~a”") ;; FI&EN

  ;; collapse and expand popup menu items
  (collapse-sexp "Pienennä S-lauseke")
  (expand-sexp "Laajenna S-lauseke")

  ;;; fraction dialog
  (enter-fraction "Syötä Murtoluku")
  (whole-part "Kokonaisosa")
  (numerator "Osoittaja")
  (denominator "Nimittäjä")
  (insert-number/bad-whole-part "Luvun kokonaisosan tulee olla kokonaisluku")
  (insert-number/bad-numerator
   "Osoittajan tulee olla ei-negatiivinen kokonaisluku")
  (insert-number/bad-denominator
   "Nimittäjän tulee olla positiivinen kokonaisluku")
  (insert-fraction-menu-item-label "Lisää Murtoluku…")

  ;; number snip popup menu
  (show-decimal-expansion "Näytä desimaalina")
  (show-mixed-fraction-view "Näytä sekalukuna")
  (show-improper-fraction-view "Näytä murtolukuna (improper fraction)") ;; FI&EN
  (show-more-decimal-places "Näytä lisää desimaleja")

  ;;; Teachpack messages
  (select-a-teachpack "Valitse opetuspaketti")
  (clear-teachpack "Tyhjennä opetuspaketti ~a")
  (teachpack-error-label "DrRacket - Opetuspakettivirhe")
  (teachpack-didnt-load "Opetuspakettitiedostoa ~a ei ladattu kunnolla.")
  (add-teachpack-menu-item-label "Lisää Opetuspaketti…")
  (clear-all-teachpacks-menu-item-label "Tyhjennä Kaikki Opetuspaketit")
  (drscheme-teachpack-message-title "DrRacket Opetuspaketti")
  (already-added-teachpack "Opetuspaketti ~a on jo lisätty")

  ; ~a is filled with the teachpack's name; the message appears in the
  ; teachpack selection dialog when a user installs a new teachpack
  (compiling-teachpack "Käännetään opetuspakettia ~a…")
  (teachpack-pre-installed "Valmiiksi asennetut Opetuspaketit")
  (teachpack-pre-installed/htdp "Valmiiksi asennetut HtDP Opetuspaketit")
  (teachpack-pre-installed/2htdp "Valmiiksi asennetut HtDP/2e Opetuspaketit")
  (teachpack-user-installed "Käyttäjän asentamat(User-installed) Opetuspaketit") ;; FI&EN
  (add-teachpack-to-list... "Lisää Opetuspaketti listaan…")
  ; first and second ~a are teachpack names, third is a symbol identifing an export
  (teachpack-conflict
   "VAROITUS: jo asennettu opetuspaketti ~a on ristiriidassa paketin ~a kanssa (export ~a on molemmissa)")
  ;; a button label; the two ~a are filled with teachpack names
  (remove-and-add-teachpack "Poista ~a ja lisää ~a")
  (teachpack-already-installed
   "Opetuspaketti nimellä '~a' on jo asennettu. Ylikirjoitetaanko se?")
  ; ~a is filled with a list of language names. Each name is separated
  ; by a newline and is indented two spaces (no commas, no 'and')
  (teachpacks-only-in-languages
   "Opetuspaketti-valikko on saatavilla vain näillä kielillä: ~a\n\nMuilla"
   " kielillä, käytä 'require'a sen sijaan.")


  ;;; Language dialog
  (introduction-to-language-dialog
   "Valitse kieli. Useimmilla alkeiskursseilla oppilaiden tulisi käyttää oletuskieltä.")
  (language-dialog-title "Valitse Kieli")
  (case-sensitive-label "Aakkoslajit erottava(Case sensitive)") ;; FI&EN
  (output-style-label "Tulosteen (Output) Tyyli") ;; FI&EN
  (constructor-printing-style "Konstruktori")
  (quasiquote-printing-style "Peruuntuva lainaus(Quasiquote)") ;; FI&EN
  (write-printing-style "kirjoita")
  (print-printing-style "tulosta")
  (true-false-empty-style-label "Vakio(Constant) Tyyli") ;; FI&EN
  (true-false-empty-style-read "#true #false '()")
  (true-false-empty-style-ids "true false empty")
  (sharing-printing-label "Näytä jakaminen arvoissa (Show sharing in values)") ;; FI&EN
  (use-pretty-printer-label "Lisää rivinvaihto tulostettuihin arvoihin")
  (input-syntax "Syötteen Syntaksi")
  (dynamic-properties "Dynaamiset Ominaisuudet")
  (output-syntax "Tulosteen(Output) Syntaksi") ;; FI&EN
  (teachpacks "Opetuspaketit") ;; label in the language dialog for the teaching languages
  (teachpacks-none "<< Ei yhtään >>") ;; shows up under the previous string, when there are no teachpacks
  (no-debugging-or-profiling "Ei debuggausta tai profilointia")
  (debugging "Debuggaus")
  (debugging-and-profiling "Debuggaus ja profilointi")
  (test-coverage "Syntaktisen testijoukon kattavuus(Syntactic testu suite coverage)") ;; FI&EN
  (show-details-button-label "Näytä Tiedot")
  (hide-details-button-label "Piilota Tiedot")
  (choose-language-menu-item-label "Valitse Kieli…")
  (revert-to-language-defaults "Palauta Kielen Oletusasetuksiin")
  (fraction-style "Murtolukutyyli")
  (use-mixed-fractions "Sekalukuina")
  (use-repeating-decimals "Toistuvina desimaaleina")
  (decimal-notation-for-rationals "Käytä desimaalinotaatiota rationaaliluvuille")
  (enforce-primitives-group-box-label "Alustavat(Initial) Sidonnat (Bindings)") ;; FI&EN
  (enforce-primitives-check-box-label "Kiellä alustavien sidontojen uudelleenmäärittely")
  (automatically-compile "Populoi “compiled” hakemistot (nopeampaa latausta varten)")
  (preserve-stacktrace-information "Säilytä stacktrace (poista joitain optimointeja)")
  (enforce-module-constants-checkbox-label "Valvo(enforce) vakioiden määrittelemistä (enables some inlining)") ;; FI&EN
  (expression-level-stacktrace "Lauseke-tason stacktrace")
  (function-level-stacktrace "Funktio-tason stacktrace")
  (submodules-to-run "Suoritettava Alimoduulit")
  (add-submodule "Lisää Alimoduuli vaihtoehto…") ;; menu item
  (add-submodule-title "Lisää Alimoduuli") ;; title of dialog opened by above menu item


  ; used in the bottom left of the drscheme frame
  ; used the popup menu from the just above; greyed out and only
  ; visible when some languages are in the history
  (recent-languages "Viimeisimmät kielet")
  ; shows up in bottom-left programming language menu popup, when no langs are recorded
  (no-recently-chosen-languages "ei viimeisimpiä valittuja kieliä")

  ;; startup wizard screen language selection section
  (please-select-a-language "Valitse kieli")


  ;;; languages
  (beginning-one-line-summary "define, cond, tietueet, vakiot, and primitiivit")
  (beginning/abbrev-one-line-summary "Beginner, lista-tyylinen tulostus REPLissa")
  (intermediate-one-line-summary "Beginner plus leksikaalinen näkyvyys(scope)") ;; FI&EN
  (intermediate/lambda-one-line-summary "Intermediate plus higher-order -funktiot")
  (advanced-one-line-summary "Intermediate plus lambda ja mutaatio")
  (pretty-big-scheme "Pretty Big")
  (pretty-big-scheme-one-line-summary
   "Lisää syntaksin ja funktiot kielistä: HtDP, mzscheme, ja mred/mred")
  (r5rs-language-name "R5RS")
  (r5rs-one-line-summary "R5RS, with no frills")
  (expander "Expander")
  (expander-one-line-summary "Expands, rather than evaluates, expressions")
  (legacy-languages "Legacy Kielet")
  (teaching-languages "Opetuskielet")
  (experimental-languages "Kokeelliset Kielet")
  (initial-language-category "Initial language")
  (no-language-chosen "Kieltä ei ole valittu")
  (other-languages "Muut Kielet")

  (module-language-name "Päättele kieli lähteen perusteella")
  (module-language-one-line-summary "#lang-rivi määrittää varsinaisen kielen")
   ;; shows up in the details section of the module language
  (module-language-auto-text "Automaattinen #lang rivi")
  (module-language-auto-text-most-recent "Viimeisin #lang rivi")
  ; to the right of this string is a text entry field whose content is the #lang line that'll be used.
  (module-language-auto-text-always-same "Käytä aina samaa #lang riviä:")
  ;; the next four string constants show up in the REPL in DrRacket in the "Racket Language",
  ;; which is also the "Determine language from source" language. They are put right after the name
  ;; of the language from the "#lang" line at the beginning of the source file
  (module-language-repl-no-annotations "")
  (module-language-repl-debug-annotations ", debuggauksella")
  (module-language-repl-debug/profile-annotations ", debuggauksella ja profiloinnilla")
  (module-language-repl-test-annotations ", testikattavuudella/testikattavuuden kanssa")

  (module-language-#lang-error-more-information "Lisätietoa")
  (module-language-#lang-flush-cache "Lataa uudelleen")
  (module-language-#lang-flush-cache-menu-item "Lataa #lang Lisäosat(Extensions)") ;; FI&EN

  ;; for the upper portion of the language dialog
  (the-racket-language "The Racket Language")
  (choose-a-language "Valitse kieli")

  ;; the next two string constants appear in the
  ;; language dialog with a list
  ;; of example languages appearing between them
  (racket-language-discussion
   "Aloita ohjelmasi #lang rivillä määrittääksesi haluamasi murteen(dialect). Esimerkiksi:\n\n") ;; FI&EN
  (racket-language-discussion-end "\n… Ja paljon muita")

  ;; the next three string constants are put into a message-box dialog
  ;; that appears when the user clicks on the example #lang languages
  ;; in the language dialog. The first one always appears and then either
  ;; the second or the third appears. The second one has the clicked
  ;; on #lang line placed into the ~a, and third one has the
  ;; current #lang line in the first ~a and the clicked on in the second one.
  ;; The two comments are separated by a blank line.
  (racket-dialect-in-buffer-message
   "Racketin murre valitaan yleensä muokkaamalla puskuria suoraan,"
   " eikä valitsemalla tästä kielivalikosta.")
  (racket-dialect-add-new-#lang-line
   "Sen sanottuani, lisäänkö tekstin “~a” määrittelyikkunan alkuun?")
  (racket-dialect-replace-#lang-line
   "Sen sanottuani, huomaan sinulla olevan “~a” tiedostossasi; korvaanko sen tekstillä “~a”?")
  (racket-dialect-already-same-#lang-line
   "Huomaan sinulla olevan “~a” tiedostossasi, kuitenkin;"
   " joten sinun pitäisi olla valmis aloittamaan ohjelmointi!")

  ;; in the dialog containing the above strings, one of these is a button that appears
  (add-#lang-line "Lisää #lang rivi")
  (replace-#lang-line "Korvaa #lang rivi")

  ;; for the 'new drracket user' dialog
  (use-language-in-source "Käytä lähteessä määritettyä kieltä")

  ;;; from the `not a language language' used initially in drscheme.
  (must-choose-language "DrRacket ei voi käsitellä ohjelmia ennen ohjelmointikielen valitsemista.")

  ; next two appear before and after the name of a text book (which will be in italics)
  (using-a-textbook-before "Käyttäen oppikirjaa ")
  (using-a-textbook-after "?")

  ; next two are before and after a language
  (start-with-before "Aloita kielellä")
  (start-with-after "")

  (seasoned-plt-schemer? "Kokenut PLT Schemer?")
  (racketeer? "Oletko Racketeer?")
  (looking-for-standard-scheme? "Etsitkö standard Schemea?")

  ; the three string constants are concatenated together and the middle
  ; one is hyperlinked to the dialog that suggests various languages
  (get-guidance-before "Valitse joko “Valitse kieli…” kohta “Kieli”-valikosta, tai ")
  (get-guidance-during "hanki ohjeistusta")
  (get-guidance-after ".")

  ;;; debug language
  (unknown-debug-frame "[tuntematon]")
  (backtrace-window-title "Backtrace - DrRacket")
  (files-interactions "~a:n määrittelyt") ;; filled with a filename
  (current-interactions "interaktiot")
  (current-definitions "määrittelyt")
  (mzscheme-w/debug "Tekstuaalinen (MzScheme, includes R5RS)")
  (mzscheme-one-line-summary "PLTn toteutus Scheme")
  (mred-w/debug "Graafinen (MrEd, sisältää MzScheme)")
  (mred-one-line-summary "Lisää GUI tuen MzSchemeen")

  ;; profiling
  (profiling-low-color "Matala")
  (profiling-high-color "Paljon")
  (profiling-choose-low-color "Valitse matala väri")
  (profiling-choose-high-color "Valitse paljon väri")
  (profiling "Profilointi(Profiling)") ;; FI&EN
  (profiling-example-text "(define (whee) (whee))")
  (profiling-color-config "Profiloinnin värivalikoima")
  (profiling-scale "Profiloinnin väriskaala")
  (profiling-sqrt "Neliöjuuri")
  (profiling-linear "Lineaarinen")
  (profiling-square "Neliö")
  (profiling-number "Kutsujen määrä")
  (profiling-time "Kumulatiinen/Kertynyt aika")
  (profiling-update "Päivitä Profiili")
  (profiling-col-percent-time "% Aika")
  (profiling-col-function "Funktio")
  (profiling-col-time-in-msec "ms")
  (profiling-col-calls "Kutsut")
  (profiling-show-profile "Näytä Profiili")
  (profiling-hide-profile "Piilota Profiili")
  (profiling-unknown-src "<< tuntematon >>")
  (profiling-no-information-available
   " Profilointitietoa ei ole saatavilla. Varmista, että"
   " profilointi on päällä kielessäsi ja olet suorittanut ohjelman.")
  (profiling-clear?
   "Määritelmien muuttaminen määrittelyikkunassa mitätöi profilointitiedot. Jatketaanko?")

  ;; test coverage
  (test-coverage-clear?
   "Määrittelyikkunan muuttaminen mitätöi tiedot testikattavuudesta. Jatketaanko?")
  (test-coverage-clear-and-do-not-ask-again "Kyllä, älä kysy uudestaan")
  (test-coverage-ask? "Kysy testikattavuuden tyhjentämisestä(clearing)") ;; FI&EN
  (test-coverage-entirely-covered "Kaikki lausekkeet on katettu")
  (test-coverage-next-time-check-box "Näytä seuraavalla kerralla?")
  (test-coverage-summary "Näytä testikattavuuden tulosten yhteenveto")

  (test-coverage-on "Testiä katettu")
  (test-coverage-off "Testit eivät kattaneet")

  ;; tracing
  (tracing-enable-tracing "Aktivoi Jäljitys(Tracing)") ;; FI&EN
  (tracing-show-tracing-window "Näytä Jäljitys")
  (tracing-hide-tracing-window "Piilota Jäljitys")
  (tracing-tracing-nothing-to-show
   "Jäljitys tuloksia ei saatavilla, vielä. (varmista, että kielesi"
   " tukee jäljitystä ja että jäljitys on päällä.)")

  ;;; repl stuff
  (evaluation-terminated "Evaluointi päättyi")
  (evaluation-terminated-explanation
   "Evaluointi-säie ei ole enää käynnissä, joten"
   " evaluointia ei voi tapahtua ennen seuraavaa suorituskertaa.")

  ; The next three constants show up in the same dialog as the above evaluation-terminated string
  ; constants.
  ; The first two show up only when the user calls 'exit' (possibly with a status code).
  ; The third shows up when the program runs out of memory.
  (exited-successfully "Exited successfully.")
  ;; ~a is filled in with a number between 1 and 255
  (exited-with-error-code "Lopetettiin virhekoodilla ~a.")
  (program-ran-out-of-memory "Ohjelmalta loppui muisti kesken.")

  (show-evaluation-terminated-dialog "Näytä ‘evaluointi päättyi’ valikko")
  (evaluation-terminated-ask "Näytä tämä valikko ensi kerralla")

  (last-stack-frame "näytä viimeisin stack frame") ;; FI&EN
  (last-stack-frames "näytä viimeisimmät ~a stack framea") ;; FI&EN
  (next-stack-frames "näytä seuraavat ~a stack framea")  ;; FI&EN
  (more-stack-frames "näytä lisää stack frameja")  ;; FI&EN

  ;;; welcoming message in repl
  (language "Kieli")
  (custom "mukautetti")
  (teachpack "Opetuspaketti")
  (welcome-to "Tervetuloa pakettiin(?)")
  (version "versio")
  ;; The following is shown on 2nd line of welcome message in repl.
  ;; It is concatenated at end of: "language": LANGUAGE "; memory limit:" LIMIT
  ;; therefore you get to decide punctuation for your language here
  (memory-limit "; muistin yläraja:")

  ;;; kill evaluation dialog
  (kill-evaluation? "Haluatko lopettaa evaluoinnin?")
  (just-break "Ainoastaan Pysäytä")
  (kill "Lopeta")
  (kill? "Lopeta")

  ;;; version checker
  (version:update-menu-item   "Tarkista päivitykset…")
  (version:update-check       "Päivitysten tarkastus") ; dialog title, with the next line
  (version:connecting-server  "Yhdistetään Racket-versio serverille")
  (version:results-title      "Racket-version tarkastus")
  (version:do-periodic-checks "Tarkasta ajoittain uuden Racket-version olemassaolo")
  (version:take-me-there      "Vie Minut Sinne") ; ...to the download website
  ;; the next one can appear alone, or followed by a comma and the one after that
  (version:plt-up-to-date     "Racket-versiosi on ajantasalla")
  (version:but-newer-alpha    "mutta huomaa, että siitä on uudempi alpha-julkaisu")
  ;; This is used in this context: "Racket vNNN <<<*>>> http://download..."
  (version:now-available-at   "on nyt saatavilla osoitteessa")

  ;; insert menu
  (insert-menu "&Lisää")

  ;; large semi colon letters
  (insert-large-letters... "Lisää Suuria Kirjaimia…")
  (large-semicolon-letters "Isoja Puolipiste-merkkejä")
  (text-to-insert "Lisättävä teksti")

  (module-browser-filename-format "Koko tiedostonimi: ~a (~a riviä)")
  (module-browser-root-filename "Root tiedostonimi: ~a")
  (module-browser-font-size-gauge-label "Fontin Koko")
  (module-browser-progress-label "Moduuliselaimen Edistyminen")
  (module-browser-adding-file "Lisätään tiedostoa: ~a…")
  (module-browser-laying-out-graph-label "Sommitellaan(Laying out) graafia") ;; FI&EN
  (module-browser-open-file-format "Avaa ~a")
  (module-browser "Moduuliselain") ;; frame title
  (module-browser... "&Moduulien selain…") ;; menu item title
  (module-browser-in-file "M&oduulien Selain tiedostolla ~a") ;; menu item title; ~a is filled with a filename
  ;; menu item title for above menu item; used when there is no saved file
  (module-browser-no-file "Moduuliselain Tässä Tallennetussa Tiedostossa")
  (module-browser-error-expanding "Virhe laajennettaessa ohjelmaa:\n\n~a")
  (module-browser-show-lib-paths "Näytä (lib ..) polkujen lataamat tiedostot")
  (module-browser-progress "Moduulin Selain: ~a") ;; prefix in the status line
  (module-browser-compiling-defns "Moduulin Selain: käännetään määrittelyitä")
  ;; check box label in show module browser pane in drscheme window.
  (module-browser-show-lib-paths/short "Seuraa lib vaatii")
  ;; check box label in show module browser pane in drscheme window.
  (module-browser-show-planet-paths/short "Seuraa(Follow) PLaneT requires") ;; FI&EN
  (module-browser-refresh "Päivitä") ;; button label in show module browser pane in drscheme window.
  ;; used to search in the graph; the label on a text-field% object
  (module-browser-highlight "Korosta")
  (module-browser-only-in-plt-and-module-langs
   "Moduuliselain on saatavilla vain moduulipohjaisille ohjelmille.")
  (module-browser-name-length "Nimen Pituus")
  (module-browser-name-short "Lyhyt")
  (module-browser-name-medium "Keskipitkä")
  (module-browser-name-long "Pitkä")
    ;; like 'Long' but shows the phases where this file is loaded
  (module-browser-name-very-long "Pitkä, vaihein (with phases)") ;; FI&EN
  (module-browser-open-all "Avaa kaikki tässä näytetyt tiedostot")
  (module-browser-main-collects "Main Collects")
  (module-browser-unknown-pkg "Tuntematon Paketti")
  (module-browser-visible-pkgs "Näkyvät Paketit")

  (happy-birthday-matthias "Hyvää Syntymäpäivää, Matthias!")
  (happy-birthday-matthew "Hyvää Syntymäpäivää, Matthew!")
  (happy-birthday-shriram "Hyvää Syntymäpäivää, Shriram!")

  (xml-tool-insert-xml-box "Lisää XML Laatikko")
  (xml-tool-insert-scheme-box "Lisää Racket Laatikko")
  (xml-tool-insert-scheme-splice-box "Lisää Racket Splice Laatikko")
  (xml-tool-xml-box "XML laatikko")
  (xml-tool-scheme-box "Racket Laatikko")
  (xml-tool-scheme-splice-box "Racket Splice Laatikko")
  (xml-tool-switch-to-scheme "Vaihda to Racket Laatikkoon")
  (xml-tool-switch-to-scheme-splice "Vaihda Racket splice laatikkoon")
  (xml-tool-eliminate-whitespace-in-empty-tags
   "Poista tyhjätila tyhjistä tageista")
  (xml-tool-leave-whitespace-alone
   "Älä käsittele tyhjää tilaa")

  (show-recent-items-window-menu-item "Näytä Viimeksi Avatut Tiedostot Erillisessä Ikkunassa")
  (show-recent-items-window-label "Viimeksi Avatut Tiedostot")
  (number-of-open-recent-items "Viimeisimpien lukumäärä")
  (switch-anyway "Vaihda Tiedostoa siitä huolimatta")

  (stepper-program-has-changed "VAROITUS: Ohjelma on muuttunut.")
  (stepper-program-window-closed "VAROITUS: Ohjelmaikkuna on kadonnut.")

  (stepper-name "Askeltaja")
  (stepper-language-level-message "Askeltaja ei toimi kielellä “~a”.")
  (stepper-button-label "Askella")

  (stepper-previous "Askella")
  (stepper-next "Askella")
  (stepper-jump "Hyppää…")
  (stepper-jump-to-beginning "alkuun")
  (stepper-jump-to-end "lopppuun")
  (stepper-jump-to-selected "valinnan alkuun")
  (stepper-jump-to-previous-application "edelliseen applikointiaskeleeseen")
  (stepper-jump-to-next-application "seuraavaan applikointiasekeleeseen")
  (stepper-out-of-steps
   "Saavuttiin evaluoinnin loppuun, ennen etsimäsi askeleen löytämistä.")
  (stepper-no-such-step/title "Askelta ei löytynyt")
  (stepper-no-such-step "Ei löydetty kriteereitä vastaavaa askelta.")
  (stepper-no-such-step/earlier "Ei löydetty aiempaa askelta, joka vastaisi kriteereitä.")

  (stepper-no-earlier-application-step "Ei aiempia applikointiaskeleita.")
  (stepper-no-later-application-step "Ei enempää applikointiaskeleita.")
  (stepper-complete "Kaikki määritelmät on evaluoitu onnistuneesti.")

  (stepper-no-earlier-step "Ei aiempia askeleita.")
  (stepper-no-later-step "Ei enempää askeleita.")

  (stepper-no-selected-step "Askeleita ei otettu korostetulla alueella. Ehkä se on kommentoitu pois?")

  (stepper-no-last-step "Viimeistä askelta ei ole vielä saatavilla.")

  (debug-tool-button-name "Debuggaa")

  (dialog-back "Taaksepäin")

  ;; warnings about closing a drscheme frame when the program
  ;; might still be doing something interesting
  (program-is-still-running "Määrittelyikkunan ohjelma on vielä käynnissä. Suljetaanko kuitenkin?")
  (program-has-open-windows
   "Määrittelyikkunan ohjelmalla on avoimia ikkunoita. Sulje tämä ikkuna siitä huolimatta?")

  ;; ml-command-line-arguments is for the command line arguments
  ;; label in the module language details in the language dialog.
  (ml-command-line-arguments "Komentoriviargumentit merkkijonovektorina, in read syntax") ;; FI&EN

  ;; ml-cp names are all for the module language collection path
  ;; configuration. See the details portion of the language dialog
  ;; for the module language (at the bottom).
  (ml-cp-default-collection-path "<<oletus collection polut>>")

  ;; in std get-directory
  (ml-cp-choose-a-collection-path "Valitse collection-polku")

  ;; err msg when adding default twice
  (ml-cp-default-already-present
   "Oletus collection polut ovat jo asetettu(present)") ;; FI&EN

  ;; title of this section of the dialog (possibly the word
  ;; `Collection' should not be translated)
  (ml-cp-collection-paths "Collection Polut")

  ;; button labels
  ;;  The package manager uses these, too
  (ml-cp-add "Lisää")
  (ml-cp-add-default "Lisää Oletus")
  (ml-cp-remove "Poista")
  (ml-cp-raise "Kasvata")
  (ml-cp-lower "Pienennä")

  (ml-always-show-#lang-line "Näytä aina #lang rivi Module kielessä")  ;; FI&EN

  ;; Profj
  (profj-java "Java")
  (profj-java-mode "Java moodi")
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

  (profj-java-mode-color-heading "Muokkaa Värejä") ; Heading for preference to choose editing colors
  (profj-java-mode-color-keyword "avainsana")
  (profj-java-mode-color-string "merkkijono")
  (profj-java-mode-color-literal "literaali")
  (profj-java-mode-color-comment "kommentti")
  (profj-java-mode-color-error "virhe")
  (profj-java-mode-color-identifier "tunniste")
  (profj-java-mode-color-prim-type "primitiivityyppi") ; Example text for built-in Java types
  (profj-java-mode-color-default "oletus")

  (profj-coverage-color-heading "Kattavuuden Värit") ; Heading for preference to choose coverage colors
  (profj-coverage-color-covered "katetut lausekkeet")

  ; Heading for preferences controlling printing
  (profj-language-config-display-preferences "Näytä Asetukset")
  (profj-language-config-display-style "Näytä tyyli")
  (profj-language-config-display-field "Luokka + Kentät")
  (profj-language-config-class "Luokka")
  (profj-language-config-display-array "Tulosta taulukoidden koko sisältö?")
  ; Heading for preferences controlling test behavior
  (profj-language-config-testing-preferences "Testauksen Asetukset")
  ; Run should be the word found on the Run button
  ;(profj-language-config-testing-enable "Näytä Suorituksen testitulokset??")
  (profj-language-config-testing-coverage "Kerää kattavuustietoja testeistä?")
  (profj-language-config-support-test-language "Tue test Language lisäosaa?")
  (profj-language-config-testing-check "Salli check-lauseke?") ; check should not be translated
  (profj-language-config-classpath "Luokkapolku(Classpath)") ;; FI&EN
  (profj-language-config-choose-classpath-directory "Valitse hakemisto, joka lisätään luokkapolkuun")
  ; Button label to print the current classpath
  (profj-language-config-classpath-display "Näytä nykyinen")

  (profj-test-name-close-to-example "Luokan ~a nimi sisältää Examplen kaltaisen fraasin.") ;;  FI&EN
  (profj-test-name-example-miscapitalized "Luokan ~a nimi sisältää  contains a miscapitalized example.")

  ;; Close testing window and do not run test cases any more
  ;(profj-test-results-close-and-disable "Close and Disable Testing")
  ;; Hide docked testing window and do not run test cases any more
  ;(profj-test-results-hide-and-disable "Hide and Disable Testing")
  ;Renamed below
  ;(profj-test-results-window-title "Test Results")

  (profj-unsupported "Ei tuettu")
  (profj-executables-unsupported "Pahoittelut - ohjelmatiedostoja ei tueta Javalle tällä hetkellä")

  (profj-convert-to-text-comment "Muuta tekstikommentiksi")
  (profj-convert-to-comment "Muuta kommentiksi")

  (profj-executing-main "suoritetaan main-metodia")

  (profj-insert-java-comment-box "Lisää Java-Kommenttilaatikko")
  (profj-insert-java-interactions-box "Lisää Java-Interaktiolaatikko")

  ;;The Test engine tool
  ;;
  (test-engine-window-title "Testin Tulokset")
  ;;Following two appear in View menu, attach and free test report window from DrRacket frame
  (test-engine-dock-report "Telakoi Testiraportti")
  (test-engine-undock-report "Irroita Testiraportti")
  ;;Following two appear in Racket (Java, etc) menu, cause Tests to be Run automatically or not
  (test-engine-enable-tests "Testit Päälle")
  (test-engine-disable-tests "Testit Pois Päältä")
  (test-engine-enable-disable-tests-only-in-teaching-languages
   "Testit Päälle/Pois Päältä -valikkoa käytetään vain HtDP"
   " ja DMdA kielien testaustoiminnallisuudessa. Katso “Näytä Tiedot” osio"
   " language dialog for controlling the submodules that are run in The Racket Language.")  ;; FI&EN

  (test-engine-ran-1-test "Suoritin yhden testin.")
  (test-engine-ran-1-check "Suoritin yhden tarkastuksen(check).") ;; FI&EN
  ;; ditto, only plural
  (test-engine-ran-n-tests "Suoritin ~a testiä.")
  (test-engine-ran-n-checks "Suoritin ~a tarkastusta.")
  (test-engine-1-test-passed "Testi meni läpi!")
  (test-engine-1-check-passed "Tarkastus meni läpi!")
  (test-engine-both-tests-passed "Molemmat testit meni läpi!")
  (test-engine-both-checks-passed "Molemmat tarkastukset meni läpi!")
  (test-engine-all-tests-passed "Kaikki testit meni läpi!")
  (test-engine-all-checks-passed "Kaikki tarkastukset meni läpi!")
  (test-engine-all-n-tests-passed "Kaikki ~a testiä meni läpi!")
  (test-engine-all-n-checks-passed "Kaikki ~a tarkastusta meni läpi!")
  (test-engine-0-tests-passed "0 testiä meni läpi.")
  (test-engine-0-checks-passed "0 tarkastusta meni läpi.")
  (test-engine-m-of-n-tests-failed "~a / ~a testiä epäonnistui.")
  (test-engine-m-of-n-checks-failed "~a / ~a tarkastusta epäonnistui.")
  (test-engine-must-be-tested "Tämä ohjelma tulee testata!")
  (test-engine-is-unchecked "Tässö ohjelmassa ei ole tarkastuksia!")
  (test-engine-tests-disabled "Testit ovat pois päältä.")
  (test-engine-should-be-tested "Tämä ohjelma tulisi testata.")
  (test-engine-at-line-column "rivillä ~a, sarakkeessa ~a")
  (test-engine-in-at-line-column "in ~a, rivi ~a, sarake ~a")
  ; as in "column (unknown)"
  (test-engine-unknown "(tuntematon)")
  (test-engine-trace-error "Trace virhe") ;; FI&EN

  ; The ~F is special marker for the offending values, which may be
  ; printed specially in DrRacket.
  (test-engine-check-encountered-error
   "check-expect kohtasi seuraavan virheen odotetun arvon sijaan, ~F. ~n   :: ~a")
  (test-engine-check-error-cause
   "lausekkeen aiheuttama")
  (test-engine-actual-value-differs-error
   "Todellinen arvo ~F eroaa odotetusta arvosta ~F.")
  ;; need to translate only one of these next two
  ;; (test-engine-actual-value-not-within-error or
  ;;  test-engine-actual-value-not-within-error/alt-word-order)
  ;; if both are present, test-engine-actual-value-not-within-error is used
  (test-engine-actual-value-not-within-error
   "Todellinen arvo ~F ei ole ~v sisällä odotetusta arvosta ~F.") ;; FI&EN
  (test-engine-actual-value-not-within-error/alt-order
   "Todellinen arvo ~F ei ole riittävän lähellä odotettua arvoa ~F; tulisi olla enintään ~v päässä.") ;; FI&EN
  (test-engine-encountered-error-error
   "check-error kohtasi seuraavan virheen odotetun sijaan ~a~n   :: ~a") ;; FI&EN
  (test-engine-expected-error-error
   "check-error odotti seuraavaa virhettä, sensijaan saatiin arvo ~F.~n ~a")
  (test-engine-expected-an-error-error
   "check-error odotti virhettä, mutta sai sen sijaan arvon ~F.")
  ;; members are appended to the message
  (test-engine-not-mem-error "Todellinen arvo ~F eroaa kaikista jäsenistä, jotka kuuluvat joukkoon ")
  (test-engine-not-range-error "Todellinen arvo ~F ei ole suljetulla välillä ~F and ~F.")

  ;; followed by list of variable bindings
  (test-engine-property-fail-error "Ominaisuus on falsioitavissa sidoksin ")
  (test-engine-property-error-error "check-property kohtasi seuraavan virheen~n:: ~a")

  (signature-enable-checks "Signature Checks Päälle")  ;; FI&EN
  (signature-disable-checks "Signature Checks Pois Päältä")  ;;FI&EN

  ; section header
  (test-engine-check-failures "Check häiriöt(failures):") ;; FI&EN
  ; section header
  (test-engine-signature-violations "Allekirjoitus(Signature) :")

  ; part of one phrase "signature <at line ...> to blame: function <...>
  (test-engine-signature "allekirjoitus")
  (test-engine-to-blame "syytetty: funktio")

  (test-engine-no-signature-violations "Ei allekirjoituksen rikkomisia.")
  (test-engine-1-signature-violation "1 allekirjoituksen rikkomus.")
  (test-engine-n-signature-violations "~a allekirjoituksen rikkomusta.")

  ; as in got <value>, signature <at ...>
  (test-engine-got "saatiin ")

  (profjWizward-insert-java-class "Lisää Java-luokka")
  (profjWizard-insert-java-union "Lisää Java-Yhdistelmä(Union)") ;; FI&EN

  ;; The Test Suite Tool
  ;; Errors
  (test-case-empty-error "Tyhjä testitapaus")
  (test-case-too-many-expressions-error "Liian monta lauseketta testitapauksessa.")
  ;; DrRacket window menu items
  (test-case-insert "Lisää Testitapaus")
  (test-case-disable-all "Kaikki Testitapaukset pois päältä")
  (test-case-enable-all "Kaikki Testitapaukset päälle")

  ;; NOTE: The following string constants are labels of the test-case fields. The width
  ;;       of the field is determined by the length of the longest of the following three words.
  ;;       if the words are too long the test case will take up too much horizontal room and
  ;;       not look very good.
  ;; This string is the label of the expression that is being tested in a test case.
  (test-case-to-test "Testi")
  ;; This string is the label of the expression that is the expected value of the to-test expression.
  (test-case-expected "Pitäisi olla")
  ;; This string is the label of the actual result of the to test expression.
  (test-case-actual "Todellinen")
  (test-case-predicate "Predikaatti")
  (test-case-should-raise "Should Raise") ;; FI&EN
  ;; The label of a field of the test-case that describes the expected error message of a test case
  (test-case-error-message "Virheviesti")

  (test-case-menu-title "Testitapaus")
  (test-case-switch-to-error-box "Siirry Virhe-Testilaatikkoon")
  (test-case-switch-to-nonerror-box "Siirry Nonerror-Testilaatikkoon") ;; FI&EN
  (test-case-collapse "Pienennä Testitapaus")
  (test-case-show-actual "Näytä Todellinen Arvo")
  (test-case-enable "Aktivoi Testitapaus")
  (test-case-show-predicate "Näytä Predikaatti")
  (test-case-show-error-message "Näytä Virheviesti")
  (test-case-convert-to-text "Muuta tekstiksi")

  ;; Profj Boxes
  (profjBoxes-empty-error "Tyhjä interaktio")
  (profjBoxes-too-many-expressions-error "Liian monta lauseketta laatikossa")
  (profjBoxes-interactions-label "Interaktiot")
  (profjBoxes-bad-java-id-error "Epämuodostunut(Malformed) Java ID") ;; FI&EN
  (profjBoxes-examples-label "Esimerk(it|kejä)") ;; FI&EN
  (profjBoxes-add-new-example-button "Lisää Uusi Esimerkki")
  (profjBoxes-type "Tyyppi")
  ;; The Java identifier of an example of data
  (profjBoxes-name "Nimi")
  (profjBoxes-value "Arvo")
  (profjBoxes-insert-java-examples "Lisää Java Esimerkkejä")
  (profjBoxes-insert-java-interactions "Lisää Java Interaktioita")

  ;; Slideshow
  (slideshow-hide-picts "Näytä Sisäkkäiset Laatikot")
  (slideshow-show-picts "Näytä Kuvat(Picts)") ;; FI&EN
  (slideshow-cannot-show-picts "Ei voida näyttää picts; suorita ohjelma tallentaaksesi koot ensin välimuistiin")
  (slideshow-insert-pict-box "Lisää Pict-Laatikko")

  ;; GUI Tool
  (gui-tool-heading "GUI Työkalu")
  (gui-tool-before-clicking-message
   "Ennen työkalu-ikonin painamista, Käytä “Lisää GUI” valikosta “Special”"
   " lisätäksesti juuri(root) GUI alkion, tai valitse jo lisätty GUI.") ;; FI&EN
  (gui-tool-show-gui-toolbar "Näytä GUI Työkalupalkki")
  (gui-tool-hide-gui-toolbar "Piilota GUI Työkalupalkki")
  (gui-tool-insert-gui "Lisää GUI")

  ;; contract violation tracking

  ; tooltip for new planet icon in drscheme window (must have a planet violation logged to see it)
  (show-planet-contract-violations "Näytä PLaneT sopimusrikkomukset (contract violations)") ;; FI&EN

  ; buttons in the dialog that lists the recorded bug reports
  (bug-track-report "Kirjaa Tiketti")
  (bug-track-forget "Unohda")
  (bug-track-forget-all "Unohda Kaikki")

  ;; planet status messages in the bottom of the drscheme window;
  ;; the ~a is filled with the name of the package
  (planet-downloading "PLaneT: Ladataan ~a…")
  (planet-installing "PLaneT: Asennetaan ~a…")
  (planet-finished "PLaneT: Saatiin valmiiksi ~a.")
  (planet-docs-building "PLaneT: Rakennetaan dokkareita (Tämän laukaisi ~a)…") ;; FI&EN
  ;; this can happen when there is status shown in a different and then
  ;; the user switches to a tab where planet hasn't been used
  (planet-no-status "PLaneT")

  (bug-report-field-pkg "Package system info")

  ;; string normalization. To see this, paste some text with a ligature into DrRacket
  ;; the first three strings are in the dialog that appears. The last one is in the preferences dialog
  (normalize "Normalisoi")
  (leave-alone "Älä Muuta")
  (normalize-string-info
   "Liittämäs merkkijono sisältää ligatuureja tai muita normalisoimattomia merkkejä. Normalisoidaanko ne?")
  (normalize-string-preference "Normalisoi liitetyt merkkijonot")
  (ask-about-normalizing-strings "Kysy merkkijonojen normalisoinnista")

  (always-use-platform-specific-linefeed-convention
   "Käytä aina alustakohtaista rivinvaihtomerkkikäytäntöä")
  (disable-caret-blinking "Poista sirkumfleksin(hattu) vilkunta")

  ;; optimization coach
  (hide-optimization-coach "Piilota Optimisoinnin Valmentaja")
  (show-optimization-coach "Näytä Optimisoinnin Valmentaja")

  ;; labels used (in a big font) in the background of the definitions and interactions windows
  (definitions-window-label "määrittelyikkuna")
  (interactions-window-label "interaktioikkuna")
  (hide-defs/ints-label "Piilota Määrittelyikkuna/Interaktioikkuna kyltit(labels)") ;; popup menu
  (show-defs/ints-label "Näytä Määrittelyikkuna/Interaktioikkuna kyltit(labels)") ;; preferences checkbox

  ;; menu item in the 'edit' menu; applies to editors with programs in them
  ;; (technically, editors that implement color:text<%>)
  (spell-check-string-constants "Tarkasta Merkkijonovakioiden Oikeinkirjoitus")
  (spell-check-scribble-text "Tarkasta oikeinkirjoitus tekstistä (kaarisulkeiden, {}, välissä Scribblessa)")
  ; (sub)menu whose items are the different possible dictionaries
  (spelling-dictionaries "Oikeinkirjoituksen Sanakirjat")
  (default-spelling-dictionary "Oletussanakirja") ; first item in menu from previous line
  (misspelled-text-color "Väärin Kirjoitetun Tekstin Väri") ;; in the preferences dialog
  (cannot-find-ispell-or-aspell-path "Ei voida löytää aspell- tai ispell-binääritiedostoa")
  ; puts the path to the spell program in the ~a and then the error message
  ; is put following this string (with a blank line in between)
  (spell-program-wrote-to-stderr-on-startup "Oikeinkirjoitusohjelma (~a) tulosti virheviestin:")
  (spell-program-did-not-respond-after-some-seconds
   "Oikeinkirjoitusohjelma (~a) ei vastannut ~a sekunnin jälkeen")
  (spell-skip-to-next-misspelled-word "Siirry Seuraavaan Väärin Kirjoitettuun Sanaan") ;; menu item
  (spell-suggest-corrections "Ehdota Korjausta…") ;; menu item
  (spell-correction-suggestions "Oikeinkirjoitusehdotuksia") ;; dialog title
  (spell-choose-replacement-word "Valitse korvaava sana") ;; label in dialog

  ;; GUI for installing a pkg package; available via File|Install Package...
  (install-pkg-install-by-source "Tee Mitä Tarkoitan")         ; tab label
  (install-pkg-install-from-list "Saatavilla Luettelosta") ; tab label
  (install-pkg-install-installed "Tällä Hetkellä Asennetut")    ; tab label
  (install-pkg-migrate-from "Kopioi Versiosta")           ; tab label
  (install-pkg-settings "Asetukset")                        ; tab label
  (install-pkg-menu-item... "Asenna Paketti…")
  (install-pkg-dialog-title "Asenna Paketti")
  (install-pkg-source-label "Paketin Lähde")
  (install-pkg-package-name "Paketin Nimi")
  (install-pkg-package-source-desc
   "Paketin lähde on paketin nimi, tiedosto, hakemisto, URL tai GitHub-viittaus")
  (install-pkg-infer "Päättele")
  (install-pkg-use "Käytä") ; as opposed to "Infer", label for text box
  (install-pkg-type-label "Paketin Lähdetyyppi (Source Type)") ;; FI&EN
  (install-pkg-file "Tiedosto")
  (install-pkg-link "Linkki")
  (install-pkg-static-link "Staattinen linkki")
  (install-pkg-dir "Hakemisto")
  (install-pkg-dir-url "Etähakemisto")
  (install-pkg-file-url "Etätiedosto")
  (install-pkg-git "Git-Repositorio")
  (install-pkg-github "GitHub")
  (install-pkg-name "Nimi (resolverin konsultoimana)") ;; FI&EN
  (install-pkg-inferred-as "Tyypin pääteltiin olevan ~a") ; ~a saa install-pkg-{file,dir,...}
  (install-pkg-link-dirs "Paikallinen hakemisto linkkinä")
  (install-pkg-file-or-dir? "Valitse tiedosto tai hakemisto?")
  (install-pkg-force? "Jätä Konfliktit Huomioimatta")
  (install-pkg-replace? "Päivitykset saattavat korvata olemassaolevia asennuksia")
  (install-pkg-dry-run? "Harjoitussuoritus (ei asennuksen muutoksia)") ;; FI&EN
  (install-pkg-command-line "Vastaava komentorivin komento:")
  (install-pkg-error-installing-title "Virhe Asentaessa Pakettia")
  (install-pkg-action-label "Tehtävä Toiminto")
  (install-pkg-install "Asenna")
  (install-pkg-update "Päivitä")
  (install-pkg-setup "Setup") ; for button ;; FI&EN
  (install-pkg-setup-long "Setup Nykyinen asennus") ; for menu ;; FI&EN
  (install-pkg-remove "Poista")
  (install-pkg-do-not-remove "Älä Poista")
  (install-pkg-action-inferred-to-be-update "Toiminnon pääteltiin olevan Päivitä")
  (install-pkg-action-inferred-to-be-install "Toiminnon pääteltiin olevan Asenna")
  (install-pkg-default "Oletus")
  (install-pkg-scope-label "Paketin Scope") ;; FI&EN
  (install-pkg-default-scope-label "Paketin Oletus Scope") ; for picking the scope to be default ;; FI&EN
  (install-pkg-default-scope-changed "Oletus-scopeksi muutettiin onnistuneesti ~a") ; confirming message after change
  (install-pkg-installation "Tietty Racket-Asennus")
  (install-pkg-user "Tietty Käyttäjä ja Racket-Versio")
  (install-pkg-set-as-default "Aseta Oletukseksi")
  (install-pkg-scope-is "Paketin scope on ~a") ; ~a gets install-pkg-{installation,user,shared} ;; FI&EN
  (install-pkg-select-package-directory "Valitse Paketin Hakemisto")
  (install-pkg-select-package-file "Valitse Paketin Tiedosto (Package File)") ;; FI&EN
  (install-pkg-update-package-list "Päivitä Pakettilista")
  (install-pkg-stop-update "Lopeta Päivitys")
  (install-pkg-filter "Suodatin")
  (install-pkg-match "~a/~a Osumat")
  (install-pkg-package "Paketti")
  (install-pkg-author "Tekijä")
  (install-pkg-description "Kuvaus")
  (install-pkg-tags "Tagit")
  (install-pkg-checksum "Checksum")
  (install-pkg-source "Lähde")
  (install-pkg-catalog "Luettelo")
  (install-pkg-scope "Näkyvyys(Scope)") ;; FI&EN
  (install-pkg-name "Nimi")
  (install-pkg-update-catalogs? "Päivitä tietokanta vastaamaan määritettyjä luetteloita?")
  (install-pkg-currently-configured-are "Tällä hetkellä määritetyt luettelot ovat")
  (install-pkg-database-recorded-are "Tietokantaan tallennetut luettelot ovat")
  (install-pkg-update-catalogs "Päivitä")
  (install-pkg-do-not-update-catalogs "Älä Päivitä")
  (install-pkg-really-remove? "Haluatko varmasti poistaa seuraavat valitut paketit?")
  (install-pkg-promote "Ylennä from Automaattisesti asennetuista")
  (install-pkg-demote "Alenna to Automaatisesti asennetuista")
  (install-pkg-abort-install "Keskeytä Asennus")
  (install-pkg-abort-update "Keskeytä Päivitys")
  (install-pkg-abort-remove "Keskeytä Poisto")
  (install-pkg-abort-demote "Keskeytä Alennus")
  (install-pkg-abort-promote "Keskeytä Ylennys")
  (install-pkg-abort-migrate "Keskeytä Siirros")
  (install-pkg-abort-setup "Keskeytä Setup")  ;; FI&EN
  (install-pkg-abort-generic-action "Keskeytä Toiminto")
  (install-pkg-close-terminal-output "Sulje Tuloste") ;; FI&EN
  (install-pkg-show-all-options "Näytä Kaikki Vaihtoehdot")
  (install-pkg-migrate-available-installations "Saatavilla olevat Asennukset")
  ;; all ~a will be substituted with the different single characters
  ;; conveying the state, by default these are ✓*!=@
  (install-pkg-legend "~a: asennettiin ~a: asennettiin automaattisesti ~a: ei oletus-näkyvyys ~a: asennettiin linkkinä; ~a: asennettiin URLista") ;; FI&EN
  (pkg-manager-menu-item "Paketinhallinta…")
  (install-pkg-title "Paketinhallinta")
  ;; where ~a gets an installation name:
  (install-pkg-packages-for "Paketit asennukselle ~a")
  (install-pkg-really-remove-installation
   "Haluat varmasti poistaa kaikki asennetut paketit ja tiedot asennuksesta ~a?")
  (install-pkg-installer "Paketin Asennusohjelma")
  (install-pkg-copy "Kopioi Viesti")
  (install-pkg-installation "installationasennus")
  (install-pkg-user "käyttäjä")
  (install-pkg-any "Kaikki tiedostot") ;; any file type
  (install-pkg-bad "ei tuettu") ;; bad (not supported) file type
  (install-pkg-catalogs "Pakettiluettelot")
  (install-pkg-updating "Päivitetään Pakettilistaa…")
  (install-pkg-updating-from "Päivitetään osoitteesta ~a…") ;; FI&EN
  (install-pkg-details-from "Haetaan paketin ~a tietoja osoitteesta ~a…")  ;; FI&EN

  (install-pkg-abort-set-scope "Peruuta Näkyvyyden(Scope) Muutos") ;; FI&EN

  (install-pkg-dependencies-fail "Epäonnistuminen: perutaan asennus/päivitys jos riippuvuudet eivät täyty")
  (install-pkg-dependencies-force
   "Pakotus(Force): asenna riippuvuuksien puutteista tai versioiden vastaamattomuudesta huolimatta")
  (install-pkg-dependencies-search-ask
   "Kysy: kysy jokaisesta puuttuvasta riippuvuudesta (ei tuettu GUIssa)")
  (install-pkg-dependencies-search-auto
   "Auto: asenna puuttuvat tai riippuvuudet, joiden versiot eivät täsmää automaattisest") ;; FI&EN
  (install-pkg-dependencies-search-auto+update
   "Auto + Päivitys: päivitä riippuvuudet aina kun mahdollista")

  (install-pkg-dependencies-mode "Riippuvuus-Moodi")

  (install-pkg-dependencies-search-ask-not-supported-in-gui
   "Riippuvuuksien “kysy“-tila ei ole tuettu GUI asennusohjelmassa.")
  ;; "~a" is pre-":" part of `install-pkg-dependencies-fail'
  ;; or `install-pkg-dependencies-search-auto':
  (install-pkg-deps-is "Riippuvuuksien oletustila on ~a")

  (install-pkg-package-catalogs "Pakettien Luettelot") ; label for a list box
  (install-pkg-add-package-catalog "Lisää Paketin Luettelo")

  (install-pkg-not-rentrant "Asennus ja päivitys eivät voi tapahtua samanaikaisesti;"
                            " keskeytä nykyinen tai odota sen valmistumista.")

  ;; open a file via a collection path (new "Open" menu item in DrRacket)
  (open-require-path "Avaa Require Path…") ;; FI&EN
  (enter-subcollection "Syötä subcollection") ; button in new dialog ;; FI&EN
  (path-to-racket-binary "Polku binääritiedostoon")
  (use-a-different-racket "Käytä eri rackettia")

  ;; adding racket/bin to the path; only under mac os x
  ; first ~a is filled with either the empty string or an error message from elsewhere
  ;  (bracketed by some newlines to separate it out)
  ; second ~a is filled with /etc/paths.d/racket (or some other path like it in the future)
  ; third ~a is filled with the path to the bin directory of the current drracket
  (adding-racket/bin-to-path-failed
   "Yritys lisätä racket-tuki komentoriville epäonnistui.~aErityisesti,"
   " ei psytynyt luomaan “~a” sisällöllä “~a”.")
  ; first and third ~a are filled with /etc/paths.d/racket (or some other path like it in the future)
  ; and the second one is filled with the path to the bin directory that was put into that file.
  (added-racket/bin-to-path
   "Sinun pitäisi nyt pystyä käyttämään rackettia ja sen työkaluja"
   " komentorivillä.\n\n"
   " oletus PATH on määritetty lisäämällä tiedosto"
   " ~a osoittamaan ~a. Voit kumota tämän"
   " määrittelyn poistamalla tiedoston ~a.")
  (adding-racket/bin-no-paths.d
   "racket-sovelluksen lisäys komentoriville epäonnistui koska /etc/paths.d ei ole"
   " olemassa.\n\nSe saattaa toimia ajettuasi tämän komennon terminaali-ikkunassa"
   " luodaksesi hakemiston:\n"
   "    sudo mkdir /etc/paths.d\nja yrittämällä uudelleen.")
  (added-racket/bin-to-path/windows
   "Sinun pitäisi nyt pystyä käyttämään racket-sovellusta ja sen työkaluja"
   " komentoriviltä.\n\n"
   " oletus %PATH% on määritetty rekisterimerkinnän kautta"
   " HKEY_CURRENT_USER\\Environment\\Path"
   " osoittamaan ~a ja ~a.")
  (didnt-add-racket/bin-to-path/unix
   "DrRacket ei voi päivittää polkuasi unixissa, mutta jos"
   " osaat muokata PATHia itse,"
   " lisää\n\n  ~a\n\n"
   " siihen.")
  (add-racket/bin-to-path "Määrittele Komentorivi Racketille…") ;; menu item label
  )
