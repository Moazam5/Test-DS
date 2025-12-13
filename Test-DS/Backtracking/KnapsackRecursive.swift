//
//  KnapsackRecursive.swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 12/7/25.
//

import Foundation

protocol DynamicProgramming: Knapsack {}

protocol Knapsack {
	func knapsackRecursive(weights: [Int], values: [Int], capacity: Int) -> Int
	func knapsackTopDown(weights: [Int], values: [Int], capacity: Int) -> Int
}

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

		if firstWeight > capacity {
			// Can't take the first item, skip it
			return knapsackRecursive(weights: restWeights, values: restValues, capacity: capacity)
		} else {
			// Option A: include the first item
			let include = firstValue + knapsackRecursive(weights: restWeights, values: restValues, capacity: capacity - firstWeight)
			// Option B: exclude the first item
			let exclude = knapsackRecursive(weights: restWeights, values: restValues, capacity: capacity)
			// NOTE: This is the main part
			return max(include, exclude)
		}
	}
}

