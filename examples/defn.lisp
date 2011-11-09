(defn print-twice (str)
  (println str)
  (println str))

;; same as:
;; (def print-twice
;;      (fn (str)
;;          (println str)
;;          (println str)))

(print-twice "hello")
