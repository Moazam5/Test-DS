//
//  LCSProtocol.swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 12/27/25.
//

import Foundation
import Playgrounds
protocol LCSProblems {
	/// Given two strings text1 and text2, return the length of their longest common subsequence. If there is no common subsequence, return 0.
	func longestCommonSubsequenceRecursive(_ text1: String, _ text2: String) -> Int

	func longestCommonSubsequenceMemo(_ text1: String, _ text2: String) -> Int
	/// Top Down
	func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int
}

extension LCSProblems {
	func longestCommonSubsequenceRecursive(_ text1: String, _ text2: String) -> Int {
		func dfs(m: Int, n: Int) -> Int {
			if (m == 0 || n == 0) {
				return 0
			}

			let mIndex = text1.index(text1.startIndex, offsetBy: m - 1)
			let nIndex = text2.index(text2.startIndex, offsetBy: n - 1)
			if text1[mIndex] == text2[nIndex] {
				return 1 + dfs(m: m - 1, n: n - 1)
			} else {
				return max(dfs(m: m - 1, n: n), dfs(m: m, n: n - 1))
			}
		}

		return dfs(m: text1.count, n: text2.count)
	}

	func longestCommonSubsequenceMemo(_ text1: String, _ text2: String) -> Int {
		let (m, n) = (text1.count, text2.count)
		let arr1 = Array(text1)
		let arr2 = Array(text2)
		var memo = Array(repeating: Array(repeating: -1, count: n + 1), count: m + 1)

		func dfs(m: Int, n: Int, memo: inout [[Int]]) -> Int {
			if (m == 0 || n == 0) {
				return 0
			}
			if memo[m - 1][n - 1] != -1 {
				return memo[m - 1][n - 1]
			}

			if arr1[m - 1] == arr2[n - 1] {
				memo[m - 1][n - 1] = 1 + dfs(m: m - 1, n: n - 1, memo: &memo)
			} else {
				memo[m - 1][n - 1] = max(dfs(m: m, n: n - 1, memo: &memo), dfs(m: m - 1, n: n, memo: &memo))
			}
			return memo[m - 1][n - 1]
		}

		return dfs(m: m, n: n, memo: &memo)
	}

	func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
		let (m, n) = (text1.count, text2.count)
		let arr1 = Array(text1)
		let arr2 = Array(text2)
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
		return dp[m - 1][n - 1]
	}
}
