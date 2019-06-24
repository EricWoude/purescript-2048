-- | Draws the grid implemented in TwoThousandFortyEight
-- | using Smolder.
-- |
-- | TODO: 
-- |   * Replace string renderer with DOM renderer
-- |   * Fill in type declaration for createTable

module Main where

import Prelude (Unit, show, ($), (*), (+))
import Effect (Effect)
import Effect.Console (log)
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
-- | TODO: Refactor this function so its more readable and has a better efficiency
createTable :: ∀ t27 t5. Show t5 => List (List t5) -> Free (H.MarkupM t27) Unit
createTable grid' = H.table $ foldMap row (0 .. 3)
  where row i = H.tr $ foldMap (cell i) (0 .. 3)
        cell i j = H.td (H.text (show $ content i j ))
        content i j = unsafePartial fromJust $ (concat grid') !! (i * 4 + j)

main :: Effect Unit
main = do
  log $ render (createTable grid)