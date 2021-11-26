module Demo where

import Prelude hiding (take, drop, split, (!!))

take :: Int -> [a] -> [a]
take n _       | n <= 0 =  []                 -- 1 связываем первый аргумент и игнорируем список
take _ []               =  []                 -- 2 неважно какое число мы передали если список пустой
take n (x:xs)           =  x : take (n-1) xs  -- если список не пустой и n больше 0, далее рекурсивно
                                              -- уменьшаем наше число n и сокращаем длину списка!
                                              -- если раньше кончится n, то 1 терминируещее условие
                                              -- если раньше кончится список, то 2

-- *Main> take 5 "Hello World"
-- "Hello"

drop :: Int -> [a] -> [a]
drop n xs      | n <= 0 =  xs                 -- 1 есди n 0 возвращаем хвост списка
drop _ []               =  []                 -- 2 отбрасываем все элементы и возвращаем пустой список
drop n (_:xs)           =  drop (n-1) xs      -- рекурсивно уменьшаем список

-- *Main> drop 5 "Hello World"
-- " World"

splitAt :: Int -> [a] -> ([a], ([a],[a]))     -- Функция выражается через drop и take
splitAt n xs   =  (take n xs, drop n xs)

-- *Main> splitAt 3 "Hello World"
-- ("Hel","lo World")

xs      !! n | n < 0 = error "negative index" 
[]      !! _         = error "index too large"
(x:_)   !! 0         = x                     -- возвращает элемент на 0 индексе, то есть на месте n передаваемого списка
(_:xs)  !! n         = xs !! (n-1)           -- рекурсивно вызываем оператор на хвосте списка
                                             -- и уменьшаем длину списка

-- *Main> "Hello World" !! 1
-- 'e'
-- *Main> "Hello World" !! 0
-- 'H'