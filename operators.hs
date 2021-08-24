module Operators where

infixl 6 *+*
(*+*) a b = a ^ 2 + b ^ 2

infix 6 |-|
(|-|) x y = sqrt((x - y)^2)
