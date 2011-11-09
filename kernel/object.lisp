(def Object (ruby_const "Object"))
(def Class (ruby_const "Class"))

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
