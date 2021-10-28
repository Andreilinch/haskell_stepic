-- Имея функцию ip = show a ++ show b ++ show c ++ show d определите значения
-- a, b, c, d так, чтобы добиться следующего поведения:
-- GHCi> ip
-- "127.224.120.12"

-- через новый тип:
newtype AddDotAtEnd = AddDotAtEnd Int

instance Show AddDotAtEnd where
  show (AddDotAtEnd s) = show s ++ "."

  a = AddDotAtEnd 127
  b = AddDotAtEnd 224
  c = AddDotAtEnd 120
  d = 12

-- ЛИБО

a = 12
b = 7.22
c = 4.1
d = 20.12

-- мда...
