(def inspect
     (fn (x)
         (call x "inspect")))

(println (inspect "hello, world"))

(println [1 2 3])