module CoreSpec where

import qualified Hedgehog.Gen as Gen
import qualified Hedgehog.Range as Range
import Test.Hspec
import Test.Hspec.Hedgehog

spec :: Spec
spec =
  describe "my great test" $ do
    it "should be true" $
      True `shouldBe` True
    it "generates stuff" $
      hedgehog $ do
        xs <- forAll $ Gen.list (Range.linear 0 100) Gen.alpha
        reverse (reverse xs) === xs
