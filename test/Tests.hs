module Main where

import Test.Tasty
import Test.Tasty.HUnit

import Vote

votes :: [Candidate]
votes = ["Red", "Blue", "Green", "Blue", "Blue", "Red"]

voteSuite :: TestTree
voteSuite =
  testGroup "Vote tests"
    [ testGroup "winner"
        [ testCase ("winner "++ (show votes) ++ " -> " ++ show "Blue") $
            (winner votes) @?= "Blue"
        ]
    ]
main = defaultMain voteSuite
