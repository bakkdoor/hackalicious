(def Kernel
     (ruby_const "Kernel"))

(defn ruby-constants (constants)
  (map (fn (c)
           (ruby_const c))
       constants))

(defn print (x)
  (. Kernel print x))

(defn println (x)
  (. Kernel puts x))

(defn readln ()
  (. Kernel gets))