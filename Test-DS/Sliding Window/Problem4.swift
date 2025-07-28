//
//  Problem4.swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 6/19/25.
//

import Foundation
import Testing

/*
 Permutation in String
 You are given two strings s1 and s2.

 Return true if s2 contains a permutation of s1, or false otherwise. That means if a permutation of s1 exists as a substring of s2, then return true.

 Both strings only contain lowercase letters.

 Example 1:

 Input: s1 = "abc", s2 = "lecabee"

 Output: true
 Explanation: The substring "cab" is a permutation of "abc" and is present in "lecabee".

 Example 2:

 Input: s1 = "abc", s2 = "lecaabee"

 Output: false
 Constraints:

 1 <= s1.length, s2.length <= 1000
 */

func checkInclusion(s1: String, s2: String) -> Bool {
	guard !s1.isEmpty && !s2.isEmpty else {
		return false
	}
	let windowSize = s1.count
	var countDict = [Character: Int]()
	for l in 0..<s2.count {
		var r = l
		countDict = [:]
		while r - l + 1 <= windowSize, r < s2.count {
			let newChar = s2[s2.index(s2.startIndex, offsetBy: r)]
			countDict[newChar] = 1 + (countDict[newChar] ?? 0)
			r += 1
		}
		// Check if countDict contains all elements of s1
		for c in s1 {
			if countDict[c] == nil {
				break
			} else {
				countDict[c]! -= 1
				if countDict[c] == 0 {
					countDict.removeValue(forKey: c)
				}
			}
		}
		if countDict.isEmpty {
			return true
		}
	}
	return false
}


@Test func checkInclusionExamples() {
	#expect(checkInclusion(s1: "abc", s2: "lecabee") == true)
}

@Test func checkInclusionGivenEmptyStrings() {
	#expect(checkInclusion(s1: "", s2: "abc") == false)
	#expect(checkInclusion(s1: "abc", s2: "abc") == true)
}
