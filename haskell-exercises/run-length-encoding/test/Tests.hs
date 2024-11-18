import Test.Hspec    (describe, hspec, it, shouldBe)
import RunLengthEncoding (encode, encode2, Element(..))

main :: IO ()
main = hspec $ do
  describe "encode" $ do
    it "empty string" $ do
      encode "" `shouldBe` []
    it "10 A" $ do
      encode "AAAAAAAAAA" `shouldBe` [(10, 'A')]
    it "Hello" $ do
      encode "Hello" `shouldBe` [(1, 'H'), (1, 'e'), (2, 'l'), (1, 'o')]

  describe "encode 2" $ do
    it "empty string" $ do
        encode2 "" `shouldBe` []
    it "10 A" $ do
        encode2 "AAAAAAAAAA" `shouldBe` [Repeat 'A' 10]
    it "Hello" $ do
        encode2 "Hello" `shouldBe` [One 'H',One 'e',Repeat 'l' 2,One 'o']