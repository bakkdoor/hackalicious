(def Kernel
     (ruby_const "Kernel"))

(defn print (x)
  (. Kernel print x))

(defn println (x)
  (. Kernel puts x))