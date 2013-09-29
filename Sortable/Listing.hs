
{-# LANGUAGE OverloadedStrings #-}

module Sortable.Listing (
                        Listing(..),
                        FromJSON,
                        ToJSON
)	where

import           Control.Applicative ((<$>), (<*>), empty)
import           Data.Aeson
import           Data.Text

data Listing = Listing {
             title :: !Text,
             manufacturer :: Maybe Text,
             currency :: Maybe Text,
             price :: Maybe Text
             } deriving (Show)

instance FromJSON Listing where
    parseJSON (Object v) = Listing <$>
                      v .: "title" <*>
                      v .:? "manufacturer" <*>
                      v .:? "currency" <*>
                      v .:? "price"
    parseJSON _ = Control.Applicative.empty

instance ToJSON Listing where
    toJSON (Listing title manufacturer currency price) =
              object [ "title" .= title
                     , "manufacturer" .= manufacturer
                     , "currency" .= currency
                     , "price" .= price
                     ]

