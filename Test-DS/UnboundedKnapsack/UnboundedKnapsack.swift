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

#if canImport(Testing)
import Testing

@Suite("UnboundedKnapsack Tests")
struct UnboundedKnapsackTests {
	private let solver: UnboundedKnapsack = UnboundedKnapsackProblems()

	@Test("Basic example with multiple uses allowed")
	func basicExample() async throws {
		// Classic unbounded knapsack example
		// weights: [2, 3, 4], values: [4, 5, 7], capacity: 7
		// Optimal: 3 + 4 (weights) -> values 5 + 7 = 12, or 2 + 2 + 3 -> 4 + 4 + 5 = 13 (better)
		let weights = [2, 3, 4]
		let values  = [4, 5, 7]
		let capacity = 7
		let result = solver.unboundedKnapsack(weights, values, capacity: capacity)
		#expect(result == 13, "Expected best value 13 for capacity 7")
	}

	@Test("Zero capacity yields zero value")
	func zeroCapacity() async throws {
		let weights = [1, 2, 3]
		let values  = [10, 15, 40]
		let result = solver.unboundedKnapsack(weights, values, capacity: 0)
		#expect(result == 0)
	}

	@Test("Empty items yields zero")
	func emptyItems() async throws {
		let result1 = solver.unboundedKnapsack([], [], capacity: 10)
		#expect(result1 == 0)

		let result2 = solver.unboundedKnapsack([], [1,2,3], capacity: 10)
		#expect(result2 == 0)

		let result3 = solver.unboundedKnapsack([1,2,3], [], capacity: 10)
		#expect(result3 == 0)
	}

	@Test("Single item repeatable")
	func singleItemRepeatable() async throws {
		// One item weight 3, value 5; capacity 10 -> we can take 3 items (weight 9) value 15
		let weights = [3]
		let values  = [5]
		let capacity = 10
		let result = solver.unboundedKnapsack(weights, values, capacity: capacity)
		#expect(result == 15)
	}

	@Test("Mixed items correctness")
	func mixedItems() async throws {
		// weights: [5, 10, 15], values: [10, 30, 20], capacity: 100
		// Best is 10-weight item repeated: 10 * 30 = 300
		let weights = [5, 10, 15]
		let values  = [10, 30, 20]
		let capacity = 100
		let result = solver.unboundedKnapsack(weights, values, capacity: capacity)
		#expect(result == 300)
	}

	@Test("Larger capacity sanity check")
	func largerCapacity() async throws {
		// weights: [1, 3, 4], values: [1, 4, 5], capacity: 50
		// Greedy by value/weight suggests 4/3 ~ 1.333 and 5/4 = 1.25 and 1/1 = 1
		// Optimal DP result should be 4 * 50/3 approximated via DP; exact DP result is 66
		let weights = [1, 3, 4]
		let values  = [1, 4, 5]
		let capacity = 50
		let result = solver.unboundedKnapsack(weights, values, capacity: capacity)
		#expect(result == 66)
	}
}
#endif
