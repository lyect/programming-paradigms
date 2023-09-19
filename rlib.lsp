(defun first (l)
  (car l)
)

(defun rest (l)
  (cdr l)
)

(defun extend (l1 l2)
  (if (null l1)
    l2
    (cons
      (first l1)
      (extend (rest l1) l2)
    )
  )
)

(defun rev--internal (r l fn)
  (if (funcall fn r)
    (extend l r)
    (rev--internal
      (rest r)
      (cons (first r) l)
      fn
    )
  )
)

(defun rev (l)
  (rev--internal l '() #'null)
)

(defun revs (r l)
  (rev--internal r l #'null)
)

(defun srev (l a)
  (rev--internal l '() #'(lambda (r) (or (null r) (equal (first r) a))))
)

(defun arev--internal (r l a)
  (if (null r)
    l
    (if (equal (first r) a)
      (extend l (cons a (arev--internal (rest r) '() a)))
      (arev--internal
        (rest r)
        (cons (first r) l)
        a
      )
    )
  )
)

(defun arev (l a)
  (arev--internal l '() a)
)

(defun nlrev--internal (r l)
  (if (null r)
    l
    (if (atom r)
      (if (null l)
        r
        (cons r l)
      )
      (nlrev--internal
        (rest r)
        (if (atom r)
          (cons r l)
          (cons (nlrev--internal (first r) '()) l)
        )
      )
    )
  )
)

(defun nlrev (l)
  (nlrev--internal l '())
)

(defun print (l)
  (format nil "~{~A~^ ~}" l)
)