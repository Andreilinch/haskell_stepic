-- Составьте список сумм соответствующих элементов трех заданных списков. 
-- Длина результирующего списка должна быть равна длине самого длинного из заданных списков, 
-- при этом «закончившиеся» списки не должны давать вклада в суммы.

-- GHCi> sum3 [1,2,3] [4,5] [6]
-- [11,7,3]

sum3 :: Num a => [a] -> [a] -> [a] -> [a]
sum3 (a:as) (b:bs) (c:cs) = (a+b+c) : sum3 as bs cs
sum3 [] (b:bs) (c:cs) = (b+c) : sum3 [] bs cs
sum3 (a:as) [] (c:cs) = (a+c) : sum3 as [] cs
sum3 (a:as) (b:bs) [] = (a+b) : sum3 as bs []
sum3 (a:as) [] [] = (a) : sum3 as [] []
sum3 [] (b:bs) [] = (b) : sum3 [] bs []
sum3 [] [] (c:cs) = (c) : sum3 [] [] cs
sum3 _      _       _ = []

-- Решения из комментов

sum3' :: Num a => [a] -> [a] -> [a] -> [a]
sum3 (x:xs) (y:ys) (z:zs) = (x+y+z) : sum3' xs ys zs
sum3' [] [] [] = []
sum3' [] ys zs = sum3' [0] ys zs
sum3' xs [] zs = sum3' xs [0] zs
sum3' xs ys [] = sum3' xs ys [0]

-- 

sum3'' :: Num a => [a] -> [a] -> [a] -> [a]
sum3'' xs ys zs = xs `sum2` ys `sum2` zs
  where
    sum2 [] bs = bs
    sum2 as [] = as
    sum2 (a : as) (b : bs) = (a + b) : sum2 as bs

