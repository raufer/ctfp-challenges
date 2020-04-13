
(>=>) :: (a -> Maybe b) -> (b -> Maybe c) -> (a -> Maybe c)

m1 >=> m2 = \x -> case m1 x of
                  Just y -> m2 y
                  Nothing -> Nothing

return :: a -> Maybe a
return x = Just x

safe_reciprocal :: Double -> Maybe Double
safe_reciprocal 0 = Nothing
safe_reciprocal x = Just (1 / x)

safe_root :: Double -> Maybe Double
safe_root x | x < 0 = Nothing
safe_root x = Just (sqrt x)

process :: Double -> Maybe Double
process = safe_root >=> safe_reciprocal

main :: IO ()
main = print (process 4)

