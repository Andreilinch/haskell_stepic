module Demo where

import Prelude (repeat, replicate, cycle, iterate)

repeat :: a - [a]
repeat x = xs where xs = x : xs     -- берем некоторое значение и повоторяем его бесконечно

-- Prelude> take 5 $ repeat 'x'
-- "xxxxx"
-- Prelude> 

replicate :: Int -> a -> [a]
replicate n x = tale n (repeat x)

-- Prelude> replicate 5 'x'
-- "xxxxx"
-- Prelude> 

cycle :: [a] -> [a]
cycle [] = error "empty list"
cycle xs = ys where ys = xs ++ ys    -- берем некоторый список и повоторяем его бесконечно

iterate :: (a -> a) -> a -> [a]
iterate f x  = x : iterate f (f x)

-- Prelude> take 3  $ iterate (^2) 2
-- [2,4,16]