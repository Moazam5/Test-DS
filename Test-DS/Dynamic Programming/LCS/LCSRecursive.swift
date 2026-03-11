//
//  LCSRecursive.swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 12/27/25.
//

import Foundation

extension LCS {
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
}
