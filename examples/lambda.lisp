(def print-twice
     (fn (x)
       (println x)
       (println x)))

(print-twice "hello")
(print-twice (str ["hello" " " "world"]))

(println (sum [1 2 3]))

(if (empty? [1 2 3])
  (println "foo")
  (do (println "yup")
      (println "cool")))