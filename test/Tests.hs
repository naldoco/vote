module Main where

import Test.Tasty
import Test.Tasty.HUnit

import Vote

votes :: [Candidate]
votes = ["Red", "Blue", "Green", "Blue", "Blue", "Red"]
blue :: Candidate
blue = "Blue"
red :: Candidate
red  = "Red"

-- Alternative vote
ballots :: [ [Candidate] ]
ballots =  [ ["Red", "Green"] ,
             ["Blue"] ,
             ["Green", "Red", "Blue"] ,
             ["Blue", "Green", "Red"] ,
             ["Green"] ]

ballots_e :: [ [ Candidate ] ]
ballots_e =  [ ["Green"] ,
             [] ,
             ["Green"] ,
             [] ,
             [] ]
ballots_wo_red = [ [ "Green"] ,
                 [ "Blue"] ,
                 [ "Green", "Blue"] ,
                 [ "Blue", "Green" ] ,
                 [ "Green"] ]

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
-- Alternative vote
    , testGroup "rmempty"
        [ testCase ("rmempty "++(show ballots_e)++" -> "++(show [["Green"],["Green"]])) $
            (rmempty ballots_e) @?= [["Green"],["Green"]]
        ]
    , testGroup "elim"
        [ testCase ("elim "++(show red)++" "++(show ballots)++" -> "++(show ballots_wo_red)) $
            (elim red ballots) @?= ballots_wo_red
        ]
    , testGroup "rank"
        [ testCase ("rank "++(show ballots)++" -> "++(show ["Red","Blue","Green"])) $
            (rank ballots) @?= ["Red","Blue","Green"]
        ]
    ]
main = defaultMain voteSuite
