-- Преимущества и недостатки ленивой модели

add7 :: Int -> Int -> Int
add7 x y = x + 7

-- В рамках ленивой модели происходит подстановка
-- add7 1 (2 + 3)
-- 1 + 7
-- 8 
-- те за один шаг редукции выражение вычисляется без лишних операций

-- В энергичной модели сначала происходит вычисление второго аргумента
-- add7 1 (2 + 3)
-- add7 1 5
-- 1 + 7
-- 8 

-- в данном случае ленивая стратегия лучше, но бывают ситуации когда она хуже

dup :: Int -> (Int, Int)
dup x = (x, x)

-- Ленивая модель
-- dup (2+3) - подстановка
-- (2+3, 2+3) - вычисление аргумента происходит два раза
-- (5, 2+3)
-- (5, 5)

-- Энергичная модель
-- dup (2+3)
-- dup 5
-- (5, 5)

-- Вывод в общем виде:
-- Если какие-то параметры функции игнорируются - лучше ленивая стратегия
-- Если какие-то параметры используются несколько раз - лучше энергичная

-- Но в Хаскеле существует оптимизация для использования ленивой стратегии во
-- втором случае - механизм разделения

-- dup (2+3) - подстановка
-- (p, p) - p=5 - параметр ссылки на значение (2+3)
-- (5, p)
-- (5, 5)

-- Задача
-- Сколько шагов редукции потребуется, чтобы вычислить значение функции value, 
-- если используется ленивая стратегия вычислений с механизмом разделения?

bar x y z = x + y
foo a b = bar a a (a + b)
value = foo (3 * 10) (5 - 2)

-- Ответ 4
-- value = bar (3 * 10) (3 * 10) ((3 * 10) + (5 - 2))
-- value = (3 * 10) + (3 * 10)
-- value = 30 + 30
-- value = 60