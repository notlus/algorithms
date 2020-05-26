// https://leetcode.com/problems/third-maximum-number/
// swiftc third-maximum-number

import Foundation

func thirdMax(_ nums: [Int]) -> Int {
    var max1 = nums[0], max2 = Int.min, max3 = Int.min

    for num in nums {
        if num > max1 {
            max3 = max2
            max2 = max1
            max1 = num
        } else if num > max2 && num < max1 {
            max3 = max2
            max2 = num
        } else if num > max3 && num < max2 {
            max3 = num
        }
    }

    return max3 == Int.min ? max1 : max3
}

var tmax = thirdMax([5, 2, 2])
print(tmax)
tmax = thirdMax([2, 2, 3, 1])
print(tmax)
tmax = thirdMax([3, 2, 1, 5])
print(tmax)
tmax = thirdMax([1, 2])
print(tmax)
tmax = thirdMax([1, 2, -2_147_483_648])
print(tmax)
tmax = thirdMax([1, -2_147_483_648, 2])
print(tmax)
