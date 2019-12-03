import Foundation

/// https://leetcode.com/problems/reverse-integer
class IntReverser {

    public func reverse(_ x: Int) -> Int {
        var reversedNumbers = [Int]()

        var div = x
        var rem = 0
        var place = 0
        var result = 0

        while div != 0 {
            rem = div % 10
            div = div / 10
            place += 1
            reversedNumbers.append(rem)
        }

        for n in reversedNumbers {
            result += n * Int(pow(10.0, Double(place - 1)))
            place -= 1
        }

        if result > Int32.max || result < Int32.min {
            result = 0
        }

        return result
    }
}

public func ReverseInt(_ x: Int) -> Int {
    let reverser = IntReverser()

    let r = reverser.reverse(x)
    print(r)
    return r
}
