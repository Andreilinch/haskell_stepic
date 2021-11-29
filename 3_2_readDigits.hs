-- Напишите функцию readDigits, принимающую строку и возвращающую пару строк.
-- Первый элемент пары содержит цифровой префикс исходной строки, а второй - ее оставшуюся часть.

-- GHCi> readDigits "365ads"
-- ("365","ads")
-- GHCi> readDigits "365"
-- ("365","")

import Data.Char

readDigits :: String -> (String, String)
readDigits (x:xs) = dropWhile (isDigit x) xs
-- readDigits [] = []
-- readDigits (x:xs)
--    | isDigit x == True = x : readDigits xs
--    | otherwise = []
