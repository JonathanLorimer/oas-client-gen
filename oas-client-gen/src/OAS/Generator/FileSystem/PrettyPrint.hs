module OAS.Generator.FileSystem.PrettyPrint where

import Data.Foldable (Foldable (..))
import Data.List.NonEmpty (NonEmpty (..))
import Data.List.NonEmpty qualified as NE
import Data.Text (Text)
import Data.Text qualified as T

quoted :: Text -> Text
quoted t = "\"" <> t <> "\""

prettyRecord :: Int -> NonEmpty Text -> Text
prettyRecord = prettySurround '{' '}'

prettyListWith :: Int -> [Text] -> Text
prettyListWith indent ts = case NE.nonEmpty ts of
  Nothing -> T.replicate indent " " <> "[]"
  Just ne -> prettySurround '[' ']' indent ne

prettySurround :: Char -> Char -> Int -> NonEmpty Text -> Text
prettySurround beg end indent = \case
  single :| [] ->
    fold
      [ indentText
      , T.cons beg " "
      , single
      , T.snoc " " end
      ]
  x :| xs ->
    fold
      [ indentText <> T.cons beg " " <> x <> "\n"
      , foldMap (\t -> indentText <> ", " <> t <> "\n") xs
      , T.snoc indentText end
      ]
 where
  indentText = T.replicate indent " "
