//
//  LCSProblems+PrintLCS.swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 1/2/26.
//

import Foundation

extension LCSProblems {
	func printLCS(_ s1: String, _ s2: String) -> String {
		let arr1 = Array(s1)
		let arr2 = Array(s2)
		if arr1.isEmpty || arr2.isEmpty {
			return ""
		}

		let (m, n) = (arr1.count, arr2.count)
		var dp = Array(repeating: Array(repeating: 0, count: n + 1), count: m + 1) // takes care of the base case

		for i in 1...m {
			for j in 1...n {
				if arr1[i - 1] == arr2[j - 1] {
					dp[i][j] = 1 + dp[i - 1][j - 1]
				} else {
					dp[i][j] = max(dp[i - 1][j], dp[i][j - 1])
				}
			}
		}

		// Printing
		var (i, j) = (m, n)
		var str = ""
		while i > 0, j > 0 {
			if arr1[i - 1] == arr2[j - 1] {
				str.append(arr1[i - 1])
				i -= 1
				j -= 1
			} else if dp[i - 1][j] > dp[i][j - 1]{
				i -= 1
			} else {
				j -= 1
			}
		}
		return String(str.reversed())
	}
}
