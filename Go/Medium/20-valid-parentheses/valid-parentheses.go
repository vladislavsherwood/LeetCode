func isValid(s string) bool {
    // Define the mapping of closed brackets to their corresponding open brackets
    pairs := map[byte]byte{
        ')': '(',
        ']': '[',
        '}': '{',
    }
    
    // Initialize an empty stack
    stack := make([]byte, 0)
    
    // Iterate through each character in the input string
    for _, char := range []byte(s) {
        // Retrieve the corresponding open bracket for the current closed bracket
        pair, ok := pairs[char]
        
        // If the current character is an open bracket, push it onto the stack
        if !ok {
            stack = append(stack, char)
            continue
        }
    
        // If the stack is empty (no corresponding open bracket found), return false
        if len(stack) == 0 {
            return false
        }

        // Check if the current closed bracket corresponds to the last open bracket in the stack
        if stack[len(stack)-1] != pair {
            return false
        }

        // Pop the last element from the stack
        stack = stack[:len(stack) - 1]
    }
    
    // Check if there are no remaining unclosed open brackets in the stack
    return len(stack) == 0
}
