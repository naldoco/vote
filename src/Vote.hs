module Vote where

type Candidate = String

-- First past the post
winner :: [Candidate] -> Candidate    -- Ord a => [a] -> a
winner _ = "Blue"
