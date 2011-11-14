(defn println (x)
  (. Kernel puts x))

(defn print (x)
  (. Kernel print x))

(defn + (x y)
  (. x + y))

(def name "foo")
(println name)
(println (+ 2 1))
(print "hello")
(print " ")
(println "world")

(println "What's your name?")
(def var "Hello")
(println var)