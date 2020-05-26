// https://leetcode.com/problems/number-of-1-bits

func hammingWeight(_ n: Int) -> Int {
        var hammingWeight = 0
        var currentValue = n
        while currentValue != 0 {
            let bitIsSet = currentValue & 1
            if bitIsSet != 0 {
                hammingWeight += 1
            }
            currentValue = currentValue >> 1
        }

        return hammingWeight
}

var hWeight = hammingWeight(0b11111111111111111111111111111101)
hWeight = hammingWeight(0b00000000000000000000000010000000)
