(def Object (ruby_const "Object"))
(def Class (ruby_const "Class"))

(def inspect
     (fn (x)
         (call x "inspect")))