//
//  UnboundedKnapsack.swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 12/18/25.
//

import Foundation

protocol UnboundedKnapsack {
	/// Given a knapsack weight, say capacity and a set of n items with certain value vali and weight wti, The task is to fill the knapsack in such a way that we can get the maximum profit. This is different from the classical Knapsack problem, here we are allowed to use an unlimited number of instances of an item.
	func unboundedKnapsack(_ weights: [Int], _ values: [Int], capacity: Int) -> Int

	func coinChange(_ list: [Int], _ sum: Int) -> Int
	///	Coin Change Problem Minimum Numbers of coins
	///	Given a value V, if we want to make change for V cents, and we have infinite supply of each of C = { C1, C2, .. , Cm} valued coins, what is the minimum number of coins to make the change?
	///	Example:
	///
	///	Input: coins[] = {25, 10, 5}, V = 30
	///	Output: Minimum 2 coins required
	///	We can use one coin of 25 cents and one of 5 cents
	func coinChangeII(_ coins: [Int], _ amount: Int) -> Int
}

struct UnboundedKnapsackProblems: UnboundedKnapsack {
	func unboundedKnapsack(_ weights: [Int], _ values: [Int], capacity: Int) -> Int {
		guard !weights.isEmpty, !values.isEmpty else {
			return 0
		}
		let numRows = 1 + values.count
		let numCols = 1 + capacity
		// Initialize the array with the base case
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
				// Compare the current item weight with the current column weight
				if weights[i - 1] <= j {
					let includeItem = values[i - 1] + dp[i][j - weights[i - 1]]
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

