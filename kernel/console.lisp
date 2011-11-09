(def Kernel
     (ruby_const "Kernel"))

(defn print (x)
  (call Kernel "print" x))

(defn println (x)
  (call Kernel "puts" x))