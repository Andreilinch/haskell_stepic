-- Для того чтобы написать unfold, который порождает не только бесконечные списки
-- но и может работать с конечными списками, нужен тип данных Maybe

-- Maybe расширяет другие типы данных одним дополнительным значением

-- *Main> :t Nothing
-- Nothing :: Maybe a

-- *Main> :t Just
-- Just :: a -> Maybe a

-- применим Maybe к булевому значению

-- *Main> :t Just True
-- Just True :: Maybe Bool
-- в типе Maybe Bool промимо значения Just True\False есть еще Nothing
-- то есть наш булев тип с помощью упаковки в контейнер Maybe получил 
-- дополнительное значение - ответ не известен

import Data.List

-- *Main> find odd [1, 2, 4]
-- Just 1

-- *Main> find odd [ 2, 4]
-- Nothing

-- *Main> :t lookup 
-- lookup :: Eq a => a -> [(a, b)] -> Maybe b --ассоциативный список
-- ищем пару по ключу

-- *Main> lookup 2 [(2, 'a'), (3, 'b')]
-- Just 'a'

-- теперь можем реализовать функцию unfoldr для конечного списка

unfoldr' :: (b -> Maybe (a, b)) -> b -> [a]
unfoldr' f ini = helper (f ini) where
    helper (Just (x, ini')) = x : unfoldr' f ini'
    helper Nothing          = []

-- *Main> unfoldr' (\x -> if x==10 then Nothing else Just (x, x+2)) 0
-- 0,2,4,6,8]

-- https://stepik.org/lesson/6196/step/9?unit=1229
-- свертка должна быть хорошим консьюмером, развертки хорошими продьюсерами