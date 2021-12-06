-- Воспользовавшись функциями map и concatMap, определите функцию perms, 
-- которая возвращает все перестановки, которые можно получить из данного списка, в любом порядке.

-- GHCi> perms [1,2,3]
-- [[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]]

-- Считайте, что все элементы в списке уникальны, и что для пустого списка имеется одна перестановка.

-- perms l@(x:xs) = [x : xs] ++ perms xs
--perms l@(x:xs) = acc xs [x] []
--perms l@(x:xs) = [x] : reverse [xs]

-- *Main> map head [[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]]
-- [1,1,2,2,3,3]

--perms l = concatMap (\x -> [[x,x,x]]) l

--perms n = filter (\xs -> length xs == n) . map (take n) . tail

windows :: Int -> [a] -> [[a]]
windows n ar@(x:xs) 
  | n == length ar = [ar]
  | otherwise = (x:(take (n - 1) xs)) : (windows n xs)

-- из комментов

perms :: [a] -> [[a]]
perms []  = [[]]
perms x   = concatMap (\n -> map ((x !! n) :) (perms (take n x ++ drop (n + 1) x))) [0..(length x - 1)]

-- Вставляем первый элемент последовательно между элементами списка:

perms :: [a] -> [[a]]
perms [] = [[]]
perms (x:xs) = concatMap (ins x) (perms xs)
  where
    ins :: a -> [a] -> [[a]]
    ins x [] = [[x]]
    ins x (y:ys) = [x:y:ys] ++ (map (y:) (ins x ys))