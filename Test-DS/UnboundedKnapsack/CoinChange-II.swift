//
//  CoinChange-II.swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 12/26/25.
//

import Foundation
import Playgrounds

extension UnboundedKnapsackProblems {
	func coinChangeII(_ coins: [Int], _ amount: Int) -> Int {
		if amount <= 0 {
			return 0
		}

		let numRows = coins.count + 1
		let numCols = amount + 1
		var dp = Array(repeating: Array(repeating: Int.max, count: numCols), count: numRows)

		// Base case: 0 coins needed to make amount 0
		for i in 0..<numRows {
			dp[i][0] = 0
		}

		// Fill the DP table
		for i in 1..<numRows {
			for j in 1..<numCols {
				let coinValue = coins[i - 1]
				// Don't use this coin
				dp[i][j] = dp[i - 1][j]

				// Use this coin (if possible)
				if coinValue <= j && dp[i][j - coinValue] != Int.max {
					dp[i][j] = min(dp[i][j], dp[i][j - coinValue] + 1)
				}
			}
		}

		return dp[numRows - 1][numCols - 1] == Int.max ? -1 : dp[numRows - 1][numCols - 1]
	}
}
