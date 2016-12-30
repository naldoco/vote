module Vote where

type Candidate = String

-- First past the post
winner :: [Candidate] -> Candidate    -- Ord a => [a] -> a
winner _ = "Blue"

count :: Eq a => a -> [a] -> Int    -- Candidate -> [Candidate] -> Int
count x = length . filter (== x)

rmdups :: Eq a => [a] -> [a]    -- [Candidate] -> [Candidate]
rmdups []     = []
rmdups (x:xs) = x : (rmdups $ filter (/= x) xs)
