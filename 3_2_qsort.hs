-- Напишите реализацию функции qsort. Функция qsort должная принимать на вход 
-- список элементов и сортировать его в порядке возрастания с помощью сортировки Хоара: 
-- для какого-то элемента x изначального списка (обычно выбирают первый) делить список 
-- на элементы меньше и не меньше x, и потом запускаться рекурсивно на обеих частях.
-- https://en.wikipedia.org/wiki/Quicksort

-- GHCi> qsort [1,3,2,5]
-- [1,2,3,5]

qsort :: Ord a => [a] -> [a]
qsort [] = []
qsort (x:xs) = qsort (filter (<x) xs) ++ (x : qsort (filter (>=x) xs))

-- неправильно
--qsort' :: Ord a => [a] -> [a]
--qsort' [] = []
--qsort' l@(x:xs) 
--    | last l <= x = last l : qsort' xs
--    | otherwise = qsort' xs -- ???

-- из комментов
qsort'' :: Ord a => [a] -> [a]
qsort'' [] = []
qsort'' (x:xs) =
    let smaller = qsort'' . filter (<=x) $ xs
        bigger = qsort'' . filter (>x) $ xs
    in smaller ++ [x] ++ bigger