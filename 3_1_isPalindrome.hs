-- Реализуйте функцию isPalindrome, которая определяет, является ли переданный ей список палиндромом.

-- GHCi> isPalindrome "saippuakivikauppias"
-- True
-- GHCi> isPalindrome [1]
-- True
-- GHCi> isPalindrome [1, 2]
-- False

isPalindrome :: Eq a => [a] -> Bool
isPalindrome s = if s == reverse s then True else False

-- Решения из комментов

isPalindrome :: Eq a => [a] -> Bool
isPalindrome x = reverse x == x

isPalindrome :: Eq a => [a] -> Bool
isPalindrome = \x -> reverse x == x >