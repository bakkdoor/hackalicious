(defn str (list)
  (if (empty? list)
      ""
    (if (= 1 (size list))
        (first list)
      (+ (first list)
         (str (rest list))))))
