(def print-twice
     (fn (x)
       (println x)
       (println x)))

;; (def str
;;      (fn (list)
;;          (if (empty? list)
;;              ""
;;            (+ (first list)
;;               (str (rest list))))))

(print-twice "hello")
(print-twice (str "hello" " " "world"))