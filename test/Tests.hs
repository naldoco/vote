module Main where

import Test.Tasty
import Test.Tasty.HUnit

import Vote

votes :: [Candidate]
votes = ["Red", "Blue", "Green", "Blue", "Blue", "Red"]
blue :: Candidate
blue = "Blue"

voteSuite :: TestTree
voteSuite =
  testGroup "Vote tests"
    [ testGroup "winner"
        [ testCase ("winner "++(show votes)++" -> "++show "Blue") $
            (winner votes) @?= "Blue"
        ]
    , testGroup "count"
        [ testCase ("count "++(show blue)++" "++(show votes)++" -> "++(show 3)) $
            (count blue votes) @?= 3
        ]
    , testGroup "rmdups"
        [ testCase ("rmdups "++(show votes)++" -> "++(show ["Red","Blue","Green"])) $
            (rmdups votes) @?= ["Red","Blue","Green"]
        ]
    , testGroup "result"
        [ testCase ("result "++(show votes)++" -> "++(show [(1,"Green"),(2,"Red"),(3,"Blue")])) $
            (result votes) @?= [(1, "Green"), (2, "Red"), (3, "Blue")]
        ]
    ]
main = defaultMain voteSuite
