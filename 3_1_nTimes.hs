-- Реализуйте функцию nTimes, которая возвращает список, состоящий
-- из повторяющихся значений ее первого аргумента. Количество повторов 
-- определяется значением второго аргумента этой функции.

-- GHCi> nTimes 42 3
-- [42,42,42]
-- GHCi> nTimes 'z' 5
-- "zzzzz"

nTimes:: a -> Int -> [a]
nTimes el n = take n (repeat el)  

-- еще варианты решений

nTimes1 x n
  | n == 0 = []
  | otherwise = x : nTimes x (n - 1)

nTimes2 _ 0 = []
nTimes3 i n = i : nTimes i (n - 1)

nTimes4 x n = take n $ repeat x

nTimes5 = flip replicate

nTimes6 a b
         | b == 0 = []        
         | b > 0  = helper [] a b where     
     helper  acc a b | b == 0 = acc
                     | b > 0 = helper ( a: acc) a (b - 1 )

nTimes7 x n = map (\_ -> x) [1..n]
