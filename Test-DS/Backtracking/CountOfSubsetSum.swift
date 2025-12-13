//
//  CountOfSubsetSum.swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 12/12/25.
//

import Foundation

extension KnapsackProblems {
	/// Given an array arr[] of length n and an integer target, the task is to find the number of subsets with a sum equal to target.
	func countOfSubsetSum(_ list: [Int], _ sum: Int) -> Int {
		let numRows = list.count + 1
		let numCols = sum + 1

		var dp: [[Int]] = (0..<numRows).map { i in
			(0..<numCols).map { j in
				if j == 0 || (i == 0 && j == 0){
					return 1
				} else {
					return 0
				}
			}
		}
		for i in 1..<numRows {
			for j in 1..<numCols {
				if list[i - 1] <= j {
					let includeItem = dp[i - 1][j - list[i - 1]]
					let excludeItem = dp[i - 1][j]
					dp[i][j] = includeItem + excludeItem
				} else {
					dp[i][j] = dp[i - 1][j]
				}
			}
		}
		return dp[numRows - 1][numCols - 1]
	}
}
