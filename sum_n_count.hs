-- Реализуйте функцию, находящую сумму и количество цифр десятичной записи заданного целого числа.
-- Например:
-- GHCi> sum'n'count (-39)
-- (12,2)

sum'n'count :: Integer -> (Integer, Integer)
sum'n'count x | x == 0 = (0, 1)
              | otherwise = let
                             helper ac1 ac2 0 = (ac1, ac2)
                             helper ac1 ac2 n = helper (ac1 + abs(n) `mod` 10) (ac2 + 1) (abs (n) `div` 10)
                            in helper 0 0 x

-- Ура!)

-- Другие решения:

sum'n'count x = helper 0 0 (abs x)
    where
            helper 0 0 0       = (0, 1)
            helper sum count 0 = (sum, count)
            helper sum count value = helper (sum + mod value 10 ) (count + 1) (div value 10)
