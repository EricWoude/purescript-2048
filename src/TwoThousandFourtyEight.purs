-- | Implements the game 2048 using purescript. It is highly inspired by
-- | the blog post "Implementing the game 2048 in less than 90 lines of Haskell"
-- | by Gregor Ulm (http://gregorulm.com/2048-in-90-lines-haskell/)

module TwoThousandFourtyEight where

import Prelude
import Data.List.Types (List(..), (:))
import Data.List (filter, length, concat, transpose, reverse)
import Data.Unfoldable (replicate)

data Move = Up | Down | Left | Right
type Grid = List (List Int)

grid :: Grid
grid = ((0 : 0 : 0 : 0 : Nil) :
        (0 : 0 : 0 : 0 : Nil) :
        (0 : 0 : 0 : 0 : Nil) :
        (0 : 0 : 2 : 2 : Nil) : Nil)

-- | Takes a list, removes the zeros, adds duplicate neighbouring numbers and adds padding.
merge :: List Int -> List Int
merge xs = concat (combined : padding : Nil)
  where padding = replicate (length xs - length combined) 0
        combined = combine $ filter (\n -> n > 0) xs

-- | Takes a list, combines two duplicate neighbouring elements in a list and returns list.
combine :: List Int -> List Int
combine (x:y:xs) = if x == y then x * 2 : combine (xs) else x : combine (y:xs)
combine x        = x

-- | Given the Grid and Move, do merge for all rows in the Grid.
move :: Grid -> Move -> Grid
move grid Left  = map merge grid
move grid Right = map reverse $ move (map reverse grid) Left
move grid Up    = transpose $ move (transpose grid) Left
move grid Down  = transpose $ move (transpose grid) Right