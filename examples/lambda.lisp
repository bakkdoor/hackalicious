(def print-twice
     (fn (x)
       (println x)
       (println x)))

(def reduce
     (fn (function accum list)
       (if (empty? list)
           accum
         (reduce function
                 (function accum (first list))
                 (rest list)))))
(def sum
     (fn (list)
         (reduce + 0 list)))

(println (sum [1 2 3]))

;; (def str
;;      (fn (list)
;;          (if (empty? list)
;;              ""
;;            (+ (first list)
;;               (str (rest list))))))

;; (print-twice "hello")
;; (print-twice (str ["hello" " " "world"]))