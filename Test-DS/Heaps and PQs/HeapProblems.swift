//
//  HeapProblems.swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 2/18/26.
//

import Foundation

protocol HeapProblems {
	/// https://neetcode.io/problems/last-stone-weight
	func lastStoneWeight(_ stones: [Int]) -> Int
	/// https://neetcode.io/problems/k-closest-points-to-origin
	func kClosest(_ points: [[Int]], _ k: Int) -> [[Int]]
	/// https://neetcode.io/problems/kth-largest-element-in-an-array
	func findKthLargest(_ nums: [Int], _ k: Int) -> Int
}

struct HeapSolutions: HeapProblems {}
