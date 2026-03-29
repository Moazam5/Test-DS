//
//  Knapsack.swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 3/29/26.
//

import Foundation

protocol Knapsack {
	func knapsackRecursive(weights: [Int], values: [Int], capacity: Int) -> Int
	func knapsackTopDown(weights: [Int], values: [Int], capacity: Int) -> Int

	// MARK: - Problems
	/// Given an array `list` of non-negative integers and a value sum, the task is to check if there is a subset of the given array whose sum is equal to the given sum.
	func subsetSum(list: [Int], sum: Int) -> Bool
	/// Given an integer array `nums`, return `true` if you can partition the array into two subsets such that the sum of the elements in both subsets is equal or `false` otherwise.
	func canPartition(_ nums: [Int]) -> Bool
	/// Given an array `arr[]` of length `n` and an integer `target`, the task is to find the **number of subsets** with a sum equal to target.
	func countOfSubsetSum(_ list: [Int], _ sum: Int) -> Int
	/// Given an array arr[] of size n, the task is to divide it into two sets S1 and S2 such that the absolute difference between their sums is minimum.
	func findMinDifference(_ list: [Int]) -> Int
	/// Given an array Arr[] and a difference diff, find the number of subsets that array can be divided so that each the difference between the two subset is the given diff.
	func countSubsetsWithGivenDiff(_ nums: [Int], diff: Int) -> Int
	/// You are given an integer array nums and an integer target.
	/// You want to build an expression out of nums by adding one of the symbols '+' and '-' before each integer in nums and then concatenate all the integers.
	func findTargetSumWays(_ nums: [Int], _ target: Int) -> Int
}
