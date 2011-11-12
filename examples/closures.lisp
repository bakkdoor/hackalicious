(defn adder (x)
  (fn (y)
    (+ x y)))

(def add-5 (adder 5))
(println (add-5 4))