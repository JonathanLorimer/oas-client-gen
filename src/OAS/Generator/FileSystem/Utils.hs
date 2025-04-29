module OAS.Generator.FileSystem.Utils where

import Data.Text (Text)
import OAS.Generator.OASType (OASPrimTy (..), OASType (..), Record (..))

getTypeName :: OASType -> Maybe Text
getTypeName (OASPrim _) = Nothing
getTypeName (OASArray _) = Nothing
getTypeName (OASMaybe _) = Nothing
getTypeName (OASObject r) = Just r.constructor
getTypeName (OASEnum name _) = Just name

getTypeReference :: OASType -> Text
getTypeReference (OASPrim primTy) = case primTy of
  PrimString -> "Text"
  PrimInt -> "Int"
  PrimFloat -> "Double"
  PrimBool -> "Bool"
getTypeReference (OASArray innerTy) = "[" <> getTypeReference innerTy <> "]"
getTypeReference (OASMaybe innerTy) = "Maybe " <> getTypeReference innerTy
getTypeReference (OASObject r) = r.constructor
getTypeReference (OASEnum name _) = name
