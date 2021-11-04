-- Класс enum определяет две функции для движению по перечеслительному типу
-- succ и pred

class Enum a where
  succ, pred :: a -> a  -- просто сдвигаемся на следующее значение, остоваясь в том же типе
  -- так как перечислениям можно предоставить некоторый номер, есть еще две функции
  toEnum :: Int -> a -- переводим значение типа Int в Enum
  fromEnum :: a -> Int -- и наобарот

-- succ 4
-- 5

-- succ 'z'
-- '{'

-- fromEnum 'z'
-- 122

-- toEnum 122 :: Float
-- 122.0

-- но функции succ и pred не определены на самом большом и самом маленьком
-- значениях 

-- succ True
-- *** Exception: Prelude.Enum.Bool.succ: bad argument

-- класс типов Bound нужен как раз для таких случаев

class Bounded a where
  minBound, maxBound :: a

-- minBound :: Bool
-- False

-- minBound :: Int
-- -9223372036854775808

-- единственный тип, который вляется перечислением, но при этом не является bounded это Integer
-- этот тип считается "бесконечным" 
-- Prelude> maxBound :: Integer

-- <interactive>:1:1: error:
--    • No instance for (Bounded Integer)
--        arising from a use of ‘maxBound’
--    • In the expression: maxBound :: Integer

