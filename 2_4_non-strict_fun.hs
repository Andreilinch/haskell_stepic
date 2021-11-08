-- Ленивый механизм вычислений может приводить к интересным эффектам
-- Например можно элеминировать незавершаемость программы

module Demo where

const42 :: a -> Int
const42 = const 42

-- const42 игнорирует значение аргумента, поэтому в рамках ленивой модели 
-- вычисления мы можем передать в нее даже терминирующую функцию undefined

-- *Demo> const42 undefined
-- 42

-- функции подобные const42 называются нестрогими функциями
-- То есть если в функцию в качестве аргумента передано расходящееся вычисление,
-- (Diverging computation), а результатом является какое-то нерасходящееся значение
-- функция называется нестрогой
-- Компилятор может поменять модель вычислений на энергичную, если функция строгая

-- Задача
-- Отметьте функции, которые не могут привести к расходимости ни на каком 
-- корректном наборе аргументов.

foo a = a                               -- 1. 
bar = const foo                         -- 2. 
baz x = const True                      -- 3. 
quux = let x = x in x                   -- 4. 
corge = "Sorry, my value was changed"   -- 5. 
grault x 0 = x;grault x y = x           -- 6. 
garply = grault 'q'                     -- 7. 
waldo = foo                             -- 8. 

-- Ответ 3, 5

-- те смотрим может ли функция:
-- Уйти в бесконечную рекурсию
-- Вернуть undefined или error
-- Вычислять внутри себя undefined или error
