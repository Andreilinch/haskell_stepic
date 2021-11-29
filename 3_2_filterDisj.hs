-- Реализуйте функцию filterDisj, принимающую два унарных предиката и список, 
-- и возвращающую список элементов, удовлетворяющих хотя бы одному из предикатов.

-- GHCi> filterDisj (< 10) odd [7,8,10,11,12]
-- [7,8,11]

filterDisj :: (a -> Bool) -> (a -> Bool) -> [a] -> [a]
filterDisj _  _  [] = []
filterDisj f1 f2 (x:xs)
  | f1 x || f2 x = x : filterDisj f1 f2 xs
  | otherwise    = filterDisj f1 f2 xs


-- решения из комментов

filterDisj p1 p2 = filter (\x -> p1 x || p2 x)