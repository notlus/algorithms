var table = [Int:Int]()
func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    for (index, element) in nums.enumerated() {
        let remainder = target - element
        if let entry = table[remainder] {
            return [entry, index]
        }

        // Still looking, so add `element to the table
        table[element] = index
    }

    return []
}
