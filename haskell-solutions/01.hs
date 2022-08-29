multiplesOf5and3 :: Integral a => a -> [a]
multiplesOf5and3 n = filter (\a -> a `mod` 3 == 0 || a `mod` 5 == 0) [1..n]

alternative :: (Num a, Enum a) => a -> a
alternative n = sum [3,6..(n-1)]+sum[5,10..(n-1)]-sum[15,30..(n-1)]

main :: IO ()
main = do
    print $ sum $ multiplesOf5and3 1000