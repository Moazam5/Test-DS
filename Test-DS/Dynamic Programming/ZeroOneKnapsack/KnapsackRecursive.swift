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
//	/// Given an array `list` of non-negative integers and a value sum, the task is to check if there is a subset of the given array whose sum is equal to the given sum.
//	func subsetSum(list: [Int], sum: Int) -> Bool
//	/// Given an integer array `nums`, return `true` if you can partition the array into two subsets such that the sum of the elements in both subsets is equal or `false` otherwise.
//		func canPartition(_ nums: [Int]) -> Bool
//	/// Given an array `arr[]` of length `n` and an integer `target`, the task is to find the **number of subsets** with a sum equal to target.
//	func countOfSubsetSum(_ list: [Int], _ sum: Int) -> Int
//	/// Given an array Arr[] and a difference diff, find the number of subsets that array can be divided so that each the difference between the two subset is the given diff.
//	func countSubsetsWithGivenDiff(_ nums: [Int], diff: Int) -> Int 
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

