(def Object (ruby_const "Object"))
(def Class (ruby_const "Class"))

(defn inspect (x)
  (. x inspect))