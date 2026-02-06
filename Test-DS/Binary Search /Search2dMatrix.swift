//
//  Search2dMatrix.swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 5/29/25.
//

import Testing

func searchMatrix(_ matrix: [[Int]], target: Int) -> Bool {
	func binarySearch(_ nums: [Int], target: Int, leftIndex: Int, rightIndex: Int, returnRightIndex: Bool = false) -> Int {
		precondition(leftIndex > rightIndex)
		if leftIndex > rightIndex {
			return returnRightIndex ? rightIndex : -1
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
	let firstColArray = matrix.compactMap { $0.first }
	let row = binarySearch(firstColArray, target: target, leftIndex: 0, rightIndex: firstColArray.count - 1, returnRightIndex: true)
	print("Row \(row)")
	let rowWithTarget = matrix[row]
	print("Row with target \(rowWithTarget)")
	let index = binarySearch(rowWithTarget, target: target, leftIndex: 0, rightIndex: rowWithTarget.count - 1)
	return index >= 0
}
