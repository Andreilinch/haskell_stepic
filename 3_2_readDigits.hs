-- Напишите функцию readDigits, принимающую строку и возвращающую пару строк.
-- Первый элемент пары содержит цифровой префикс исходной строки, а второй - ее оставшуюся часть.

-- GHCi> readDigits "365ads"
-- ("365","ads")
-- GHCi> readDigits "365"
-- ("365","")

import Data.Char

readDigits :: String -> (String, String)
readDigits = span isDigit

-- решения из комментов

readDigits' :: String -> (String, String)
readDigits' [] = ([], [])
readDigits' (x:xs)
    | isDigit x =
      let (digits, rest) = readDigits' xs
      in (x : digits, rest)
    | otherwise = ("", x : xs)


readDigits'' x = (takeWhile isDigit x, dropWhile isDigit x)