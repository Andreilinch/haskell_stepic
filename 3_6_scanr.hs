-- Для правой свертки также можно сделать scan
-- алгоритм известен
-- 1 `f` (2 `f` (3 `f` ini))
-- нужно получить такой список
-- ~>> [1 `f` (2 `f` (3 `f` ini)), 2 `f` (3 `f` ini), 3 `f` ini, ini]

scanr :: (a -> b -> b) -> b -> [a] -> [b]
scanr _ ini [] = [ini]
scanr f ini (x:xs) = (x `f` q) : qs                     -- qs это 2 `f` (3 `f` ini), 3 `f` ini, ini
                    where qs@(q:_) = scanr f ini xs     -- дважды используем результат scanr: как qs целиком и только голову q

-- *Main> scanr (+) 0 [1, 2, 4, 6]
-- [13,12,10,6,0]

-- правое скпнирование не работает с бесконечными списками
