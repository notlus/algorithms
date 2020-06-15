// https://leetcode.com/problems/remove-all-adjacent-duplicates-in-string
// swiftc remove-adjacent-duplicates.swift

public class Solution {
    func removePairs(_ s: String) -> String {
        var newString = ""
        var lastC: Character?
        for (_, v) in s.enumerated() {
            if let last = lastC {
                // We have a previous character
                if last == v {
                    // Skip this pair
                    lastC = nil
                } else {
                    // Not skipping
                    newString.append(last)
                    lastC = v
                }
            } else {
                // Set the last character
                lastC = v
            }
        }

        if let last = lastC {
            newString.append(last)
        }

        return newString
    }

    func removeDuplicates(_ S: String) -> String {
        var output = ""
        var existing = removePairs(S)
        while true {
            let newString = removePairs(existing)
            if newString == existing {
                if output.isEmpty {
                    output.append(newString)
                }
                break
            }

            existing = newString

            output.append(newString)
        }

        return output
    }
}
let solution = Solution()
let noDuplicates = solution.removeDuplicates("abbaca")
print(noDuplicates)
