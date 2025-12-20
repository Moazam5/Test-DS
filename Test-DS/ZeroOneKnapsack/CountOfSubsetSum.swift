//
//  CountOfSubsetSum.swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 12/12/25.
//

import Foundation

extension KnapsackProblems {
	/// Given an array `arr[]` of length `n` and an integer `target`, the task is to find the **number of subsets** with a sum equal to target.
	func countOfSubsetSum(_ list: [Int], _ sum: Int) -> Int {
		// If the target sum is negative, it's impossible to form with non-negative numbers.
		// This check is mostly for safety, as the `countSubsetsWithGivenDiff` should prevent negative sums.
		if sum < 0 {
			return 0
		}

		let numRows = list.count + 1
		let numCols = sum + 1

		var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: numCols), count: numRows)

		// Base case: There is one way to make a sum of 0 (by taking no elements).
		// This applies to an empty list (dp[0][0]=1) and subsequent rows (dp[i][0]=1).
		for i in 0..<numRows {
			dp[i][0] = 1
		}
		// dp[0][j] for j > 0 remains 0, meaning no way to make a non-zero sum with no elements.

		for i in 1..<numRows {
			// The inner loop for 'j' must start from 0 to correctly handle cases where
			// list[i-1] is 0 and the target sum 'j' is also 0.
			// (e.g., nums = [0], target = 0, s1Target = 0)
			for j in 0..<numCols {
				// If the current number can be included in the sum 'j'
				if list[i - 1] <= j {
					let includeItem = dp[i - 1][j - list[i - 1]]
					let excludeItem = dp[i - 1][j]
					dp[i][j] = includeItem + excludeItem
				} else {
					// If the current number is too large to be included, just exclude it.
					dp[i][j] = dp[i - 1][j]
				}
			}
		}
		return dp[numRows - 1][numCols - 1]
	}

	class Solution {
		func checkRecord(_ s: String) -> Bool {
			var absentCount: Int = 0
			var consecutiveLateCount: Int = 0
			
			for char in s {
				switch char {
					case "A":
						absentCount += 1
						// An 'A' resets any consecutive 'L' streak
						consecutiveLateCount = 0
					case "L":
						consecutiveLateCount += 1
					case "P":
						// A 'P' resets any consecutive 'L' streak
						consecutiveLateCount = 0
					default:
						// This case should ideally not be reached based on problem description,
						// but it's good practice to consider or assert.
						// For this problem, we can assume valid input.
						break
				}
				
				// Check eligibility criteria immediately after processing each character
				// This allows for early exit if a condition is violated
				if absentCount >= 2 {
					return false // Ineligible: 2 or more 'A's
				}
				
				if consecutiveLateCount >= 3 {
					return false // Ineligible: 3 or more consecutive 'L's
				}
			}
			
			// If the loop completes without returning false, it means all criteria are met.
			return true // Eligible for the award
			
		}
	}
}
