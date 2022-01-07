-- Используя однократный вызов свертки, реализуйте функцию evenOnly, 
-- которая выбрасывает из списка элементы, стоящие на нечетных местах, оставляя только четные.

-- GHCi> evenOnly [1..10]
-- [2,4,6,8,10]
-- GHCi> evenOnly ['a'..'z']
-- "bdfhjlnprtvxz"

evenOnly :: [a] -> [a]
-- evenOnly = foldr (\x (s, n) -> if odd $ x !! n == True then (x + s, n +1) else (s, n + 1)) (0, 0) 
-- 1,2,3]!!1

evenOnly = (foldr (\(x,s) y -> if (even x) then s:y else y) []) . foo
foo xs = zipWith (,) [1..(length xs)] xs

-- Решения из комментов
evenOnly = snd . foldr (\a (xs, ys) -> (a : ys, xs)) ([], [])

evenOnly = map snd . filter (even . fst) . zip [1 ..]

-- Попробуйте добиться того, чтобы реализованная вами в прошлом задании функция evenOnly 
-- позволяла работать и с бесконечными списками.
-- То есть, например, запрос на первые три элемента бесконечного списка, 
-- возвращаемого этой функцией, примененной к списку всех натуральных чисел, должен завершаться:

-- GHCi> take 3 (evenOnly [1..])
-- [2,4,6]

evenOnly' :: [a] -> [a]
evenOnly' xs = helper xs 1
helper [] _ = []
helper (x:xs) c = if (even c) then x:(helper xs (c+1)) else (helper xs (c+1))

-- Решения из комментов
{-
Комментарий закреплён
Kirill Elagin
5 лет назад
От решения предыдущей задачи отличается наличием очень важной тильдочки.

Верное решение #10340980
evenOnly :: [a] -> [a]
evenOnly = snd . foldr (\x ~(xs, ys) -> (x : ys, xs)) ([], [])

-}