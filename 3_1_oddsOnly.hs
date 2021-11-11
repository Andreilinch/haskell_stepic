-- Сформируйте список целых чисел, содержащий только те элементы исходного списка, 
-- значение которых нечетно.

-- GHCi> oddsOnly [2,5,7,10,11,12]
-- [5,7,11]

-- Для анализа четности можно использовать функции odd и even стандартной библиотеки.

oddsOnly :: Integral a => [a] -> [a]
oddsOnly s | null s == True = error "empty list"
           | otherwise = helper [] s (length s)  where
    helper acc s n | 0 == n = acc
                   | 0 < n = helper (if head s : acc) s (n - 1)

-- oddsOnly' s | odd $ head s == True = head s : [] 
--            | otherwise = error "empty list"

--  | n < length s = helper (head s : acc) s (n + 1)

--
if even (head [1, 3, 4, 5, 7]) == True then 1 : [12] else 0