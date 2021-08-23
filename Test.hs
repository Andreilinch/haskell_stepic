module Test where

sayHello = putStrLn "Hello World from module Test!"


-- Частитчное приминение фунции
let discount limit proc sum = if sum >= limit then sum * (100-proc)/100 else sum

let standartDiscount = discount 1000 5

-- standartDiscount 2000 > 900
