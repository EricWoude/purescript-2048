-- | Implements the game 2048 using purescript. It is highly inspired by
-- | the blog post "Implementing the game 2048 in less than 90 lines of Haskell"
-- | by Gregor Ulm (http://gregorulm.com/2048-in-90-lines-haskell/)

module TwoThousandFortyEight where

import Prelude (class Show, Unit, map, show, ($), (*), (+), (-), (==), (>))
import Control.Monad.Free (Free)
import Partial.Unsafe (unsafePartial)
import Data.List.Types (List(..), (:))
import Data.List (filter, length, concat, transpose, reverse, (!!), (..))
import Data.Unfoldable (replicate)
import Data.Maybe (fromJust)
import Data.Foldable (foldMap)

import Text.Smolder.HTML (table, td, tr) as H
import Text.Smolder.Markup (MarkupM, text) as H
import Text.Smolder.Renderer.String (render)

data Move = Up | Down | Left | Right
type Grid = List (List Int)

-- | The grid represents the 'board' of 2048 in row-column fashion.
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
move :: Move -> Grid -> Grid
move Left  grid' = map merge grid'
move Right grid' = map reverse $ move Left (map reverse grid')
move Up    grid' = transpose $ move Left (transpose grid')
move Down  grid' = transpose $ move Right (transpose grid')

-- | Takes the grid and returns the grid content in HTML table elements.
buildTable :: ∀ t27 t5. Show t5 => List (List t5) -> Free (H.MarkupM t27) Unit
buildTable grid' = H.table $ foldMap row (0 .. 3)
  where row i = H.tr $ foldMap (cell i) (0 .. 3)
        cell i j = H.td (H.text (show $ content i j ))
        content i j = unsafePartial fromJust $ (concat grid') !! (i * 4 + j)

-- | Returns the grid as string which is to be used in the Javascript application.
renderTable :: String
renderTable = do
  render (buildTable grid)