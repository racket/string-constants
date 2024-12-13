#lang scribble/manual

@title{How To Translate DrRacket's String Constants in Your Language}
@author[(author+email "Alexander Shopov" "ash@kambanaria.org"  #:obfuscate? #t)]

This is a short hands-on guide how to translate the strings used
within DrRacket's GUI. It is targeted at people willing to translate
the interface who may not know all ins and outs of Racket.

@; ----------------------------------------------------------------------

@section{Introduction}

DrRacket is a is a development environment for the many languages you
can use via Racket — the language developers' language. The interface
is already translated in more than a dozen languages, some of which
are more actively maintained than others.

If you are interested how much time and effort you will need to
invest — roughly 3 afternoons.

@; TODO: add automatic statistics on the size of the translation

Here are the steps:

@section{Preparation}

Clone the
@link["https://github.com/racket/string-constants"]{@tt{https://github.com/racket/string-constants}}
repo. This is where you will work, translate, and finally submit the
translation via a pull request.

Go to the
@link["https://github.com/racket/string-constants/tree/master/string-constants-lib/string-constants/private"]{@tt{string-constants-lib/string-constants/private}}
directory — it contains all the translations.  Start with copying
the file
@link["https://github.com/racket/string-constants/blob/master/string-constants-lib/string-constants/private/english-string-constants.rkt"]{@tt{english-string-constants.rkt}}
to @tt{yourlanguage-string-constants.rkt}.

English is the master file containing the originals of the strings.
Therefore, start with a copy of that.  Note that if you continue to
update and maintain your translation English will be the file you will
sync with.

Once you have copied the file you will need to declare it so DrRacket
knows it exists and has to be included with the rest of the
translations in the official builds.  To do that just edit the file
@link["https://github.com/racket/string-constants/blob/master/string-constants-lib/string-constants/string-constant.rkt"]{@tt{string-constants/string-constants-lib/string-constants/string-constant.rkt}}
and add your language in two places:
@racketblock[
(require (prefix-in english: "private/english-string-constants.rkt")
…
          (prefix-in yourlanguage: "private/yourlanguage-string-constants.rkt"))
]

and
@racketblock[
(define built-in-string-constant-sets
  (list
   (make-sc 'english english:string-constants #f)
…
   (make-sc ' yourlanguage yourlanguage:string-constants #f)))
]

And with that you are done with the initial work — you have created
a template for your language (still filled in with the English
originals) and you have told Racket to use it. We are off to the races
and all we need to do is fill in the translations.


@; ----------------------------------------------------------------------

@section{Translation}

Open @tt{yourlanguage-string-constants.rkt} in your favorite text
editor. It has a fairly trivial structure: it is basically a map — a
long list of key-value pairs. The key is the identifier of the string
— how Racket source code is going to refer to the message. Do not
change these. The value is the translation. As you started with the
English version — you have all the comments and the formatting. I
highly recommend keeping these in place because they are very helpful
when you need to update the translations.

The first thing you need to do is fix the line:
@racketblock[(module english-string-constants "string-constant-lang.rkt"
…)]

It has to become
@racketblock[(module yourlanguage-string-constants "string-constant-lang.rkt"
…)]


The second thing is to add some metadata to your file. You can use
standard comments in the file – either prefix a line with double
semicolon @tt{;;} or comment out a block of text via @tt{#| commented
block |#}.

In that part of the file put some basic data — like your name, which
version of the @tt{private/english-string-constants.rkt} file you are
syncing with. This is also the place to put out conventions for the
translation such as specific terms, style etc. I would also recommend
spelling out the license you want to use. Note that for anything that
is to be distributed with Racket, the maintainers will be more likely
to accept it if you use the strategy below:

In the
@link["https://github.com/racket/string-constants/blob/master/string-constants-lib/string-constants/private/bulgarian-string-constants.rkt"]{Bulgarian
translation} I have explicitly pointed out:

@tt{
;; This file is distributed under the same terms as Racket
}

Currently translations are double licensed — under the
@link["https://github.com/racket/string-constants/blob/master/LICENSE"]{Apache
2.0 license and the MIT license}.

All the translated strings are quoted by double quotes. So if you need
to put @tt{"} in the translation you would need to quote it like
@tt{\"}. However I recommend you use
@link["https://en.wikipedia.org/wiki/Quotation_mark#Summary_table"]{proper
quotation marks for your language}.

A new line is represented by @tt{\n}.  @tt{~a} is substituted with
whatever parameter is given to the string template.

You can split strings — a sequence of strings gets concatenated in a single string so:
@racketblock[(install-plt-error-downloading "There was an error when downloading the"
                                 " .plt file.\n\nDetails:\n")]

is the same as:
 
@racketblock[(install-plt-error-downloading "There was an error when downloading the .plt file.\n\nDetails:\n")]

You can use this to wrap where you want in case strings get too
long. Just make sure you do not have a dangling space at the end of a
string portion. So using the current example:

@racketblock[(install-plt-error-downloading "There was an error when downloading the "
                                 " plt file.\n\nDetails:\n")]

Note how the space is at the end of the first line. This will @bold{cause
breakage}. There are ways around this but it is better to not need
them.

Once you finish the translation – create a pull request to the
@link["https://github.com/racket/string-constants"]{@tt{https://github.com/racket/string-constants}}
repo.  If you are interested in how the whole infrastructure of
translation works in DrRacket – have a look at the
@link["https://docs.racket-lang.org/string-constants/index.html"]{documentation}.


