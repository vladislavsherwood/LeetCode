func topKFrequent(nums []int, k int) []int {
    count := make(map[int]int)
    freq := make([][]int, len(nums)+1)

    for _, n := range nums{
        count[n] = count[n] + 1
    }

    for n, c := range count{
        freq[c] = append(freq[c], n)
    }

    result := make([]int, 0)
    
    for i := len(freq) - 1; i > 0; i-- {
        result = append(result, freq[i]...)
        if len(result) >= k{
            return result[:k]
        }
    }
    return result
}