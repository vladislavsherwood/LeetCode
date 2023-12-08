func twoSum(numbers []int, target int) []int {
    for l,r := 0, len(numbers) - 1; l<r;{

        n := numbers[l] + numbers[r]
        if n == target{
            return []int{l+1, r+1}
        }

        if n > target{
            r--
        }
        
        if n < target{
            l++
        }
    }
    return []int{0,0}
}