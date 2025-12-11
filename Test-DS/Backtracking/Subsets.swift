//
//  Subsets.swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 11/30/25.
//

import Foundation

protocol Backtracking {
	/// Given an array nums of unique integers, return all possible subsets of nums.
	///
	/// The solution set must not contain duplicate subsets. You may return the solution in any order.
	func subsets(_ nums: [Int]) -> [[Int]]
}

class BacktrackingImpl: Backtracking {
	func subsets(_ nums: [Int]) -> [[Int]] {
		guard nums.count > 0 else {
			return [[]]
		}
		var result: [[Int]] = []
		for num in nums {
			result += result.map { $0 + [num] }
		}

		return result
	}
}
