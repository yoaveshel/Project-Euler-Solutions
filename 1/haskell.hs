sumOfMultiplesOf5and3 :: Integral a => a -> a
sumOfMultiplesOf5and3 n = sum [x | x <-[1..(n-1)], x `mod` 5 == 0 || x `mod` 3 == 0]


alternative :: (Num a, Enum a) => a -> a
alternative n = sum [3,6..(n-1)]+sum[5,10..(n-1)]-sum[15,30..(n-1)]