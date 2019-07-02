-- | Draws the grid implemented in TwoThousandFortyEight
-- | using Smolder.

module Main (main) where

import Prelude (Unit, show, ($), (*), (+))
import Data.Foldable (foldMap)
import Data.List (concat, (..), (!!))
import Data.List.Types (List)
import Data.Maybe (fromJust)
import Data.Show
import Control.Monad.Free (Free)
import Partial.Unsafe (unsafePartial)

import Text.Smolder.HTML (table, td, tr) as H
import Text.Smolder.Markup (MarkupM, text) as H
import Text.Smolder.Renderer.String (render)

import TwoThousandFortyEight (grid)

-- | Takes the grid and returns the grid content in HTML table elements.
createTable :: ∀ t27 t5. Show t5 => List (List t5) -> Free (H.MarkupM t27) Unit
createTable grid' = H.table $ foldMap row (0 .. 3)
  where row i = H.tr $ foldMap (cell i) (0 .. 3)
        cell i j = H.td (H.text (show $ content i j ))
        content i j = unsafePartial fromJust $ (concat grid') !! (i * 4 + j)

-- | Returns the grid as string to be used in Javascript application.
main :: String
main = do
  render (createTable grid)