(def inspect
     (fn (x)
         (call x "inspect")))

(println (inspect "hello, world"))

(println (inspect [1 2 3]))