-- Сформируйте список целых чисел, содержащий только те элементы исходного списка, 
-- значение которых нечетно.

-- GHCi> oddsOnly [2,5,7,10,11,12]
-- [5,7,11]

-- Для анализа четности можно использовать функции odd и even стандартной библиотеки.

oddsOnly :: Integral a => [a] -> [a]
oddsOnly s | null s == True = error "empty list"
           | otherwise = helper [] s (length s)  where
    helper acc s n | 0 == n = reverse acc
                   | 0 < n = helper (if (even $ head s) == False then head s : acc else acc) (tail s) (n - 1)

-- Теперь решения из комментариев)

oddsOnly' :: Integral a => [a] -> [a]
oddsOnly' [] = []
oddsOnly' (x : xs)
  | odd x = x : oddsOnly' xs
  | otherwise = oddsOnly' xs

oddsOnly'' :: Integral a => [a] -> [a]
oddsOnly'' a = [x | x <- a, odd x]