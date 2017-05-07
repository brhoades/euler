prime_list :: [Integer] -> Integer -> [Integer]
prime_list acc tester = case (isPrime acc tester) of
  False   -> acc
  True    -> acc ++ [tester]
  where

isPrime acc tester = null factors
  where
    acc' = filter (<= (floor $ sqrt $ (fromIntegral tester :: Double))) acc
    factors = filter (\x -> (mod tester x == 0)) acc'

factors n = [ x | x <- [min, min-1..2], (mod n x) == 0]
  where
    min = (floor $ sqrt (fromIntegral n :: Double))

primefactors n = [ x | x <- factors', (isPrime factors' x)]
  where
    factors' = factors n

main = do
  print $ take 1 $ primefactors 600851475143

-- Get all primes below the passed integer
primes_naive :: Integer -> [Integer]
primes_naive n = foldl (prime_list) [] (2: numbers)
  where
    numbers = [ x | x <- [3, 5..n]]

largestFactors_naive n = primeFactors
  where
    primeFactors = filter (\ x -> mod n x /= 0) (primes_naive $ floor $ sqrt (fromIntegral n :: Double))
