(def print-twice
     (fn (x)
       (println x)
       (println x)))

(defn str (list)
  (if (empty? list)
      ""
    (+ (first list)
       (str (rest list)))))

(print-twice "hello")
(print-twice (str ["hello" " " "world"]))