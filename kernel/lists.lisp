(defn size (list)
  (. list size))

(defn empty? (list)
  (= 0 (size list)))

(defn first (list)
  (. list first))

(defn rest (list)
  (. list rest))

(defn cons (x list)
  (. list unshift x))

(defn map (func list)
  (if (empty? list)
    []
    (cons (func (first list))
          (map func (rest list)))))

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