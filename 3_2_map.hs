module Demo where

import Prelude hiding (map, concat, concatMap)

map :: (a -> b) -> [a] -> [b]
map _ []  =  []
map f (x:xs) = f x : map f xs

-- *Demo> map (+2) [0, 2, 4, 6, 8]
-- [2,4,6,8,10]

-- *Demo> map (length) ["aaa", "bb", "c"]
-- [3,2,1]