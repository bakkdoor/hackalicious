(defmacro foo (a b)
  `(~a ~b))

(println (inspect (foo (print "hello" 1) (+ 3 4))))