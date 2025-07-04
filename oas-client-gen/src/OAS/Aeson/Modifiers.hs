module OAS.Aeson.Modifiers where

import Data.Char (toLower, toUpper)
import Deriving.Aeson

data ToLower

instance StringModifier ToLower where
  getStringModifier = fmap toLower

data LowerFirst

instance StringModifier LowerFirst where
  getStringModifier = lowerFirst

lowerFirst :: String -> String
lowerFirst = onFirst toLower

upperFirst :: String -> String
upperFirst = onFirst toUpper

onFirst :: (Char -> Char) -> String -> String
onFirst _ "" = ""
onFirst f (x : xs) = f x : xs
