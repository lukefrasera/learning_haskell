doubleMe x = x + x

doubleUs x y = doubleMe x + doubleMe y

doubleSmallNumbers x = if x > 100
  then x
  else x*2

max' :: (Ord a) => a -> a -> a
max' a b
  | a > b = a
  | otherwise = b

compare' :: (Ord a) => a -> a-> Ordering
a `compare'` b
  | a > b = GT
  | a == b = EQ
  | otherwise  = LT

bmiTell :: (RealFloat a) => a -> a-> String
bmiTell weight height
  | bmi <= 18.5 = "You're underweight"
  | bmi <= 25.0 = "You'rf normal"
  | bmi < 30.0 = "You're fat"
  | otherwise = "you're a whale"
  where bmi = weight / height ^ 2

bmiTell' :: (RealFloat a) => a -> a -> String  
bmiTell' weight height  
  | bmi <= skinny = "You're underweight, you emo, you!"  
  | bmi <= normal = "You're supposedly normal. Pffft, I bet you're ugly!"  
  | bmi <= fat    = "You're fat! Lose some weight, fatty!"  
  | otherwise     = "You're a whale, congratulations!"  
  where bmi = weight / height ^ 2  
        skinny = 18.5  
        normal = 25.0  
        fat = 30.0 


calcBmis :: (RealFloat a) => [(a, a)] -> [a]
calcBmis xs = [bmi w h | (w, h) <- xs]
  where bmi weight height = weight / height ^ 2

quicksort :: (Ord a) => [a] -> [a]
quicksort [] = []
quicksort (x:xs) =
  let smallerOrEqual = [a | a <- xs, a <= x]
      larger = [a | a <- xs, a > x]
  in  quicksort smallerOrEqual ++ [x] ++ quicksort larger

search :: (Eq a) => [a] -> [a] -> Bool
search needle haystack =
  let nlen = length needle
  in foldl (\acc x -> if take nlen x == needle then True else acc) False (tails haystack)

  