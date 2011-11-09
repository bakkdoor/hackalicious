(def Kernel (ruby_const :Kernel))
(def Object (ruby_const :Object))
(def Class (ruby_const :Class))
(def String (ruby_const :String))
(def Regexp (ruby_const :Regexp))
(def Array (ruby_const :Array))
(def Hash (ruby_const :Hash))

;; TODO
;; (def RubyClasses [:Kernel :Object :Class :String :Regexp :Array :Hash])
;; (map (fn (c)
;;          (def!! c (ruby_const c)))
;;      RubyClasses)
