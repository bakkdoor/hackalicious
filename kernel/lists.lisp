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
  (if (<= num 0)
    []
    (cons (first list)
          (take (- num 1)
                (rest list)))))

(defn skip (num list)
  (if (<= num 0)
    list
    (skip (- num 1) (rest list))))

(defn reject (func list)
  (if (empty? list)
    []
    (if (func (first list))
      (reject func (rest list))
      (cons (first list)
            (reject func (rest list))))))

(defn filter (func list)
  (if (empty? list)
    []
    (if (not (func (first list)))
      (filter func (rest list))
      (cons (first list)
            (filter func (rest list))))))

;; (defn filter (func list)
;;   (reject (fn (x)
;;             (not (func x)))
;;           list))


(defn sum (list)
  (reduce + 0 list))

(defn product (list)
  (reduce * 1 list))