// https://leetcode.com/problems/two-sum

var table = [Int: Int]()
func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    for (index, element) in nums.enumerated() {
        let remainder = target - element
        if let entry = table[remainder] {
            return [entry, index]
        }

        // Still looking, so add `element` to the table
        table[element] = index
    }

    return []
}

public func TwoSum() {
    let input = [2, 7, 11, 15]
    let target = 9

    let result = twoSum(input, target)

    print(result)
}
