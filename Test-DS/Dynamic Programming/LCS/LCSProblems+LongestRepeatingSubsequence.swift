//
//  LCSProblems+LongestRepeatingSubsequence.swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 1/2/26.
//

import Foundation
import Playgrounds

extension LCSSolution {
	// TODO: Add tests for this, also need to add printing portion which would require function signature change.
	/// Given a string, print the longest repeating subsequence such that the two subsequence don’t have same string character at same position, i.e., any i’th character in the two subsequences shouldn’t have the same index in the original string.
	func longestRepeatingSubsequence(_ s: String) -> Int {
		let (m, n) = (s.count, s.count)
		let arr1 = Array(s)
		let arr2 = Array(s)
		guard !arr1.isEmpty && !arr2.isEmpty else {
			return 0
		}
		var dp = Array(repeating: Array(repeating: 0, count: n + 1), count: m + 1)

		for i in 1...m {
			for j in 1...n {
				if arr1[i - 1] == arr2[j - 1], i != j {
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
	let res = LCSSolution.shared.longestRepeatingSubsequence("aabebcdd") // 3
}
