module Test.Main where
  
import Prelude
import Effect (Effect)
import Data.List.Types (List(..), (:))
import TwoThousandFortyEight (Move(..), Grid, move)
import Test.Assert (assert)

grid :: Grid
grid = ((0 : 0 : 0 : 0 : Nil) :
        (0 : 8 : 4 : 4 : Nil) :
        (0 : 0 : 0 : 0 : Nil) :
        (0 : 0 : 2 : 2 : Nil) : Nil)

gridLeft :: Grid
gridLeft = ((0 : 0 : 0 : 0 : Nil) :
            (8 : 8 : 0 : 0 : Nil) :
            (0 : 0 : 0 : 0 : Nil) :
            (4 : 0 : 0 : 0 : Nil) : Nil)

gridRight :: Grid
gridRight = ((0 : 0 : 0 : 0 : Nil) :
            (0 : 0 : 8 : 8 : Nil) :
            (0 : 0 : 0 : 0 : Nil) :
            (0 : 0 : 0 : 4 : Nil) : Nil)

gridUp :: Grid
gridUp = ((0 : 8 : 4 : 4 : Nil) :
          (0 : 0 : 2 : 2 : Nil) :
          (0 : 0 : 0 : 0 : Nil) :
          (0 : 0 : 0 : 0 : Nil) : Nil)

gridDown :: Grid
gridDown = ((0 : 0 : 0 : 0 : Nil) :
            (0 : 0 : 0 : 0 : Nil) :
            (0 : 0 : 4 : 4 : Nil) :
            (0 : 8 : 2 : 2 : Nil) : Nil)

main :: Effect Unit
main = do
  assert (move Up    grid == gridUp)
  assert (move Down  grid == gridDown)
  assert (move Left  grid == gridLeft)
  assert (move Right grid == gridRight)