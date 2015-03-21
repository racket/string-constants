(module turkish-string-constants "string-constant-lang.rkt"
  
 ;;; when translating this constant, substitute name of actual language for `English'
 (is-this-your-native-language "Türkçe Ana Diliniz Mi?")

 (are-you-sure-you-want-to-switch-languages
  "GUI dili değiştirilecek. Bu sebeple DrRacket'ı yeniden başlatmanız gerekecektir. Emin misiniz?")

 (interact-with-drscheme-in-language "DrRacket ile Türkçe Çalışın")

 ;; these two should probably be the same in all languages excepet English.
 ;; they are the button labels (under macos and windows, respectively)
 ;; that go the with the string above.
 (accept-and-quit "Kabul Et ve Çık")
 (accept-and-exit "Kabul Et ve Çık")
 
 ;;; general purpose (DrRacket is hereby a word in every language, by decree of Robby :)
 (plt "PLT")
 (drscheme "DrRacket")
 (drracket "DrRacket")
 (ok "Tamam")
 (cancel "İptal")
 (abort "İptal Et")
 (untitled "İsimsiz")
 (untitled-n "İsimsiz ~a")
 (warning "Uyarı")
 (error "Hata")
 (close "Kapat") ;; as in, close an open window or tab. must match close-menu-item
                 ;; in the sense that, when the &s have been stripped from
                 ;; close-menu-item, it must be the same string as this.
 (close-window "Pencereyi Kapat")
 (stop "Dur")   
 (&stop "&Dur") ;; for use in button and menu item labels, with short cut.
 (are-you-sure-delete? "~a silmek istediğinizden emin misiniz?") ;; ~a is a filename or directory name
 (are-you-sure-replace? "~a değiştirmek istediğinizden emin misiniz?") ;; ~a is a filename or directory name
 (ignore "Yoksay")
 (revert "Eski haline getir")

 ;; label for a generic check box, often supported on dialogs
 ;; that ask a binary choice of the user. If checked, the
 ;; dialog isn't going to be shown again.
 ;; One version for always using the current choice:
 (dont-ask-again-always-current "Bir daha sorma (her zaman halihazırdaki seçimi kullan)")
 ;; One generic version (ie, on the Quit DrRacket dialog)
 (dont-ask-again                "Bir daha sorma")

 ;;; important urls
 (web-materials "İlgili Web Siteleri") ;; menu item title
 (tool-web-sites "Araç Web Siteleri")   ;; menu item title
 (plt-homepage "Racket")
 (pbd-homepage "Program by Design")

  ;;; bug report form
 (cancel-bug-report? "Hata Raporunu İptal Et?")
 (are-you-sure-cancel-bug-report?
  "Bu hata raporunu göndermeyi iptal etmek istediğinizden emin misiniz??")
 (do-you-want-to-discard-or-save-this-bug-report
  "Bu hata raporunu silmek mi yoksa kaydetmek mi istersiniz?")
 (discard "Sil") ;; a button label for a dialog box with the above question
 (bug-report-form "Hata Raporu Formu")
 (bug-report-field-name "İsim")
 (bug-report-field-email "E-posta")
 (bug-report-field-summary "Özet")
 (bug-report-field-severity "Ciddiyet")
 (bug-report-field-class "Sınıf")
 (bug-report-field-description "Açıklama")
 (bug-report-field-reproduce1 "Hatayı Yeniden Oluşturmak")
 (bug-report-field-reproduce2 "İçin Adımlar")
 (bug-report-field-environment "Çevre")
 (bug-report-field-docs-installed "Yüklü Dökümanlar")
 (bug-report-field-collections "Koleksiyonlar")
 (bug-report-field-links "Bağlantılar")  ;; from 'raco link'
 (bug-report-field-human-language "İnsan Dili")
 (bug-report-field-memory-use "Bellek Kullanımı")
 (bug-report-field-version "Sürüm")
 (bug-report-synthesized-information "Sentezlenen Bilgi")  ;; dialog title
 (bug-report-show-synthesized-info "Sentezlenen Bilgiyi Göster")
 (bug-report-submit "Gönder")
 (close-and-save-bug-report "Kapat && Kaydet") ;; button in bug report dialog, next to cancel and bug-report-submit
 (bug-report-submit-menu-item "Hata Raporu Gönder...")  ;; same as above, but used when there are saved bug reports
 (saved-bug-reports-menu-item "Kayıtlı Hata Raporları") ;; in Help Menu, submenu title
 (disacard-all-saved-bug-reports "Bütün Kayıtlı Hata Raporlarını Sil") ;; menu item: only shows up when there is more than one saved bug report
 (no-saved-bug-reports "Kayıtlı hiç hata raporu yok") ;; an info message that shows up as a disabled menu item when no saved bug reports are around
 (new-bug-report "Yeni Hata Raporu") ;; button label the user sees when there are saved bug reports, but the user asks to save another one.
 (close-and-save "Kapat ve Kaydet") ;; button on the bottom of the bug report form
 (saved-unsubmitted-bug-reports "Kayıtlı, gönderilememiş hata raporları:") 
  ;; the above string constant is next to previous line in same dialog, followed by list of bug report subjects (as buttons)
 (error-sending-bug-report "Hata raporu gönderirken sorun oluştu")
 (error-sending-bug-report-expln
  "Bu hata raporunu gönderirken bir sorun oluştu."
  " Eğer internet bağlantınız sorunsuz çalışıyorsa, lütfen şu adresi ziyaret edin:\n\n    http://bugs.racket-lang.org/\n\nand"
  " hata raporunu online formumuz ile gönderin. Rahatsızlıktan dolayı özür dileriz.\n\nSorun mesajı:\n~a")
 (illegal-bug-report "Usülsüz hata raporu")
 (pls-fill-in-field "Lütfen \"~a\" alanını doldurunuz")
 (malformed-email-address "Kusurlu e-posta adresi")
 (pls-fill-in-either-description-or-reproduce "Lütfen, ya Açıklama alanını veya Hatayı Yeniden Oluşturmak İçin Adımlar alanını doldurun.")


  )
