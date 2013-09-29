
{-# LANGUAGE OverloadedStrings #-}

module Sortable.Product (
                        Product(..),
                        FromJSON,
                        toJSON
)	where

import           Control.Applicative ((<$>), (<*>), empty)
import           Data.Aeson
import           Data.Text

data Product = Product {
              productName :: !Text,
              manufacturer :: Maybe Text,
              model :: Maybe Text,
              family :: Maybe Text,
              announcedDate :: Maybe Text
             } deriving (Show)

instance FromJSON Product where
    parseJSON (Object v) = Product <$>
                  v .: "product_name" <*>
                  v .:? "manufacturer" <*>
                  v .:? "model" <*>
                  v .:? "family" <*>
                  v .:? "announced-date"
    parseJSON _ = Control.Applicative.empty

instance ToJSON Product where
    toJSON (Product productName manufacturer model family announcedDate ) =
           object [ "product_name" .= productName
                  , "manufacturer" .= manufacturer
                  , "model" .= model
                  , "family" .= family
                  , "announced-data" .= announcedDate
                  ]

