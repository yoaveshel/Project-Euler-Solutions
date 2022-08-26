import Primes (primePowers)

triangles :: [Int]
triangles = scanl (+) 0 [1..]

numFactors :: Int ->  Int
numFactors n = product [k + 1 | (_, k) <- primePowers n]

main :: IO ()
main = print $ head $ dropWhile (\n -> numFactors n <= 500) triangles