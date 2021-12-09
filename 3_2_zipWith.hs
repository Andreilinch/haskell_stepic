module Demo where

import Prelude hiding (zipWith, zipWith3)

zipWith :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWith _ []        _    = []
zipWith _ _         []   = []
zipWith f (x:xs) (y:ys) = f x y : zipWith f xs ys

-- *Demo> zipWith (+) [1, 2] [3, 4, 5]  
-- [4,6]
-- zipWith3 аналогично но на 3 списках
