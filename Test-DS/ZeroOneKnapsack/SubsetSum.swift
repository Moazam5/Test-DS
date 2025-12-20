//
//  SubsetSum.swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 12/11/25.
//

import Foundation

struct KnapsackProblems: Knapsack {
	/// Given an array `list` of non-negative integers and a value sum, the task is to check if there is a subset of the given array whose sum is equal to the given sum.
	func subsetSum(list: [Int], sum: Int) -> Bool {
		let numRows = list.count + 1
		let numCols = sum + 1

		var dp: [[Bool]] = (0..<numRows).map { i in
			(0..<numCols).map { j in
				if j == 0 || (i == 0 && j == 0){
					return true
				} else {
					return false
				}
			}
		}
		for i in 1..<numRows {
			for j in 1..<numCols {
				if list[i - 1] <= j {
					let includeItem = dp[i - 1][j - list[i - 1]]
					let excludeItem = dp[i - 1][j]
					dp[i][j] = includeItem || excludeItem
				} else {
					dp[i][j] = dp[i - 1][j]
				}
			}
		}
		return dp[numRows - 1][numCols - 1]
	}
}
