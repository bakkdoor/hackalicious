(defn inspect (x)
  (. x inspect))

(defn ->string (x)
  (. x to_s))

(defn ->int (x)
  (. x to_i))

(defn ->float (x)
  (. x to_f))

(defn ->symbol (x)
  (. x to_sym))

(defn class (x)
  (. x class))

(defn = (x y)
  (. x == y))

(defn < (x y)
  (. x < y))

(defn > (x y)
  (. x > y))

(defn <= (x y)
  (or (= x y)
      (< x y)))

(defn >= (x y)
  (or (= x y)
      (> x y)))

;; (defn negate (func)
;;   (fn (x)
;;     (not (func x))))