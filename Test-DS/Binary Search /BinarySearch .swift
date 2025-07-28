//
//  BinarySearch .swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 5/25/25.
//

import Foundation
import Testing 

/*
 Easy

 You are given an array of distinct integers nums, sorted in ascending order, and an integer target.

 Implement a function to search for target within nums. If it exists, then return its index, otherwise, return -1.

 Your solution must run in
 O(log n ) time

 Example 1:
 Input: nums = [-1,0,2,4,6,8], target = 4
 Output: 3

 Example 2:
 Input: nums = [-1,0,2,4,6,8], target = 3
 Output: -1
 */

func search(_ nums: [Int], _ target: Int) -> Int {

	func binarySearch(_ nums: [Int], target: Int, leftIndex: Int, rightIndex: Int) -> Int {
		if leftIndex > rightIndex {
			return -1
		}
		let midIndex = leftIndex + (rightIndex - leftIndex) / 2
		if nums[midIndex] == target {
			return midIndex
		} else if nums[midIndex] < target {
			return binarySearch(nums, target: target, leftIndex: midIndex + 1, rightIndex: rightIndex)
		} else {
			return binarySearch(nums, target: target, leftIndex: leftIndex, rightIndex: midIndex - 1)
		}
	}

	return binarySearch(nums, target: target, leftIndex: 0, rightIndex: nums.count - 1)
}


@Suite(.tags(.binarySearch)) struct BinarySearchTests {
	@Test func searchWithEmptyArray() {
		#expect(search([], 1) == -1)
	}

	@Test func searchWithExamples() {
		#expect(search([-1,0,2,4,6,8], 4) == 3)
		#expect(search([1, 10, 14], 12) == 1)
	}
}

extension Tag {
	@Tag static var binarySearch: Self
}
