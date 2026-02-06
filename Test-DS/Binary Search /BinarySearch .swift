//
//  BinarySearch .swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 5/25/25.
//

import Foundation

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

protocol BinarySearch {
	func search(_ nums: [Int], _ target: Int) -> Int
	/// https://leetcode.com/problems/search-a-2d-matrix/description/
	func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool
}

class BinarySearchSolution: BinarySearch {
	func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
		let m = matrix.count
				let n = matrix[0].count

				var low = 0
				var high = (m * n) - 1 // Total number of elements - 1

				while low <= high {
					let midIndex = low + (high - low) / 2 // 1D conceptual index

					// Convert 1D index to 2D coordinates
					let row = midIndex / n
					let col = midIndex % n

					let element = matrix[row][col]

					if element == target {
						return true
					} else if element < target {
						low = midIndex + 1
					} else { // element > target
						high = midIndex - 1
					}
				}

				return false // Target not found
	}

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
}
