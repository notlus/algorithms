import Foundation

// Memoized fibonacci
var memoTable: [UInt: UInt] = [0: 0, 1: 1]
func memoFib(n: UInt) -> UInt {
    if let n = memoTable[n] {
        return n
    }
    else {
        // Do the computation
        let a = memoFib(n: n - 1) + memoFib(n: n - 2)
        memoTable[n] = a
        return a
    }
}

//print(memoFib(n: 0))
//print(memoFib(n: 1))
//print("memo:10=\(memoFib(n: 10))")
//print(memoFib(n: 75))

// Fibonacci sequence: 0 1 1 2 3 5
// TODO: Implement
func iterFib(n: UInt) -> UInt {
    if n == 0 {
        return 0
    }

    var result: UInt = 0
    for i in 1..<n {
        result = (i - 1) + (i - 2)
    }

    return result
}
