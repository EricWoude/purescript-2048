-- | Draws the grid implemented in TwoThousandFortyEight
-- | using Smolder.
-- |
-- | TODO: 
-- |   * Replace string renderer with DOM renderer
-- |   * Fill in type declaration for createTable

module Main where

import Prelude
import Effect
import Effect.Console (log)
import Data.Foldable (foldMap)
import Data.List (concat, (..), (!!))

import Text.Smolder.HTML as H
import Text.Smolder.Markup as H
import Text.Smolder.Renderer.String (render)

import TwoThousandFortyEight (grid)

-- | Takes the flattened grid and returns the grid content in HTML table elements.
createTable grid' = H.table $ foldMap row (0 .. 3)
  where row i = H.tr $ foldMap (cell i) (0 .. 3)
        cell i j = H.td (H.text (show (flatGrid !! (i * 4 + j)) ))
        flatGrid = concat grid'

main :: Effect Unit
main = do
  log $ render table
    where table = createTable grid