//
//  LCSProblems.swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 12/28/25.
//

import Foundation

struct LCSProblems: LCS {
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

import Playgrounds
#Playground {
	let str1 = "abc"
	let str2 = "def"
	let str3 = str1 + str2
	let lcs = LCSProblems()
	lcs.shortestCommonSupersequence("geek", "eke")
	lcs.printLCS("geek", "eekee")
	print(str1 + str2)
}

