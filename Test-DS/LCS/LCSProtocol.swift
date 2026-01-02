//
//  LCSProtocol.swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 12/27/25.
//

import Foundation
import Playgrounds
protocol LCS {
	/// Given two strings text1 and text2, return the length of their longest common subsequence. If there is no common subsequence, return 0.
	func longestCommonSubsequenceRecursive(_ text1: String, _ text2: String) -> Int

	func longestCommonSubsequenceMemo(_ text1: String, _ text2: String) -> Int
	/// Top Down
	func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int

	///	Given two strings ‘X’ and ‘Y’, find the length of the longest common substring.
	///	Examples:
	///	Input : X = “GeeksforGeeks”, y = “GeeksQuiz”
	///	Output : 5
	func longestCommonSubstring(_ s1: String, _ s2: String) -> Int

	///	Given two sequences, print the longest subsequence present in both of them.
	///	Example:
	///	LCS for input Sequences “ABCDGH” and “AEDFHR” is “ADH” of length 3.
	func printLCS(_ s1: String, _ s2: String) -> String

	///	Given two strings str1 and str2, find the shortest string that has both str1 and str2 as subsequences.
	///	Examples:
	///	Input:   str1 = "geek",  str2 = "eke" Output: "geeke"
	func shortestCommonSupersequence(_ str1: String, _ str2: String) -> String

	/// Given two strings s1 and s2. The task is to remove/delete and insert the minimum number of characters from s1 to transform it into s2.
	/// It could be possible that the same character needs to be removed/deleted from one point of s1 and inserted at another point
	///	Example 1: Input: s1 = "heap", s2 = "pea" Output: 3
	/// Explanation: Minimum Deletion = 2 and Minimum Insertion = 1
	/// p and h are deleted from the heap, and then p is inserted at the beginning. One thing to note, though p was required it was removed/deleted first from its position and then it was inserted into some other position. Thus, p contributes one to the deletion count and one to the insertion count.
	/// Input: s1 = "geeksforgeeks", s2 = "geeks" Output: 8
	/// Explanation: 8 deletions, i.e. remove all characters of the string "forgeeks".
	func minInsertionAndDeletions(_ s1: String, _ s2: String) -> Int 
}

extension LCS {
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
