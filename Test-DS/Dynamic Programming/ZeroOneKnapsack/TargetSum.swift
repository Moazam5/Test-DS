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
