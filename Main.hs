{-# LANGUAGE OverloadedStrings #-}

module Main ( main )	where

import           Sortable.Product
import           Sortable.Listing

import           Data.Aeson
import qualified Data.ByteString.Lazy.Char8 as C

main :: IO()
main = do 
          products <- C.readFile "./data/products.txt"
          listings <- C.readFile "./data/listings.txt"
          print . map (\x-> decode x::Maybe Product) . C.lines $ products
          print . map (\x-> decode x::Maybe Listing) . C.lines $ listings

