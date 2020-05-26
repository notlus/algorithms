//
//  length-of-last-word.swift
//
//  Created by Jeffrey Sulton on 5/17/20.
//  Copyright © 2020 Jeffrey Sulton. All rights reserved.
//
//  https://leetcode.com/problems/length-of-last-word
//
import Foundation

func lengthOfLastWord(_ words: String) -> Int {
    let wordsReversed = words.reversed()

    var count = 0
    var leadingWhitespace = wordsReversed.first == " "
    if leadingWhitespace {
        for character in wordsReversed {
            if character != " " {
                leadingWhitespace.toggle()
                count += 1
            } else if character == " " && leadingWhitespace == false {
                break
            }
        }
    } else {
        for character in wordsReversed {
            if character == " " {
                break
            }

            count += 1
        }
    }

    return count
}

let lolw = lengthOfLastWord("  Lc   Bi   QPTg  ")
print(lolw)
