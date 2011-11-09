(def print-twice
     (lambda (x)
       (do (println x)
           (println x))))

(print-twice "hello")
(print-twice (+ "hello" " " "world"))