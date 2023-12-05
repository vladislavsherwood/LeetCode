func twoSum(nums []int, target int) []int {
    hash := make(map[int]int)
    for i, num := range nums {
        diff := target - num
        if idx, found := hash[diff]; found {
            return []int{idx, i}
        }
        hash[num] = i
    }
    return nil
}