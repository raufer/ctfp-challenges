
(>=>) :: (a -> Maybe b) -> (b -> Maybe c) -> (a -> Maybe c)

m1 >=> m2 = \x -> case m1 x of
                  Just y -> m2 y
                  Nothing -> Nothing

return :: a -> Maybe a
return x = Just x

add2 :: Int -> Maybe Int
add2 0 = Nothing
add2 a = Just (a + 2)

add3 :: Int -> Maybe Int
add3 a = Just (a + 3)

process :: Int -> Maybe Int
process = add2 >=> add3

main :: IO ()
main = print (process 0)

