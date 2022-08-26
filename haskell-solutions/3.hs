import Data.Numbers.Primes (primes)

-- First approach
-- keep dividing by the smallest factor until you reach the largest prime factor, 
-- then climb back out of the recursion giving a list of factor in descending order.
factorize :: Integral a => a -> [a] -> [a]
factorize 1 l = l
factorize n l = factorize (n `div` d) l++[d] -- function calls have precedence
    where d = head [y | y <- [2..], n `mod` y == 0]


-- Alternative approach
-- use the list of primes from Data.Numbers.Primes to check which one divides our number

factorize2 :: (Ord t, Integral t) => t -> Int -> [t]
factorize2 0 _ = []
factorize2 x i
    | p*p > x = [x]
    | x `mod` p==0 = p:factorize2 (x `div` p) 0
    | otherwise = factorize2 x (i+1)
    where
    p = primes!!i

main = do
    print $ maximum $ factorize 600851475143 []