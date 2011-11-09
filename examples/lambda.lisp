(def print-twice
     (fn (x)
       (println x)
       (println x)))

(print-twice "hello")
(print-twice (str "hello" " " "world"))