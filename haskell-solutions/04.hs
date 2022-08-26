-- Find the largest palindrom that is the product of 2 n-digit numbers
palindrom :: Integer -> Integer
palindrom n = maximum [x*y| x<- [min..max], y<-[x..max], isPallindrom (x*y)]
    where isPallindrom x = show x == reverse (show x)
          min = 10^(n-1)
          max = 10^n-1

main :: IO ()
main = do
    print $ palindrom 3