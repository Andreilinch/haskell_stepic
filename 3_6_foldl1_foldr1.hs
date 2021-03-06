-- Существуют алгоритмы для которых тяжело определить поведение на пустом списке
-- Например поиск наибольшего и наименьшего значения в списке
-- Для таких случаев существуют функции foldl1 и foldr1
-- на пустом списке они возвращают сообщение об ошибке, а в качестве инициализирующего значения 
-- правая свертка использует последний элемент списка, левая - первый

foldr1 :: (a -> a -> a) -> [a] -> a
foldr1 _ [x] = x                                -- на одноэлементном списке возвращаем этот элемент
foldr1 f (x:xs) = f x (foldr1 f xs)             -- повторяем реализацию правой свертки
foldr1 _ [] = error "foldr1: Empylist"          -- случай когда список пустой

foldl1 :: (a -> a -> a) -> [a] -> a
foldl1 f (x:xs) = foldl f x xs                  -- для не пустого списка ничего
                                                -- писать не нужно так как мы вызываем настоящий foldl
foldl1 _ [] = error "foldl1: Empylist"          -- случай когда список пустой

-- теперь можно реализовать функцию 

maximum :: (Ord a) => [a] -> a                  -- так как нужно сравнивать на неравенство влзникает контекст Ord
maximum = foldl1 max

-- Напишите реализацию функции, возвращающей последний элемент списка, через foldl1.
-- lastElem :: [a] -> a
-- lastElem = foldl1 undefined

lastElem :: [a] -> a
lastElem = foldl1 (flip const)