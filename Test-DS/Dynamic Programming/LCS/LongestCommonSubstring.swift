//
//  LongestCommonSubstring.swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 6/3/26.
//

import Foundation

import Playgrounds

extension LCSSolution {
	///	Given two strings ‘X’ and ‘Y’, find the length of the longest common substring.
	///	Examples:
	///	Input : X = “GeeksforGeeks”, y = “GeeksQuiz”
	///	Output : 5
	@discardableResult
	func longestCommonSubstring(_ s1: String, _ s2: String) -> Int {
		guard !s1.isEmpty || !s2.isEmpty else {
			return 0
		}
		let arr1 = Array(s1)
		let arr2 = Array(s2)
		let (m, n) = (s1.count, s2.count)
		var dp = Array(repeating: Array(repeating: 0, count: n + 1), count: m + 1)
		var count = 0

		for i in 1...m {
			for j in 1...n {
				if arr1[i - 1] == arr2[j - 1] {
					dp[i][j] = 1 + dp[i - 1][j - 1]
					count = max(count, dp[i][j])
				} else {
					dp[i][j] = 0
				}
			}
		}
		return count
	}
}

#Playground {
	LCSSolution.shared.longestCommonSubstring("geek", "eke")
	LCSSolution.shared.longestCommonSubstring("abcde", "abfce")
}
