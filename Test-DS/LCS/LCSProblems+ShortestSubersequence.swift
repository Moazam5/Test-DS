//
//  LCS+ShortestSubersequence.swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 1/2/26.
//

import Foundation

extension LCSProblems {
	func shortestCommonSupersequence(_ str1: String, _ str2: String) -> String {
		let arr1 = Array(str1)
		let arr2 = Array(str2)
		let (m, n) = (arr1.count, arr2.count)

		// Build DP table (same as LCS)
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

		// Backtrack to build SCS
		var (i, j) = (m, n)
		var result = ""

		while i > 0 && j > 0 {
			if arr1[i - 1] == arr2[j - 1] {
				// Characters match - include once
				result.append(arr1[i - 1])
				i -= 1
				j -= 1
			} else if dp[i - 1][j] > dp[i][j - 1] {
				// Take from str1
				result.append(arr1[i - 1])
				i -= 1
			} else {
				// Take from str2
				result.append(arr2[j - 1])
				j -= 1
			}
		}

		// Add remaining characters from str1
		while i > 0 {
			result.append(arr1[i - 1])
			i -= 1
		}

		// Add remaining characters from str2
		while j > 0 {
			result.append(arr2[j - 1])
			j -= 1
		}

		return String(result.reversed())
	}
}
