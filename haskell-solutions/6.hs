-- Returns the difference (1+2+...+n)^2 - (1^2+2^2+...+n^2)
sumDifference :: (Num a, Enum a) => a -> a
sumDifference n = sum [1..n]^2 - sum (map (^2) [1..n])