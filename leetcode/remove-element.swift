// https://leetcode.com/problems/remove-element

import Foundation

func moveToEnd(_ nums: inout [Int], _ index: Int, _ last: inout Int) -> Bool {
    if index == last {
        // Nowhere to move
        return false
    }

    // Value at the end cannot be moved, so look for the next candidate location. The candidate
    // location cannot be <= the current index.
    while nums[index] == nums[last] && last > index {
        last -= 1
    }

    if last <= index {
        // Nowhere to move
        return false
    }

    let tmp = nums[last]
    nums[last] = nums[index]
    nums[index] = tmp
    return true
}

func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
    if nums.isEmpty {
        return 0
    }

    if nums.count == 1 && val == nums[0] {
        // Match
        print("remove one")
        nums.remove(at: 0)
        return 0
    }

    if nums.count == 1 && val != nums[0] {
        return nums.count
    }

    var found = false
    var moved = false
    var newLength = nums.count - 1
    for (index, num) in nums.enumerated() {
        if num == val {
            found = true
            let m = moveToEnd(&nums, index, &newLength)
            if m {
                moved = m
            }
        }

        if index >= newLength {
            newLength = index
            break
        }
    }

    if newLength == 0 {
        nums.removeAll()
    }

    print("moved: \(moved)\tlength: \(newLength)\tcount: \(nums.count)\tfound: \(found)")
    return found ? newLength : nums.count
}

// var nums = [3,2,2,3]
var nums = [0, 1, 2, 2, 3, 0, 4, 2]
//var nums = [3, 3]
//var nums = [4, 5]

//var last = nums.count - 1
//moveToEnd(&nums, 0, &last)

print("before: \(nums)")
let count = removeElement(&nums, 2)
print("after: \(nums)")
print("count: \(count)")
let a = nums[0 ..< count]
print(a)
