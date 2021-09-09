module Demo where

-- отступы в Хаскеле распознаются компилятором и важны
-- глобальные обьявления начинаются с нулевого отступа

roots :: Double -> Double -> Double 
         -> (Double, Double)

-- не нулевой отступ значит что обьявление продолжается
-- можно переносить на сколько угодно строк, главное чтобы сохряналась логика
-- больший отступ безопасен, меньший может привести к ошибкам

roots a b c = 
  (
    (-b - sqrt (b ^ 2 - 4 * a * c )) / (2 * a)
  ,
    (-b + sqrt (b ^ 2 - 4 * a * c )) / (2 * a)
  )

-- отступы в функции roots для удобства чтения
--
-- в функции roots присутствует одно и тоже выражение выисление дискриминанта два раза
-- такую запись можно оптимизировать с помощью функции let...in

roots' a b c = 
    let d = sqrt (b ^ 2 - 4 * a * c) in -- локальное связывание
    ((-b - d) / (2 * a), (-b + d) / (2 * a))

-- связываний может быть несколько

roots'' a b c =
    let {d = sqrt (b ^ 2 - 4 * a * c); x1 = (-b - d) / (2 * a); x2 = (-b + d) / (2 * a)}
    in (x1, x2)

-- либо можно переписать функцию roots'' с использованием правила отступов

roots''' a b c = 
   let
     x1 = (-b - d) / aTwice
     x2 = (-b + d) / aTwice
     d = sqrt $ b ^ 2 - 4 * a * c
     aTwice = 2 * a
   in (x1, x2)

-- очень важно чтобы локальные связывания имели один и тот же отступ, если бы
-- переменная d имела еще один пробел перед собой, то рассматривалась как продолжение 
-- выражения x2 - это бы привело к ошибке

