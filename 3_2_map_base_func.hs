<<<<<<< HEAD
=======
module Demo

>>>>>>> e2a4466c5c1981cb1c907d714eacd8118bcd1064
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

<<<<<<< HEAD
-- Пример:
-- Нужно взять текст и развернуть каждое слово в нем (функция revWords)

-- 1) Разиваем текст на отдельные слова с помощью функции words
-- 2) После этого нужно будет собирать список обратно - функция unwords
--    unwords . words $ "Abc is not ABC"
-- 3) Теперь между вызовами words и unwords нужно применять reverse к каждому элементу списка
--    unwords . map reverse . words $ "Abc is not ABC"

-- В итоге
revWords :: String -> String
let revWords = unwords . map reverse . words


-- Prelude> let revWords = unwords . map reverse . words
-- Prelude> revWords "Abc is not ABC"
-- "cbA si ton CBA"
=======
-- Функция revWords

>>>>>>> e2a4466c5c1981cb1c907d714eacd8118bcd1064
