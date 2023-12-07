func longestConsecutive(nums []int) int {
    set := map[int]bool{}

    for _, n := range nums{
        set[n] = true
    }

    res := 0
    
    for _, n := range nums{
        if set[n-1]{
            continue
        }

        consecutive := 1
        next := n + 1

        for set[next]{
            consecutive++
            next++
        }

        if consecutive > res{
            res = consecutive
        }
    }
  
    return res
}