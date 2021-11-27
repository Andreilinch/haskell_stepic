-- Функции высших порядков для работы со списками

module Demo where

import Prelude hiding (filter, takeWhile, dropWhile, span, break)

filter :: (a -> Bool) -> [a] -> [a]
filter p [] = []                                    -- связываем предикат с p
filter p (x:xs)
    |  p x       = x : filter p xs
    |  otherwise = filter p xs 

-- *Main> filter (<3) [1, 3, 4, 5, 6,7 ,8 ,9, 0] 
-- [1,0]

takeWhile :: (a -> Bool) -> [a] -> [a]
takeWhile _ [] = []                                 -- если список пустой, то предикат даже не связываем
takeWhile p (x:xs)                                  -- далее аналогично filter разбтваем список на голову и хвост
    | p x       = x : takeWhile p xs                -- если предикат выполняется на голове добавляем этот элемент в список и рекурсивно вызываемся на хвосте
    | otherwise = []                                -- терминирующее условие как только предика не выполняется

-- *Main> takeWhile (<3) [1, 3, 4, 5, 6,7 ,8 ,9, 0] 
-- [1]
-- функция берет элементы списка до тех пор пока предикат выполняется

dropWhile :: (a -> Bool) -> [a] -> [a]
dropWhile _ [] = []                                
dropWhile p xs@(x:xs')                              -- синоним локальный псевдоним xs = (x:xs')            
    | p x       =  dropWhile p xs'                
    | otherwise =  xs 

-- *Main> dropWhile (<3) [1, 3, 4, 5, 6,7 ,8 ,9, 0] 
-- [3,4,5,6,7,8,9,0] 
-- пока предикат выполняется - элементы отбрасываются, ак только перестает - возвращается оставшийся хвост списка 

span :: (a -> Bool) -> [a] -> ([a],[a])
span p xs = (takeWhile p xs, dropWhile p xs)

-- *Main> span (<3) [1, 3, 4, 5, 6,7 ,8 ,9, 0] 
-- ([1],[3,4,5,6,7,8,9,0])

break :: (a -> Bool) -> [a] -> ([a], [a])
break p = span (not . p)

-- *Main> break (<3) [1, 3, 4, 5, 6,7 ,8 ,9, 0] 
-- ([],[1,3,4,5,6,7,8,9,0])

-- *Main> break (>3) [1, 3, 4, 5, 6,7 ,8 ,9, 0] 
-- ([1,3],[4,5,6,7,8,9,0])

