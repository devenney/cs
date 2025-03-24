(defun vowel-p (letter)
  "Check if LETTER (a character) is a vowel."
  (find (char-downcase letter) "aeiou"))

(defun pl-done-p (wd)
  "Return true if the word begins with a vowel."
  (vowel-p (char wd 0)))

(defun pigl (wd)
  "Convert a word (string) into its Pig Latin form"
  (if (pl-done-p wd)
    (concatenate 'string wd "ay")
    (pigl (concatenate 'string
      (subseq wd 1)
      (subseq wd 0 1)))))