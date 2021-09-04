-- Последовательность чисел Фибоначчи 0, 1, 1, 2, 3, 5, 8, 13, 21... легко определить рекурсивно, задав два первых терминирующих значения и определив любое последующее как сумму двух непосредственно предыдущих:
--

fibonacci 0 = 0
fibonacci 1 = 1
fibonacci n = fibonacci (n - 1) + fibonacci (n - 2)

--
--Эта функция определена лишь для неотрицательных чисел.Измените определение функции fibonacci так, чтобы она была определена для всех целых чисел и порождала при отрицательных аргументах указанную последовательность.
--

fibonacci :: Integer -> Integer
fibonacci 0 = 0
fibonacci 1 = 1
fibonacci n = if n > 0 then fibonacci (n - 1) + fibonacci (n - 2) else fibonacci (n + 2) - fibonacci (n + 1)

-- или так

fibonacci :: Integer -> Integer
fibonacci n | n > 1     = fibonacci (n - 1) + fibonacci (n - 2)
            | n < 0     = fibonacci (n + 2) - fibonacci (n + 1)
            | otherwise = n
