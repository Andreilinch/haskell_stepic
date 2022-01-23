-- В Хаскеле можно создвать свои собственные типы данных
-- с помощью конструктора типов

import Prelude hiding (Bool, True, False)

-- констрктор типов
data Bool = True | False        -- используем ключ слово data
                                -- и обозначаем реализацию - True | False (это значения которые тип может принимать)
                                -- эти значения называют конструкторами данных, разделяются вертикальной чертой 

alwaysTrue :: Int -> Bool       -- на уровне типа - имя типа
alwaysTrue n = True             -- на уровне выражения  - конструктор данных

-- для того чтобы определить функцию над типом данных исп. сопоставление с образцом

--data B = T | F

not' :: B -> B
not' T = F
not' F = T

-- если вызвать эту функцию будет ошибка
{- 
*Main> not' F
<interactive>:3:1: error:
    • No instance for (Show B) arising from a use of ‘print’
    • In a stmt of an interactive GHCi command: print it 
-}

-- наш тип данныз В не является представителем класса типов Show
-- можно сделать это автоматически с помощью deriving instances

data B = T | F deriving Show

not'' :: B -> B
not'' T = F
not'' F = T

-- *Main> not' F
-- T

-- можно частично определять функции
not''' :: B -> B
not''' T = F

-- на not''' F функция будет не определена
-- такие функции лучше не использовать, можно прописать варнинг для компилятора
-- :set -fwarn-incomplete-patterns 

-- Тип данных Color определен следующим образом

data Color = Red | Green | Blue

-- Определите экземпляр класса Show для типа Color, сопоставляющий каждому из трех цветов его текстовое представление.

-- GHCi> show Red
-- "Red"

instance Show Color where
    show Red = "Red"
    show Green = "Green"
    show Blue = "Blue"

-- по сути стандартные классы типов это тоже конструкторы типов

-- data Int = 1 | 2 | .. | 9223372036854775807

intToChar :: Int -> Char
intToChar 0 = '0'
intToChar 1 = '1'\
...
intToChar _ = 'N'

isZ :: Char -> Bool
isZ 'Z' = True
isZ _   = False

charToInt :: Char -> Int
charToInt '0' = 0
charToInt '1' = 1
charToInt '2' = 2
charToInt '3' = 3
charToInt '4' = 4
charToInt '5' = 5
charToInt '6' = 6
charToInt '7' = 7
charToInt '8' = 8
charToInt '9' = 9

-- for i in `seq 0 9`; do echo charToInt \'$i\' = $i; done

-- Определите (частичную) функцию stringToColor, которая по строковому 
-- представлению цвета как в прошлой задаче возвращает исходный цвет.

data Color = Red | Green | Blue

stringToColor :: String -> Color
stringToColor "Red" = Red
stringToColor "Green" = Green
stringToColor "Blue" = Blue


-- также сопоставление с образцом работает и для функции многих аргументов
-- https://stepik.org/lesson/4916/step/9?unit=1082
foo 1 2 = 3
foo 0 _ = 5

-- Успешное сопоставление с образцом означает только то, что формально аргументы подходят. 
-- А что в результате получится - это уже другой вопрос.