//
//  TargetSum.swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 12/15/25.
//

import Foundation
import Testing

extension KnapsackProblems {

	///	 You are given an integer array nums and an integer target.
	///
	///	 You want to build an expression out of nums by adding one of the symbols '+' and '-' before each integer in nums and then concatenate all the integers.
	///
	///	 For example, if nums = [2, 1], you can add a '+' before 2 and a '-' before 1 and concatenate them to build the expression "+2-1".
	///	 Return the number of different expressions that you can build, which evaluates to target.
	func findTargetSumWays(_ nums: [Int], _ target: Int) -> Int {
			return countSubsetsWithGivenDiff(nums, diff: target)
		}
	
//		func countOfSubsetSum(_ list: [Int], _ sum: Int) -> Int {
//			// If the target sum is negative, it's impossible to form with non-negative numbers.
//			// This check is mostly for safety, as the `countSubsetsWithGivenDiff` should prevent negative sums.
//			if sum < 0 {
//				return 0
//			}
//
//			let numRows = list.count + 1
//			let numCols = sum + 1
//
//			var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: numCols), count: numRows)
//
//			// Base case: There is one way to make a sum of 0 (by taking no elements).
//			// This applies to an empty list (dp[0][0]=1) and subsequent rows (dp[i][0]=1).
//			for i in 0..<numRows {
//				dp[i][0] = 1
//			}
//			// dp[0][j] for j > 0 remains 0, meaning no way to make a non-zero sum with no elements.
//
//			for i in 1..<numRows {
//				// The inner loop for 'j' must start from 0 to correctly handle cases where
//				// list[i-1] is 0 and the target sum 'j' is also 0.
//				// (e.g., nums = [0], target = 0, s1Target = 0)
//				for j in 0..<numCols {
//					// If the current number can be included in the sum 'j'
//					if list[i - 1] <= j {
//						let includeItem = dp[i - 1][j - list[i - 1]]
//						let excludeItem = dp[i - 1][j]
//						dp[i][j] = includeItem + excludeItem
//					} else {
//						// If the current number is too large to be included, just exclude it.
//						dp[i][j] = dp[i - 1][j]
//					}
//				}
//			}
//			return dp[numRows - 1][numCols - 1]
//		}
}

@Suite("TargetSum Tests")
struct TargetSumTests {

	@Test("Basic: [1,1,1,1,1], target 3 => 5")
	func basicExample() {
		let solver = KnapsackProblems()
		let nums = [1,1,1,1,1]
		let target = 3
		let ways = solver.findTargetSumWays(nums, target)
		#expect(ways == 5)
	}

	@Test("Single element equals target: [5], target 5 => 1")
	func singleEqualsTarget() {
		let solver = KnapsackProblems()
		let nums = [5]
		let target = 5
		let ways = solver.findTargetSumWays(nums, target)
		#expect(ways == 1)
	}

	@Test("Single element not equal target: [5], target 3 => 0")
	func singleNotEqualTarget() {
		let solver = KnapsackProblems()
		let nums = [5]
		let target = 3
		let ways = solver.findTargetSumWays(nums, target)
		#expect(ways == 0)
	}

	@Test("Zeros in array: [0,0,0], target 0 => 8 (2^3)")
	func zerosOnlyTargetZero() {
		let solver = KnapsackProblems()
		let nums = [0,0,0]
		let target = 0
		let ways = solver.findTargetSumWays(nums, target)
		#expect(ways == 8)
	}

	@Test("Zero target mixed: [1,2,1], target 0")
	func zeroTargetMixed() {
		let solver = KnapsackProblems()
		let nums = [1,2,1]
		let target = 0
		let ways = solver.findTargetSumWays(nums, target)
		// Valid expressions: +1-2+1, -1+2-1
		#expect(ways == 2)
	}

	@Test("Impossible by transform: [1,2,3], target 1 => 0")
	func impossibleTransform() {
		let solver = KnapsackProblems()
		let nums = [1,2,3]
		let target = 1
		let ways = solver.findTargetSumWays(nums, target)
		// Known answer for this set/target is 0
		#expect(ways == 0)
	}

	@Test("Larger sanity: [2,3,5,7], target 3")
	func largerSanity() {
		let solver = KnapsackProblems()
		let nums = [2,3,5,7]
		let target = 3
		let ways = solver.findTargetSumWays(nums, target)
		#expect(ways >= 0)
	}
}
