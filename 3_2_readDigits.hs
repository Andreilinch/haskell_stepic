-- Напишите функцию readDigits, принимающую строку и возвращающую пару строк.
-- Первый элемент пары содержит цифровой префикс исходной строки, а второй - ее оставшуюся часть.

-- GHCi> readDigits "365ads"
-- ("365","ads")
-- GHCi> readDigits "365"
-- ("365","")

import Data.Char

readDigits :: String -> (String, String)
<<<<<<< HEAD
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
=======
readDigits (x:xs) = dropWhile (isDigit x) xs
-- readDigits [] = []
-- readDigits (x:xs)
--    | isDigit x == True = x : readDigits xs
--    | otherwise = []
>>>>>>> eefa6401b9157ee77f0cd047dd4b5ee13a9a1f4d
