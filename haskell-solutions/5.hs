import Data.Numbers.Primes (primes)

-- Finds the smallest number that is divisible by all the numbers from 1 to n
smallestDiv :: Integral a => a -> Int -> a
smallestDiv n i
    | n >= p = last (takeWhile (<n) [p^k| k<-[1..]]) * smallestDiv n (i+1)
    | otherwise = 1
    where p = primes !! i

main :: IO ()
main = do 
    print $ smallestDiv 20 0