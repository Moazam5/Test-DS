//
//  EqualSumPartition.swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 12/11/25.
//

import Foundation

extension KnapsackProblems {
///	Given an integer array nums, return true if you can partition the array into two subsets such that the sum of the elements in both subsets is equal or false otherwise.
	func canPartition(_ nums: [Int]) -> Bool {
		let totalSum = nums.reduce(0, +)
		guard totalSum.isMultiple(of: 2) else {
			return false
		}
		let target = totalSum / 2

		return self.subsetSum(list: nums, sum: target)
	}
}
