fib :: Integer -> Integer
fib n
    | n == 1     = 0
    | n == 2     = 1
    | otherwise  = fib (n - 1) + fib(n - 2)

fibs = 0 : 1 : zipWith (+) fibs (tail fibs)

main = do
  print $ sum $ filter even $ takeWhile (< 4000000) fibs
