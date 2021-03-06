-- Функция высшего порядка это функция котороая принимает в качестве аргумента другую функцию

-- Функции высших порядков очень часто встречаются в функциональных яп
-- Расммотрим такие функции в haskell на нескольких примерах:
-- 
-- 1) $ (https://typeclasses.com/featured/dollar)
-- 
-- ($) :: (a -> b) -> a -> b
-- Мы видем что это полиморфный тип. Оператор представляет собой функцию двух аргументов
-- левый аргумент (a -> b) это функция, левый аргумент a, это значение. Оператор применяет
-- свой первый аргумент к своему второму аргументу, следовательно, тип второго аргумента
-- оператора должен совпадать с типом параметра функции, который передается в первом аргументе
-- Результатом служит результат выполнения функции, которая передана как первый аргумент (b)

-- 2)
apply2 f x = f (f x)
--
-- Суть этого примера в том что показать, что если мы применим внешнюю функцию f к внутренней
-- результат которой b (мы сначала предполагаем, что у этого выражения тип точь в точь как у $)
-- никакой ошибки "функция ждала на вход тип a, получила тип b" не будет и то что у нас
-- происходит применение функции типа из а в б к значению типа б, просто означает, что тип
-- а и б это один и тот же тип
-- apply2 :: (t -> t) -> t -> t
-- Например (помнимм что тип должен быть один и тот же)
-- 
-- apply2 (+5) 22
-- 32
-- 
-- apply2 (+5) '22'
-- No instance for (Num [Char]) arising from the literal ‘5’
--
-- apply2 (++ "-MU") "Cows say"
-- "Cows say-MU-MU"

-- 3)
flip f y x = f x y

-- flip (/) 4 2 
-- 0.5
--
-- flip const 5 True
-- True
--
-- flip :: (a -> b -> c) -> b -> a -> c
--
-- В модуле Data.Function определена полезная функция высшего порядка
-- on :: (b -> b -> c) -> (a -> b) -> a -> a -> c
-- on op f x y = f x `op` f y
-- Она принимает четыре аргумента: бинарный оператор с однотипными аргументами (типа b), функцию f :: a -> b, возвращающую значение типа b, и два значения типа a. Функция on применяет f дважды к двум значениям типа a и передает результат в бинарный оператор.
-- Используя on можно, например, записать функцию суммирования квадратов аргументов так:
-- sumSquares = (+) `on` (^2)
-- 
-- Подсказка из комментариев:
--
-- on :: (b -> b -> c) -> (a -> b) -> a -> a -> c
--
-- Начнем "читать" определение с конца. Тип a -> a -> c говорит нам о том, что
-- мы принимаем 2 аргумента одного типа а и возвращаем значение другого типа с. Двигаемся влево.
-- Здесь мы видим функцию преобразования (вспомните, что она задается после `on`), которая
-- преобразует значение типа а в значение типа b. И, вспомнив функцию sumSquares, понимаем,
-- что эта функци будет применяться к только что рассмотренным аргументам а и а. После
-- применения такой функции, мы получим тоже два значения, но уже другого типа b.
-- Теперь, если мы взглянем на начало определения типа функции `on`, а именно на функцию
-- (b -> b -> c), то мы опять же легко поймем, что эта функция будет применена к только что преобразованным
-- значениям типа b. Что даст нам, в итоге, значение типа с, которое и будет результатом применения функции `on`.
--
-- Задача
-- Функция multSecond, перемножающая вторые элементы пар, реализована следующим образом
-- multSecond = g `on` h
--
-- g = undefined
--
-- h = undefined
--
-- Напишите реализацию функций g и h.
-- GHCi> multSecond ('A',2) ('E',7)
-- 14
-- 
-- g = (*)
--
-- h = snd
--
-- snd берет второй элемент, и потом их перемножаем
-- можно h сделать так h (x,y) = y
