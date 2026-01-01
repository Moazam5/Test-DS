//
//  TwoSum.swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 4/14/25.
//

import Foundation
import Testing

extension TwoPointers {
	static func twoSumOne(_ nums: [Int], target: Int) -> [Int] {
		if nums.count < 2 {
			return []
		}

		var (i,j) = (0, nums.count - 1)
		while i < j {
			let sum = nums[i] + nums[j]
			if sum == target {
				return [i, j]
			} else if sum < target {
				i += 1
			} else {
				j -= 1
			}
		}
		return []
	}

	/// This is for when the nums array is not sorted. Beats 100% on leetcode.
	static func twoSum(_ nums: [Int], target: Int) -> [Int] {
		var numsDict: [Int: Int] = [:]
		for (index, num) in nums.enumerated() {
			let otherNumber = target - num
			if let otherNumberIndex = numsDict[otherNumber] {
				return [otherNumberIndex, index]
			}
			numsDict[num] = index
		}
		return []
	}
}

@Suite struct TestTwoSum {
	@Test func returnsEmptyArrayWhenGivenEmptyArray() {
		#expect(TwoPointers.twoSum([], target: 0) == [])
	}

	@Test func returnsEmptyArrayWhenGivenSingleElementArray() {
		#expect(TwoPointers.twoSum([1], target: 0) == [])
	}

	@Test func returnsEmptyArrayWhenGivenArrayWithNoTwoSum() {
		#expect(TwoPointers.twoSum([1,2,3,4], target: 2) == [])
	}

	@Test func returnsTwoSumWhenGivenArrayWithTwoSum() {
		let nums = [3,4,5,6]
		let target = 7
		#expect(TwoPointers.twoSum(nums, target: target) == [0,1])
	}

	@Test func returnsTwoSumWhenGivenAnotherArrayWithTwoSum() {
		let nums = [4,5,6]
		let target = 10
		#expect(TwoPointers.twoSum(nums, target: target) == [0,2])
	}

	@Test func returnsTwoSumWhenGivenUnsortedArrayWithTwoSum() {
		let nums = [5, 4,6]
		let target = 10
		#expect(TwoPointers.twoSum(nums, target: target) == [1,2])
	}

}
