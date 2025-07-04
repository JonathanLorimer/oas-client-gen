module OAS.Generator.FileSystem.Utils where

import Data.Text (Text)
import qualified Data.Map as M
import OAS.Generator.OASType (OASPrimTy (..), OASType (..), Record (..), getTypeName)

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
getTypeReference OASMap = "Map Text Value"
getTypeReference (OASRef typeName) = typeName  -- Use the referenced type name

-- | Check if a type contains OASMap fields (needs Map import)
containsOASMap :: OASType -> Bool
containsOASMap OASMap = True
containsOASMap (OASObject r) = any containsOASMap (M.elems r.fields)
containsOASMap (OASArray ty) = containsOASMap ty
containsOASMap (OASMaybe ty) = containsOASMap ty
containsOASMap (OASEnum _ tys) = any containsOASMap tys
containsOASMap _ = False
