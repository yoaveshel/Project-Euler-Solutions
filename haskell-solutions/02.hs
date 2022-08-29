fibonnaci :: Integral a => a -> a
fibonnaci n = round((φ^n-ψ^n)/ sqrt 5)
    where φ = (1+sqrt 5)/2
          ψ = 1-φ

main :: IO ()
main = do
    print $ sum $ filter even $ takeWhile (<4000000) $ map fibonnaci [1..]