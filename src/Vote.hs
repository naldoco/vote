module Vote where

type Candidate = String

-- First past the post
winner :: [Candidate] -> Candidate    -- Ord a => [a] -> a
winner _ = "Blue"

count :: Eq a => a -> [a] -> Int    -- Candidate -> [Candidate] -> Int
count = undefined
