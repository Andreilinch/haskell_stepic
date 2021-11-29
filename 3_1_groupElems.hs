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

groupElems :: Eq a => [a] -> [[a]]
groupElems []     = []
groupElems (x:xs) = acc1 xs [x] []
  where
    acc1 []     acc2     all  = reverse $ acc2:all
    acc1 (x:xs) (z:acc2) all | x == z    = acc1 xs (z:z:acc2) all
    acc1 (x:xs) (z:acc2) all | otherwise = acc1 xs [x]       ((z:acc2):all)

-- решения из комментов 

groupElems' :: Eq a => [a] -> [[a]]
groupElems' [] = []
groupElems' (x : xs) = case groupElems' xs of
                        [] -> [[x]]
                        (g : gs) | x == head g -> (x : g) : gs
                                 | otherwise   -> [x] : g : gs