-- Используя функцию foldr, напишите реализацию функции lengthList, 
-- вычисляющей количество элементов в списке.

-- GHCi> lengthList [7,6,5]
-- 3

lengthList :: [a] -> Int
lengthList = foldr (\x n -> n + 1) 0
