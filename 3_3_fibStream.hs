-- Реализуйте c использованием функции zipWith функцию fibStream, 
-- возвращающую бесконечный список чисел Фибоначчи.

-- GHCi> take 10 $ fibStream
-- [0,1,1,2,3,5,8,13,21,34]

fibStream :: [Integer]
--fibStream n = zipWith (+) (fibStream (n + 1)) (fibStream (n + 2))
fibStream = 0 : 1 : zipWith (+) fibStream (tail fibStream)