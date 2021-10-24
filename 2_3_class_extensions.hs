-- Расширение классов типов это механизм, похожий на наследование в ООП
-- (не наследование реализации, а наследование интерфейса)

class Eq a where
  (==), (/=):: a -> a -> Bool
  x /= y = not (x == y)
  x == y = not (x /= y)

-- класс Eq из 2_2_class_types

class (Eq a) => Ord a where --  (Eq a) => контекст класса типов Ord,означает что класс типов Ord расширяет класс типов Eq. То есть все что есть в обявлении класса типов Eq добавляется к Ord
  (<), (<=), (>=), (>) :: a -> a -> Bool
  max, min :: a -> a -> a
  compare :: a -> a -> Ordering

-- :i Ordering
-- type Ordering :: *
-- data Ordering = LT | EQ | GT (меньше, эвивалентно, больше)
--         -- Defined in ‘GHC.Types’
--         instance Eq Ordering -- Defined in ‘GHC.Classes’
--         instance Monoid Ordering -- Defined in ‘GHC.Base’
--         instance Ord Ordering -- Defined in ‘GHC.Classes’
--         instance Semigroup Ordering -- Defined in ‘GHC.Base’
--         instance Enum Ordering -- Defined in ‘GHC.Enum’
--         instance Show Ordering -- Defined in ‘GHC.Show’
--         instance Read Ordering -- Defined in ‘GHC.Read’
--         instance Bounded Ordering -- Defined in ‘GHC.Enum’

-- так как в Ordering уже есть меньше, эвивалентно и больше, все сравнения можно выразить
-- через функцию Compare, следовательно Minimal Complete Definition: either compare or <=
-- если задал функцию Compare - все остальное выводится, если задали <= - все остальное выводится
-- То есть, чтобы обьявить представителем класса тип Ord, нам достаточно реализовать одну из
-- двух жтих функций

-- допустимо также и множественное наследование:

class (Eq a, Printable a) => MyClass a where
  ...

-- в отличии от ООП, где реализовано наследованеи реализации, проблем с наследованием
-- интерфейса не возникает  
