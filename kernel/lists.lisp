(defn map (func list)
  (if (empty? list)
    []
    (cons (func (first list))
          (map func (rest list)))))

(defn size (list)
  (. list size))

(defn reduce (func accum list)
  (if (empty? list)
    accum
    (reduce func
            (func accum (first list))
            (rest list))))

(defn take (num list)
  (if (<= 0 num)
    []
    (cons (first list)
          (take (- num 1)
                (rest list)))))


(defn sum (list)
  (reduce + 0 list))

(defn product (list)
  (reduce * 1 list))