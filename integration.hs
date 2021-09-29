-- Реализуйте функцию, находящую значение определённого интеграла от заданной функции f
-- на заданном интервале [a,b] методом трапеций
-- (Используйте равномерную сетку; достаточно 1000 элементарных отрезков.)

integration :: (Double -> Double) -> Double -> Double -> Double
integration f a b | b > a = helper f a b 1 0
                  | b < a = helper f a b 1 0
                  | otherwise = 0
    where
        h = (b - a) / 1000000
        helper f a b acc 1000000 = h * (f a + f b + acc)
        helper f a b acc n = helper f (a + h) (b - h) (acc + f a) (n + 1)
