//
//  KnapsackTopDown.swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 12/7/25.
//

import Foundation

extension Knapsack {
	func knapsackTopDown(weights: [Int], values: [Int], capacity: Int) -> Int {
		guard !weights.isEmpty, !values.isEmpty else {
			return 0
		}
		let numRows = 1 + values.count
		let numCols = 1 + capacity
		var dp: [[Int]] = (0..<numRows).map { i in
			(0..<numCols).map { j in
				if i == 0 || j == 0 {
					// Set first row or first column to the base value
					return 0 // This might seem redundant for now but can be replaced later with a different base case.
				} else {
					return 0 // All other cells are 0
				}
			}
		}

		for i in 1...values.count {
			for j in 0...capacity {
				if weights[i - 1] <= j {
					let includeItem = values[i - 1] + dp[i - 1][j - weights[i - 1]]
					let excludeItem = dp[i - 1][j]
					dp[i][j] = max(includeItem, excludeItem)
				} else {
					dp[i][j] = dp[i - 1][j]
				}
			}
		}

		return dp[numRows - 1][numCols - 1]
	}
}
