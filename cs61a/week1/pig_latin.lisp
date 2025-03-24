(defun vowel-p (letter)
  "Return true if LETTER (a character) is a vowel."
  (find (char-downcase letter) "aeiou"))

(defun special-vowel-prefix-p (wd)
  "Return true if word starts with a special case like 'xr' or 'yt'."
  (let ((firsttwoletters (string-downcase (subseq wd 0 (min 2 (length wd))))))
    (or (string= firsttwoletters "xr")
        (string= firsttwoletters "yt"))))

(defun pl-done-p (wd)
  "Return true if the word begins with a vowel."
  (or (vowel-p (char wd 0))
      (special-vowel-prefix-p wd)))

(defun valid-word-p (wd)
  "Return true if wd is a non-empty alphabetic string."
  (and (stringp wd)
       (> (length wd) 0)
       (every #'alpha-char-p wd)))

(defun pigl (wd &optional (seen '()))
  "Convert a word (string) into its Pig Latin form"
  (cond
    ((not (valid-word-p wd))
      (error "Invalid word: ~A" wd))
  ((pl-done-p wd)
    (concatenate 'string wd "ay"))
  ((member wd seen :test #'string=)
    (error "Infinite recursion detected - invalid transformation for: ~A" wd))
  (t
    (pigl (concatenate 'string
                       (subseq wd 1)
                       (subseq wd 0 1))
          (cons wd seen)))))