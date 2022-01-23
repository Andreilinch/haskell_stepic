-- Тип LogLevel описывает различные уровни логирования.

data LogLevel = Error | Warning | Info deriving (Eq, Ord)

-- Определите функцию cmp, сравнивающую элементы типа LogLevel так, чтобы было верно, что Error > Warning > Info.
{-
    GHCi> cmp Error Warning
    GT
    GHCi> cmp Info Warning
    LT
    GHCi> cmp Warning Warning
    EQ
-}

cmp :: LogLevel -> LogLevel -> Ordering
cmp Error Error     = EQ
cmp Warning Warning = EQ
cmp Info Info       = EQ
cmp Error _         = GT
cmp Info _          = LT
cmp _ Error         = LT
cmp _ Info          = GT

cmp :: LogLevel -> LogLevel -> Ordering
cmp x y = compare (ord x)  (ord y) where
   ord Error = 3
   ord Warning = 2
   ord Info = 1
