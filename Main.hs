{-# LANGUAGE OverloadedStrings #-}

module Main ( main )	where

import          Sortable.Product

import           Data.Aeson
import qualified Data.ByteString.Lazy.Char8 as C

main :: IO()
main = do 
          contents <- C.readFile "./data/products.txt"
          print . map (\x-> decode x::Maybe Product) . C.lines $ contents

