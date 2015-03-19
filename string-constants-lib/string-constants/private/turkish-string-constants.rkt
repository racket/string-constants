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


  )
