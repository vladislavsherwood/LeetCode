func isAnagram(s string, t string) bool {
    if len(s) != len(t) {
        return false
    }
    hash := make(map[rune]int)
    for _, letter := range s{
        hash[letter] += 1
    }
    for _, letter := range t{
        hash[letter] -= 1
    }
    for _, count := range hash{
        if count != 0{
            return false
        }
    }
    return true
}