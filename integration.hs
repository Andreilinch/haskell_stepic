-- Реализуйте функцию, находящую значение определённого интеграла от заданной функции f
-- на заданном интервале [a,b] методом трапеций
-- (Используйте равномерную сетку; достаточно 1000 элементарных отрезков.)

integration :: (Double -> Double) -> Double -> Double -> Double

integration f a b | b > a = helper f a b
                  | b < a = helper' f a b
    where
        h = (b - a) / 1000
        h' = (a - b) / 1000
        const = (f a + f b) / 2
        helper f a b = h * (const + sum [f x | x <- [a, h .. b-2*h]])
        helper' f a b = (-1) * h' * (const + sum [f x | x <- [a, h' .. b-2*h']])
