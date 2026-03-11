//
//  CoinChangeI.swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 12/26/25.
//

import Foundation

extension UnboundedKnapsackProblems {
	//	Coin Change Problem Maximum Number of ways
	//	Given a value N, if we want to make change for N cents, and we have infinite supply of each of S = { S1, S2, .. , Sm} valued coins, how many ways can we make the change? The order of coins doesn’t matter.
	//	Example:
	//	for N = 4 and S = {1,2,3}, there are four solutions: {1,1,1,1},{1,1,2},{2,2},{1,3}. So output should be 4.
	func coinChange(_ list: [Int], _ sum: Int) -> Int {
		// If the target sum is negative, it's impossible to form with non-negative numbers.
		// This check is mostly for safety, as the `countSubsetsWithGivenDiff` should prevent negative sums.
		if sum < 0 {
			return 0
		}

		let numRows = list.count + 1
		let numCols = sum + 1

		var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: numCols), count: numRows)

		// Base case: There is one way to make a sum of 0 (by taking no elements).
		// This applies to an empty list (dp[0][0]=1) and subsequent rows (dp[i][0]=1).
		for i in 0..<numRows {
			dp[i][0] = 1
		}
		// dp[0][j] for j > 0 remains 0, meaning no way to make a non-zero sum with no elements.

		for i in 1..<numRows {
			// The inner loop for 'j' must start from 0 to correctly handle cases where
			// list[i-1] is 0 and the target sum 'j' is also 0.
			// (e.g., nums = [0], target = 0, s1Target = 0)
			for j in 0..<numCols {
				// If the current number can be included in the sum 'j'
				if list[i - 1] <= j {
					let includeItem = dp[i][j - list[i - 1]]
					let excludeItem = dp[i - 1][j]
					dp[i][j] = includeItem + excludeItem
				} else {
					// If the current number is too large to be included, just exclude it.
					dp[i][j] = dp[i - 1][j]
				}
			}
		}
		return dp[numRows - 1][numCols - 1]
	}
}
