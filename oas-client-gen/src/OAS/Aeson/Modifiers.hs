module OAS.Aeson.Modifiers where

import Data.Char (toLower, toUpper)
import Data.List (isPrefixOf, isSuffixOf)

lowerFirst :: String -> String
lowerFirst = onFirst toLower

upperFirst :: String -> String
upperFirst = onFirst toUpper

onFirst :: (Char -> Char) -> String -> String
onFirst _ "" = ""
onFirst f (x : xs) = f x : xs

stripPrefix :: String -> String -> String
stripPrefix prefix s
  | prefix `isPrefixOf` s = drop (length prefix) s
  | otherwise = s

stripSuffix :: String -> String -> String
stripSuffix suffix s
  | suffix `isSuffixOf` s = take (length s - length suffix) s
  | otherwise = s

rename :: String -> String -> String -> String
rename from to s
  | s == from = to
  | otherwise = s
