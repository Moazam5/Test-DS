//
//  CountNumSubsetsGivenDiff.swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 12/15/25.
//

import Foundation

extension KnapsackProblems {
	/// Given an array Arr[] and a difference diff, find the number of subsets that array can be divided so that each the difference between the two subset is the given diff.
	func countSubsetsWithGivenDiff(_ nums: [Int], diff: Int) -> Int {
		let totalSum = nums.reduce(0, +)

		// Calculate the required sum for the subset P (s1Target)
		// sum(P) = (diff + totalSum) / 2

		// Condition 1: (diff + totalSum) must be non-negative.
		// sum(P) cannot be negative as nums contains non-negative integers.
		if diff + totalSum < 0 {
			return 0
		}

		// Condition 2: (diff + totalSum) must be an even number.
		// If it's odd, sum(P) cannot be an integer, so no such subset P exists.
		if (diff + totalSum) % 2 != 0 {
			return 0
		}

		// Now we can safely calculate s1Target using integer division.
		let s1Target = (diff + totalSum) / 2

		// Pass the calculated s1Target to the subset sum counter.
		return self.countOfSubsetSum(nums, s1Target)
	}
}
