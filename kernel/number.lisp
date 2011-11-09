(defn mod (x y)
  (. x modulo y))

(defn even? (x)
  (= (mod x 2) 0))

(defn odd? (x)
  (not (even? x)))