-- Реализуйте функцию seqA, находящую элементы следующей рекуррентной последовательности
-- a_0 = 1, a_1 = 2, a_2 = 3, a_k = a_k-1 + a_k-2 - 2a_k-3; k принадлежит N, k >= 3

seqA :: Integer -> Integer
seqA n | n == 0 = 1
       | n == 1 = 2
       | n == 2 = 3
       | otherwise = seqA (n - 1) + seqA (n - 2) - 2 * seqA (n - 3)

-- seqA 20
-- -253
-- (0.12 secs, 43,775,360 bytes)
--
-- для n = 301 даже не считается)

-- пробую переписать с вспомогательной функцией

seqA' :: Integer -> Integer
seqA' n | n == 0 = 1
        | n == 1 = 2
        | n == 2 = 3
        | otherwise = helper 1 2 3 n
helper acc1 acc2 acc3 0 = acc1
helper acc1 acc2 acc3 n = helper (acc2) (acc3) (acc3 + acc2 - 2 * acc1) (n - 1)

-- *Main> seqA' 301
-- 1276538859311178639666612897162414
-- (0.01 secs, 269,024 bytes

seqA'' :: Integer -> Integer
seqA'' n | n == 0 = 1
         | n == 1 = 2
         | n == 2 = 3
         | otherwise = let
                           helper acc1 acc2 acc3 0 = acc1
                           helper acc1 acc2 acc3 n = helper (acc2) (acc3) (acc3 + acc2 - 2 * acc1) (n - 1)
                       in helper 1 2 3 n

-- то же самое сиспользованием let...in
