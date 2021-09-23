-- Реализуйте функцию, находящую значение определённого интеграла от заданной функции f
-- на заданном интервале [a,b] методом трапеций
-- (Используйте равномерную сетку; достаточно 1000 элементарных отрезков.)

integration :: (Double -> Double) -> Double -> Double -> Double
integration f a b | b > a = helper f a b
                  | b < a = helper' f a b
                  | otherwise = 0
    where
        stepResolution = 1000
        h = (b - a) / stepResolution
        h' = (a - b) / stepResolution
        a1 = a + h
        b1 = b + h'
        c = (f a + f b) / 2
        helper f a1 b = h * (c + sum [f x | x <- [a1, h .. b-h]])
        helper' f a b1 = (-1) * (h') * (c + sum [f x | x <- [b1, h' .. a-h']])
