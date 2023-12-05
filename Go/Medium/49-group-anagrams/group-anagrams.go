func groupAnagrams(strs []string) [][]string {

    anagrams := make(map[string][]string)
    for _, str := range strs{
        sortedStr := sortString(str)
        anagrams[sortedStr] = append(anagrams[sortedStr], str)
    }

    result := make([][]string,0,len(anagrams))
    for _, group := range anagrams{
        result = append(result, group)
    }
    return result
}

func sortString (s string) string{
    characters := strings.Split(s,"")
    sort.Strings(characters)

    return strings.Join(characters,"")
}