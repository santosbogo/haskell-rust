import Test.Hspec    (describe, hspec, it, shouldBe)
import Main (method1, method2)

main :: IO ()
main = hspec $ do
  describe "method1 tests" $ do
    it "A" $ do
      method1 'A' `shouldBe` [F,T,F,F,F,F,F,T]
    it "B" $ do
      method1 'B' `shouldBe` [F,T,F,F,F,F,T, F]
    it "Char 0" $ do
      method1 '\0' `shouldBe` [F,F,F,F,F,F,F,F]
      
      
  describe "method2 tests" $ do
    it "AB" $ do
      method2 "AB" `shouldBe` [F,T,F,F,F,F,F,T,F,T,F,F,F,F,T,F]
    it "\"\"" $ do
      method2 "" `shouldBe` []
