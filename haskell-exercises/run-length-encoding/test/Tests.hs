import Test.Hspec    (describe, hspec, it, shouldBe)
import RunLengthEncoding (encode)

main :: IO ()
main = hspec $ do
  describe "encode" $ do
    it "empty string" $ do
      encode "" `shouldBe` []
    it "10 A" $ do
      encode "AAAAAAAAAA" `shouldBe` [(10, 'A')]
    it "Hello" $ do
      encode "Hello" `shouldBe` [(1, 'H'), (1, 'e'), (2, 'l'), (1, 'o')]
