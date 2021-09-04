-- так как Haskell чисто функциональный язык в нем нет понятия изменяемой переменной, следовательно невовозможно определить понятие цикла как в итеративыных языках, ведь нет никакой возможности отличить одну итерацию цикла от другой!
--
-- В функциональных языках инструментом повторяющихся вычислений служит рекурсия
--
-- Для задания рекурсивной функции необходимо соблюдать два условия
--
--1) вызовы функции в правой части должны осуществлять на значении параметра функции, отличного от формального параметра функции в левой части
--
--2) рекурсивные вызовы обязательно должны где-то прерываться, то есть должно быть терминирующее условие
--
module RecursiveTest where

factorial n = if n == 0 then 1 else n * factorial (n - 1)

{-
factorial 2
-- if 2 == 0 then 1 else 2 * factorial 1
-- 2 * factorial 1
-- 2 * (if 1 == 0 then 1 else 1 * factorial 0)
-- 2 * 1 * factorial 0
-- 2 * factorial 0
-- 2 * (if 0 == 0 then 1 else 0 * factorial (-1))
-- 2 * 1
-- 2
-}
--
-- можно переписать функцию в синтаксисе "сопоставляения с образцом"
-- 
-- factorial' 0 = 1
-- factorial' n = n * factorial' (n - 1)
-- будет тоже самое
--
-- Определите функцию, вычисляющую двойной факториал, то есть произведение натуральных чисел, не превосходящих заданного числа и имеющих ту же четность. Например: 7!!=7\cdot 5\cdot 3\cdot 17!!=7⋅5⋅3⋅1,  8!!=8\cdot 6\cdot 4\cdot 28!!=8⋅6⋅4⋅2. Предполагается, что аргумент функции может принимать только неотрицательные значения.
--
doubleFactorial n = if n == 0 || n == 1 then 1 else n * doubleFactorial (n - 2)
--
--есть возможность предусмотреть вывод сообщений функциями error и undefined
--
factorial'' 0 = 1
factorial'' n = if n < 0 then error "arg must be >= 0" else n * factorial'' (n - 1)

--undefined обычно применяют для еще не написанных частей программы если мы не знаем какой будет тип у каких-то элементов, так как элемент undefined является елементом любого типа и проверка типов гарантированно пройдет
--
--если условие сложное лучше воспользоваться охранными выражениями (guards)
--
factorial''' 0 = 1
factorial''' n | n < 0 = error "arg must be >= 0"
               | n > 0 = n * factorial''' (n - 1)
--
--можно переписать это вообще без сопостовления с образцом только с использованием охранных выражений
--
factorial4 :: Integer -> Integer
factorial4 n | n == 0 = 1
             | n > 0 = n * factorial4 (n - 1)
             | otherwise = error "arg must be >= 0"

-- с помощью дополнительной вспомогательной функции!
-- такая реализация во многих случаях позволяет повысить эффективность рекурсивных функций: 
-- При наивном определении
--
-- fibonacci n = fibonacci (n-1) + fibonacci (n-2) 
--             = (fibonacci (n-2) + fibonacci (n-3)) + (fibonacci (n-3) + fibonacci (n-4)) 
--             = ... 
-- число рекурсивных вызовов вырастает в два раза при уменьшении nn на единицу, асимптотика 2^n 
-- В версии с аккумулятором их (рекурсивных вызовов) будет nn, асимптотика линейная.
-- я запустил те же программы на входе 2×10^5. Время работы кода составило 16,1 и 16,7 секунд (с аккумулятором больше), а время работы сборщика мусора — 1,9 и 0,4 секунд (с аккумулятором меньше). То есть суммарно, опять же, вариант с аккумулятором незначительно, но быстрее. Зато использование памяти с аккумулятором было 3 Мб, а в наивном случае — 14 (!).
factorial5 :: Integer -> Integer

factorial5 n | n >= 0 = helper 1 n
             | otherwise = error "arg must be >= 0"
helper acc 0 = acc -- аккумулятор
helper acc n = helper (acc * n) (n - 1)
