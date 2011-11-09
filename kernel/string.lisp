(defn str (list)
  (reduce + "" (map ->string list)))