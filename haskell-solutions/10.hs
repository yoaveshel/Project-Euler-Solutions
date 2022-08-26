import Data.Numbers.Primes (primes)

-- Easy version using the list of primes from Data.Numbers.Primes
-- Returns the sum of all primes less than n
sumPrimes :: Integral a => a -> a
sumPrimes n = sum $ takeWhile (<n) primes

-- Slightly more complicated, generates its own prime list. Significantly slower
primeList :: Integral a => [a] -> [a] -> [a]
primeList ps [] = ps
primeList ps (p:rest) = primeList (p:ps) (filter ((/=0).(`mod` p)) rest)

sumPrimes' :: Integral a => a -> a
sumPrimes' n = sum $ primeList [] [2..n]