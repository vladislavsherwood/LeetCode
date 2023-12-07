func isPalindrome(s string) bool {
  i := 0
  l := len(s) - 1
  newStr := []rune(s)

  for i < l{
    left := unicode.ToLower(newStr[i])
    right := unicode.ToLower(newStr[l])

    if !LetterOrDigit(left){
      i++
      continue
    }

    if !LetterOrDigit(right){
     l--
     continue
    }

    if left != right{
      return false
    }
    
    i++
    l--
  }
  return true
}



func LetterOrDigit(s rune) bool{
  return unicode.IsLetter(s) || unicode.IsDigit(s)
}