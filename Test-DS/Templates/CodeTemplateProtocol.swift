//
//  CodeTemplateProtocol.swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 12/17/25.
//

import Foundation
struct CodeTemplatesImpl: CodeTemplates {
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
}

protocol CodeTemplates {
	/// Two pointers: one input, opposite ends
	func twoPointers(_ arr: [Int], condition: () -> Bool) -> Int
	///	Two pointers: two inputs, exhaust both
	func twoPointersTwoInputs(_ arr1: [Int], _ arr2: [Int], condition: () -> Bool) -> Int
}

extension CodeTemplatesImpl {
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
