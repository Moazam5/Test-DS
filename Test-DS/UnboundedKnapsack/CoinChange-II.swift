//
//  CoinChange-II.swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 12/26/25.
//

import Foundation
import Playgrounds

extension UnboundedKnapsackProblems {
	/*
	 Coin Change Problem Minimum Numbers of coins
	 Given a value V, if we want to make change for V cents, and we have infinite supply of each of C = { C1, C2, .. , Cm} valued coins, what is the minimum number of coins to make the change?
	 Example:

	 Input: coins[] = {25, 10, 5}, V = 30
	 Output: Minimum 2 coins required
	 We can use one coin of 25 cents and one of 5 cents
	 */
	func coinChangeII(_ coins: [Int], _ amount: Int) -> Int {
		if amount == 0 {
			return 0
		}
		if amount < 0 {
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


import Testing

@Suite("CoinChangeII Tests")
struct CoinChangeIITests {
	@Test("Example from doc: coins {25,10,5}, amount 30 -> 2")
	func exampleDocCase() async throws {
		let kp = UnboundedKnapsackProblems()
		let result = kp.coinChangeII([25, 10, 5], 30)
		#expect(result == 2)
	}

	@Test("Simple exact match: coins {1,2,5}, amount 11 -> 3 (5+5+1)")
	func simpleExactMatch() async throws {
		let kp = UnboundedKnapsackProblems()
		let result = kp.coinChangeII([1, 2, 5], 11)
		#expect(result == 3)
	}

	@Test("Single coin type divides amount: coins {3}, amount 9 -> 3")
	func singleCoinDivides() async throws {
		let kp = UnboundedKnapsackProblems()
		let result = kp.coinChangeII([3], 9)
		#expect(result == 3)
	}

	@Test("Zero amount should be 0 coins")
	func zeroAmount() async throws {
		let kp = UnboundedKnapsackProblems()
		let result = kp.coinChangeII([1, 2, 5], 0)
		#expect(result == 0)
	}

	@Test("Amount negative should return 0 per implementation guard")
	func negativeAmount() async throws {
		let kp = UnboundedKnapsackProblems()
		let result = kp.coinChangeII([1, 2, 5], -3)
		#expect(result == 0)
	}

	@Test("Another set: coins {3,4,5}, amount 5 -> 1")
	func sampleFromPlayground() async throws {
		let kp = UnboundedKnapsackProblems()
		let result = kp.coinChangeII([3, 4, 5], 5)
		#expect(result == 1)
	}
}
