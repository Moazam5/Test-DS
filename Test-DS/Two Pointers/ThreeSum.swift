//
//  ThreeSum.swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 4/14/25.
//

import Foundation
import Testing
import OSLog
let logger = Logger(subsystem: Bundle.main.bundlePath, category: "ThreeSum")

extension TwoPointers {
	///  [-1,0,1,2,-1,-4],
	///  [-4, -1, -1, 0, 1, 2]
	///   Given an integer array nums, return all the triplets [nums[i], nums[j], nums[k]] where nums[i] + nums[j] + nums[k] == 0, and the indices i, j and k are all distinct.
	static func threeSum(_ nums: [Int]) -> [[Int]] {
		if nums.count < 3 {
			return []
		}
		let nums = nums.sorted()
		var pairs = [[Int]]()

		for (i, num) in nums.enumerated() {
			if num > 0 {
				break
			}
			if i > 0, nums[i - 1] == num {
				continue
			}
			var l = i + 1
			var r = nums.count - 1
			while l < r {
				let sum = nums[l] + nums[r] + num
				if sum > 0 {
					r -= 1
				} else if sum < 0 {
					l += 1
				} else {
					let newPair = [num, nums[l], nums[r]]
					pairs.append(newPair)
					l += 1
					r -= 1

					while nums[l] == nums[l - 1], l < r {
						l += 1
					}
				}
			}
		}
		return pairs
	}
}

@Suite struct TestThreeSum {
	@Test func returnsEmptyArrayWhenGivenEmptyArray() {
		#expect(TwoPointers.threeSum([]) == [])
	}

	@Test func returnsEmptyArrayWhenGivenSingleElementArray() {
		#expect(TwoPointers.threeSum([1]) == [])
	}

	@Test func returnsEmptyArrayWhenGivenArrayWithNoTwoSum() {
		let res = TwoPointers.threeSum([-1,0,1,2,-1,-4])
		let sortedRes = res.map { $0.sorted()}
		#expect(sortedRes == [[-1,-1, 2],[-1,0,1]])
	}

	@Test func returnsTwoSumWhenGivenArrayWithTwoSum() {
		let nums =  [-1,0,1,2,-1,-4]
		#expect(TwoPointers.threeSum(nums) == [[-1,-1,2],[-1,0,1]])
	}

	@Test func returnsTwoSumWhenGivenAnotherArrayWithTwoSum() {
		let nums = [-2,0,1,1,2]
		#expect(TwoPointers.threeSum(nums) == [[-2,0,2],[-2,1,1]])
	}
}
