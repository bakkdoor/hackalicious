(defn print (x)
  (. Kernel print x))

(defn println (x)
  (. Kernel puts x))

(defn readln ()
  (. Kernel gets))