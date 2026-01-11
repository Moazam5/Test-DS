//
//  LCS+LengthOfLIS.swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 1/4/26.
//

import Foundation

extension LCSProblems {
//	Given an integer array nums, return the length of the longest strictly increasing subsequence.
//
//
//
//	Example 1:
//
//	Input: nums = [10,9,2,5,3,7,101,18]
//	Output: 4
//	Explanation: The longest increasing subsequence is [2,3,7,101], therefore the length is 4.
	func lengthOfLIS(_ nums: [Int]) -> Int {
		let numsSorted = nums.sorted()
		let n = numsSorted.reduce(into: [Int]()) { res, curr in
			if res.isEmpty || curr > res.last! {
				res.append(curr)
			}
		}
		return self.longestCommonSubsequence(nums, n)
	}
}
