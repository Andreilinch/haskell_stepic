module Demo

import Prelude hiding (and, or, all, any)

and, or :: [Bool] -> Bool

-- Если все значения истина - Истина, если хоть одно ложное - Ложь
and []     = True
and (x:xs) = x && and xs  -- рекурсивно разбираем список

-- Тоже самое, но или
or []      = False
or (x:xs)  = x || or xs

-- применяет унарный предикат ко всем элементам списка
all :: (a -> Bool) -> [a] -> Bool
all p = and . map p

-- Prelude> all odd [1, 3, 4, 54, 4]
-- False

-- присутсвует в нашем списке хотя бы один элемент, который удовлетворяет нашему предикату
any :: (a -> Bool) -> [a] -> Bool
any p = or . map p

-- Prelude> any odd [1, 3, 4, 54, 4]
-- True

-- Prelude> any odd [2, 2]
-- False

-- Функция revWords

