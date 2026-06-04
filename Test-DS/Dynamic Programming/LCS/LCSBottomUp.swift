//
//  LCSBottomUp.swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 6/3/26.
//

import Foundation
import Playgrounds

extension LCS {
	/// Solution where the input is string
	func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
		let (m, n) = (text1.count, text2.count)
		let arr1 = Array(text1)
		let arr2 = Array(text2)
		guard !arr1.isEmpty && !arr2.isEmpty else {
			return 0
		}
		var dp = Array(repeating: Array(repeating: 0, count: n + 1), count: m + 1)

		for i in 1...m {
			for j in 1...n {
				if arr1[i - 1] == arr2[j - 1] {
					dp[i][j] = 1 + dp[i - 1][j - 1]
				} else {
					dp[i][j] = max(dp[i - 1][j], dp[i][j - 1])
				}
			}
		}
		return dp[m][n]
	}

	/// Solution where input is an array
	func longestCommonSubsequence(_ arr1: [Int], _ arr2: [Int]) -> Int {
		let (m, n) = (arr1.count, arr2.count)
		guard !arr1.isEmpty && !arr2.isEmpty else {
			return 0
		}
		var dp = Array(repeating: Array(repeating: 0, count: n + 1), count: m + 1)

		for i in 1...m {
			for j in 1...n {
				if arr1[i - 1] == arr2[j - 1] {
					dp[i][j] = 1 + dp[i - 1][j - 1]
				} else {
					dp[i][j] = max(dp[i - 1][j], dp[i][j - 1])
				}
			}
		}
		return dp[m][n]
	}
}

#Playground {
	_ = LCSSolution.shared.longestCommonSubsequence("geek", "eke")
	/*
	 text1 = "ace", text2 = "abcde"
	""	a	b	c	d	e
""	0	0	0	0	0	0
 a	0	1	1	1	1	1
 c	0	1	1	2	2	2
 e	0	1	1	2	2	3

	 */
}
