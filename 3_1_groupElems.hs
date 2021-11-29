-- Напишите функцию groupElems которая группирует одинаковые элементы в списке 
-- (если они идут подряд) и возвращает список таких групп.

-- GHCi> groupElems []
-- []
-- GHCi> groupElems [1,2]
-- [[1],[2]]
-- GHCi> groupElems [1,2,2,2,4]
-- [[1],[2,2,2],[4]]
-- GHCi> groupElems [1,2,3,2,4]
-- [[1],[2],[3],[2],[4]]

groupElems s | null s == True = []
             | otherwise = helper [] s (length s)  where
    helper acc s n | 0 == n = reverse acc
                   | 0 < n = helper (if (even $ head s) == False then head s : acc else acc) (tail s) (n - 1)