//
//  CodeTemplateImpl.swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 12/27/25.
//

import Foundation

struct CodeTemplatesImpl: CodeTemplates {
	// MARK: Two pointers

	func twoPointers(_ arr: [Int], condition: () -> Bool) -> Int {
		var (left, ans) = (0, 0)
		var right = arr.count - 1

		while left < right {
			// Do some logic here with left and right
			if condition() {
				left += 1
			} else {
				right -= 1
			}
		}
		return ans
	}

	///	Two pointers: two inputs, exhaust both
	func twoPointersTwoInputs(_ arr1: [Int], _ arr2: [Int], condition: () -> Bool) -> Int {
		var (i, j, ans) = (0, 0, 0)

		while i < arr1.count && j < arr2.count {
			if condition() {
				i += 1
			} else {
				j += 1
			}
		}

		while i < arr1.count {
			// More logic
			i += 1
		}

		while j < arr2.count {
			// More logic
			j += 1
		}

		return ans
	}
}

// MARK: - Sliding window

extension CodeTemplatesImpl {
	func slidingWindow(_ arr: [Int], windowCondition: () -> Bool) -> Int {
		var (left, current, answer) = (0, 0, 0)
		for rig in arr {
			// do logic here to add arr[right] to curr

			while windowCondition() {
				// remove arr[left] from curr
				left += 1
			}
			// update answer
		}
		return answer
	}
}

