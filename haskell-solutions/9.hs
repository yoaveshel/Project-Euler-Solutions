--- Returns a pythagorean triplet (a,b,c) such that a+b+c=n
pythagoreanTrip :: Int -> [(Int, Int, Int)]
pythagoreanTrip n = [(a,b,1000-a-b)| a<-[1..n], b<-[a..n], a^2+b^2==(1000-a-b)^2]