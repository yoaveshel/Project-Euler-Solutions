import Data.List (tails, transpose)

parse :: String -> [[Int]]
parse = map (map read . words) . lines

chunks :: Int -> [a] -> [[a]]
chunks n a
    | length chunk < n = []
    | otherwise = chunk : chunks n (tail a)
    where chunk = take n a

-- Returns an array of chuncks of rows of length n 
rows :: Int -> [[Int]] -> [[Int]]
rows n = concatMap (chunks n)

-- Like row, but with columns
columns :: Int -> [[Int]] -> [[Int]]
columns n = rows n . transpose

-- Given an integer n and a matrix A, returns the down-right diagonals of length n of the upper half of A.
-- e.g. if 
--      1 2 3
-- A =  4 5 6
--      7 8 9
-- then the function will return [[1,5], [5,9], [2,6]]
diagonals :: Int -> [[Int]] -> [[Int]]
diagonals n = columns n . zipWith drop [0..]

-- Given an integer n and a matrix A, returns all down-right the diagonals of length n.
-- tails gives a list of matrices witha decreasing number of rows, and so applying diagonals to each element in the list gives all the diagonals of A.
-- Some diagonals are counted twice
downRight :: Int -> [[Int]] -> [[Int]]
downRight n = concatMap (diagonals n) . tails

-- The down-left diagonals of A are the same as the down-right diagonals of a matrix with reverse column order
downLeft :: Int -> [[Int]] -> [[Int]]
downLeft n = downRight n . map reverse

largestProduct :: [[Int]] -> Int
largestProduct = maximum . map product

main :: IO ()
main = do
    str <- readFile "/home/yoaveshel/Dropbox/Programming/Project Euler Solutions/11/grid.txt"
    let grid = parse str
    print $ largestProduct $ concatMap (\f -> f 4 grid ) [rows, columns, downRight, downLeft]