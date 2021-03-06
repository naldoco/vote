module Vote where

import Data.List

type Candidate = String

-- First past the post
winner :: Ord a => [a] -> a    -- [Candidate] -> Candidate
winner = snd . last . result

count :: Eq a => a -> [a] -> Int    -- Candidate -> [Candidate] -> Int
count x = length . filter (== x)

rmdups :: Eq a => [a] -> [a]    -- [Candidate] -> [Candidate]
rmdups []     = []
rmdups (x:xs) = x : (rmdups $ filter (/= x) xs)

result :: Ord a => [a] -> [(Int, a)]     -- [Candidate] -> [(Int, Candidate)]
result vs = sort [(count v vs , v) | v <- rmdups vs]

-- Alternative vote
rmempty :: Eq a => [[a]] -> [[a]]
rmempty = filter (/= [])

elim :: Eq a => a -> [[a]] -> [[a]]
elim x = map $ filter (/= x)

rank :: Ord a => [[a]] -> [a]
rank = map snd . result . map head

winner' :: Ord a => [[a]] -> a
winner' bs = case rank (rmempty bs) of
               [c]    -> c
               (c:cs) -> winner' (elim c bs)
