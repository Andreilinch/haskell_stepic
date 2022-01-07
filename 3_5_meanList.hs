-- Реализуйте функцию meanList, которая находит среднее значение элементов списка, 
-- используя однократный вызов функции свертки.

-- GHCi> meanList [1,2,3,4]
-- 2.5
meanList :: [Double] -> Double
--meanList s = fst $ foldr (\x (sum, count) -> (x + sum, count + 1)) (0, length s) s 
meanList s = foldr (\x sum -> x + sum) 0 s / (fromIntegral $ length s)

-- Решения из комментов
meanList :: [Double] -> Double
meanList list = (\(x, y) -> x / y) (foldr (\x (b, a) -> (x + b, a + 1)) (0, 0) list)