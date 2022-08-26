module Primes (
    primes,
    factors,
    primePowers
) where
import Data.List (group)


-- Lazy list of primes
primes :: [Int]
primes = sieve [2..] 
    where sieve [] = []
          sieve (p:xs) = p : sieve [x | x <- xs, x `mod` p > 0]

-- Returns list of prime factors with multiplicity
factors :: Int -> [Int]
factors n = primeFactors n primes where
    primeFactors 1 _ = []
    primeFactors _ [] = []
    primeFactors m (p:ps) | m < p * p = [m]
                          | r == 0 = p : primeFactors q (p:ps)
                          | otherwise = primeFactors m ps
                          where (q, r) = quotRem m p

-- Prime factors and their powers
primePowers :: Int -> [(Int, Int)]
primePowers n = [(head x, length x)| x<- group $ factors n]