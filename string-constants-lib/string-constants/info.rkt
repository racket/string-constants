#lang info

(define compile-omit-files '("tests"))

(define string-constants-info
  '((english             #rx"^en_"        #rx"^English_"             string-constants/private/english-string-constants)
    (german              #rx"^de_"        #rx"^German_"              string-constants/private/german-string-constants)
    (french              #rx"^fr_"        #rx"French_"               string-constants/private/french-string-constants)
    (danish              #rx"^da_DK"      #rx"^Danish_"              string-constants/private/danish-string-constants)
    (portuguese          #rx"^pt_"        #rx"Portuguese_"           string-constants/private/portuguese-string-constants)
    (japanese            #rx"^ja_"        #rx"^Japan_"               string-constants/private/japanese-string-constants)
    (traditional-chinese #rx"^zh_(HK|TW)" #rx"Chinese_(Hong|Taiwan)" string-constants/private/traditional-chinese-string-constants)
    (simplified-chinese  #rx"^zh_CN"      #rx"Chinese_China"         string-constants/private/simplified-chinese-string-constants)
    (bulgarian           #rx"^bg_"        #rx"^Bulgarian_"           string-constants/private/bulgarian-string-constants)
    ))
