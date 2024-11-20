import Test.Hspec    (describe, hspec, it, shouldBe)
import Parcial (isPalindrome)

main :: IO ()
main = hspec $ do
  describe "Is Palindrome" $ do
    it "NEUQUEN" $ do
      isPalindrome "NEUQUEN" `shouldBe` True
    it "HELLO" $ do
      isPalindrome "HELLO" `shouldBe` False
