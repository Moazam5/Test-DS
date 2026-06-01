//
//  FindClosest.swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 5/31/26.
//

import Foundation

extension BinarySearchSolution {
	func findClosest(_ nums: [Int], target: Int) -> Int {
		guard !nums.isEmpty else { return -1 }

		var left = 0, right = nums.count - 1

		while left < right {
			let mid = left + (right - left) / 2
			if nums[mid] < target {
				left = mid + 1
			} else {
				right = mid
			}
		}
		// left now points at the first index where nums[i] >= target,
		// or the last index if target exceeds all elements.

		// The closest value is either at `left` or `left - 1`.
		if left > 0 {
			let a = nums[left - 1], b = nums[left]
			let da = abs(a - target), db = abs(b - target)
			if da < db || (da == db && a < b) {
				return left - 1
			}
		}
		return left
	}
}
