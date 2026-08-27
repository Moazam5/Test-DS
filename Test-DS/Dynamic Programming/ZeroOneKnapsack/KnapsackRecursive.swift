//
//  KnapsackRecursive.swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 12/7/25.
//

import Foundation

extension Knapsack {
	func knapsackRecursive(weights: [Int], values: [Int], capacity: Int) -> Int {
		if weights.isEmpty || values.isEmpty || capacity == 0 {
			return 0
		}

		// Consider the first item and recurse on the remainder (index+1)
		let firstWeight = weights[0]
		let firstValue = values[0]
		let restWeights = Array(weights.dropFirst())
		let restValues = Array(values.dropFirst())

		if firstWeight <= capacity {// NOTE: This is the main part
			// Option A: include the first item
			let include = firstValue + knapsackRecursive(weights: restWeights, values: restValues, capacity: capacity - firstWeight)
			// Option B: exclude the first item
			let exclude = knapsackRecursive(weights: restWeights, values: restValues, capacity: capacity)
			return max(include, exclude)
		} else {
			// Can't take the first item, skip it
			return knapsackRecursive(weights: restWeights, values: restValues, capacity: capacity)
		}
	}

	func knapsackMemo(weights: [Int], values: [Int], capacity: Int) -> Int {
		let n = weights .count
		var memo = Array(repeating: Array(repeating: -1, count: capacity + 1), count: n)

		func dfs(_ index: Int, _ capacity: Int) -> Int {
			if index == n || capacity == 0 {
				return 0
			}
			// Return cached result if present
			if memo[index][capacity] != -1 {
				return memo[index][capacity]
			}
			var res = 0
			if weights[index] <= capacity {
				let include = values[index] + dfs(index + 1, capacity - weights[index])
				let exclude = dfs(index + 1, capacity)
				res = max(include, exclude)
			} else {
				res = dfs(index + 1, capacity)
			}
			memo[index][capacity] = res
			return res
		}
		return dfs(0, capacity)
	}
}
