fibonnaci :: Integral a => a -> a
fibonnaci n = round((φ^n-ψ^n)/ sqrt 5)
    where φ = (1+sqrt 5)/2
          ψ = 1-φ

sumOfEvenFibonnaci :: Integral a => a -> a
sumOfEvenFibonnaci n = (sum . takeWhile (<n) . filter even . map fibonnaci) [1..]