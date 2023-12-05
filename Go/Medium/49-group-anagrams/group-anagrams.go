func groupAnagrams(strs []string) [][]string {
    anagrams := make(map[string][]string)

    var wg sync.WaitGroup
    var mu sync.Mutex

    for _, str := range strs{
        wg.Add(1)
        go func(s string){
            defer wg.Done()
            sortedStr := sortString(str)
            mu.Lock()
            anagrams[sortedStr] = append(anagrams[sortedStr], str)
            mu.Unlock()
        }(str)
        
    wg.Wait()
        
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