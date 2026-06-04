//
//  LCSMemo.swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 6/3/26.
//

import Foundation

extension LCS {
	func longestCommonSubsequenceMemo(_ text1: String, _ text2: String) -> Int {
		let (m, n) = (text1.count, text2.count)
		let arr1 = Array(text1)
		let arr2 = Array(text2)
		var memo = Array(repeating: Array(repeating: -1, count: n + 1), count: m + 1)
		
		func dfs(m: Int, n: Int, memo: inout [[Int]]) -> Int {
			if m == 0 || n == 0 {
				return 0
			}
			if memo[m][n] != -1 {
				return memo[m][n]
			}
			
			if arr1[m - 1] == arr2[n - 1] {
				memo[m][n] = 1 + dfs(m: m - 1, n: n - 1, memo: &memo)
			} else {
				memo[m][n] = max(dfs(m: m, n: n - 1, memo: &memo), dfs(m: m - 1, n: n, memo: &memo))
			}
			return memo[m][n]
		}
		
		return dfs(m: m, n: n, memo: &memo)
	}
}
