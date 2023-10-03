(defun extend (l1 l2)
  (if (null l1) ;; Check if l1 is empty
    l2 ;; If it is, return l2
    (cons (car l1) (extend (cdr l1) l2)) ;; Else append head of the l1 to the recursive extend result
  )
)

(defun --general-reverse (toRev sup stopFunction deep)
  (if (funcall stopFunction toRev) ;; Check for stop function
    (extend sup toRev) ;; If funcall is true, concat sup and toRev
    (--general-reverse ;; Else call for recursion
      (cdr toRev)      ;; Cut off list's head
      (if (null deep)  ;; Check for deep reverse flag
        (cons (car toRev) sup) ;; If there is no need to perform deep reverse, just append head of toRev to the sup
        (if (atom (car toRev)) ;; Else need to check is head of the toRev an atom
          (cons (car toRev) sup) ;; If it is, just append head of toRev to sup
          (cons 
            (--general-reverse ;; Arg #1 for cons
              (car toRev) '() ;; Lists for --general-reverse
              stopFunction    ;; Stop function
              deep            ;; Deep reverse
            )
            sup                ;; Arg #2 for cons
          ) ;; Else call reverse for head and append result to the sup
        )
      )
      stopFunction
      deep
    )
  )
)

(defun reverse (l)
  (--general-reverse
    l '()  ;; Lists
    #'null ;; Stop function
    nil    ;; Deep reverse
  )
)

(defun reverse-concat (toRev toConcat)
  (--general-reverse
    toRev toConcat ;; Lists
    #'null         ;; Stop function
    nil            ;; Deep reverse
  )
)

(defun reverse-until (toRev untilAtom)
  (--general-reverse
    toRev '()                                              ;; Lists
    #'(lambda (l) (or (null l) (equal (car l) untilAtom))) ;; Stop function
    nil                                                    ;; Deep reverse
  )
)

(defun deep-reverse (l)
  (--general-reverse
    l '()  ;; Lists
    #'null ;; Stop function
    T      ;; Deep reverse
  )
)

(defun reverse-after (toRev afterAtom)
  (if (null toRev) ;; Check if list is empty
    toRev ;; If it is, return the list
    (if (equal (car toRev) afterAtom) ;; Else check is head of the toRev an afterAtom
      (cons afterAtom (reverse (cdr toRev))) ;; If it is, reverse what's after
      (cons (car toRev) (reverse-after (cdr toRev) afterAtom)) ;; Else cut off head and call for recursion
    )
  )
)

(defun --reverse-between-internal (toRev sup betweenAtom)
  (if (null toRev) ;; Check if toRev is empty
    sup ;; If it is, return supplementary
    (if (equal (car toRev) betweenAtom) ;; Else check if head of toRev is betweenAtom
      (extend          ;; If it is, cut off head and call recursion for a tail
        sup            ;;  Consider sup has reversed part and recursion call will return correct result
        (cons          ;;  Then concat sup and result of the recursion
          betweenAtom
          (--reverse-between-internal 
            (cdr toRev) '() betweenAtom
          )
        )
      )  
      (--reverse-between-internal ;; If it is not, cut off the head of the toRev and the append it to the recursion result
        (cdr toRev)
        (cons (car toRev) sup)
        betweenAtom
      )
    )
  )
)

(defun reverse-between (toRev betweenAtom)
  (--reverse-between-internal toRev '() betweenAtom)
)

(defun print (l)
  (format nil "~{~A~^ ~}" l)
)