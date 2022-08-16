{-# OPTIONS_GHC -Wno-incomplete-patterns #-}
import Data.Numbers.Primes (primes)

-- Finds the smallest number that is divisible by all the numbers from 1 to n
smallestDiv n i
    | p > n = 1
    | p <= n = last (takeWhile (<n) [p^k| k<-[1..]]) * smallestDiv n (i+1)
    where p = primes !! i