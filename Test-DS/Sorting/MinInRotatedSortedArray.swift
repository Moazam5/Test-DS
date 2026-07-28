//
//  MinInRotatedSortedArray.swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 7/13/26.
//

import Foundation
import Playgrounds

extension SortingSolutions {
	func findMin(in nums: [Int]) -> Int? {
		guard !nums.isEmpty else {
			return nil
		}
		var right = nums.count - 1
		var left = 0

		while left < right {
			let mid = (right + left) / 2
			let midElement = nums[mid]

			if midElement > nums[right] {
				left = mid + 1
			} else {
				right = mid
			}
		}
		return nums[left]
	}
}

#Playground {
	_ = SortingSolutions.shared.findMin(in: [3,4,5,1,2]) // 1
}
