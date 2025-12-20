//
//  MinSubsetSumDifference.swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 12/13/25.
//

import Foundation

extension KnapsackProblems {
	/// Given an array arr[] of size n, the task is to divide it into two sets S1 and S2 such that the absolute difference between their sums is minimum.
	/// If there is a set S with n elements, then if we assume Subset1 has m elements, Subset2 must have n-m elements and the value of abs(sum(Subset1) - sum(Subset2)) should be minimum.
	func findMinDifference(_ list: [Int]) -> Int {
		let numRows = list.count + 1
		let totalSum = list.reduce(0, +)
		let numCols = totalSum + 1
		var dp: [[Bool]] = (0..<numRows).map { i in
			(0..<numCols).map { j in
				if j == 0 || (i == 0 && j == 0) {
					return true
				} else {
					return false
				}
			}
		}
		for i in 1..<numRows {
			for j in 1..<numCols {
				if list[i - 1] <= j {
					let includeItem = dp[i - 1][j - list[i - 1]]
					let excludeItem = dp[i - 1][j]
					dp[i][j] = includeItem || excludeItem
				} else {
					dp[i][j] = dp[i - 1][j]
				}
			}
		}

		var minDiff = Int.max // Initialize with a very large value

		// Iterate through all possible subset sums 'j' that can be formed using all elements.
		// We only need to check sums up to totalSum / 2.
		// If a sum `j` is possible, then `totalSum - j` is also possible.
		// We want to minimize `abs(j - (totalSum - j)) = abs(2*j - totalSum)`.
		// Since we're checking j <= totalSum / 2, then 2*j <= totalSum,
		// so `totalSum - 2*j` will be non-negative, and `abs()` is not strictly needed.
		for j in 0...(totalSum / 2) {
			if dp[numRows - 1][j] { // If 'j' is a possible subset sum
				let currentDiff = totalSum - (2 * j)
				minDiff = min(minDiff, currentDiff)
			}
		}

		return minDiff
	}
}

import Testing

@Suite("MinSubsetSumDifference Tests")
struct MinSubsetSumDifferenceTests {
	@Test("Basic case: [1,6,11,5] => 1")
	func basicCase() async throws {
		let solver = KnapsackProblems()
		let list = [1, 6, 11, 5]
		let diff = solver.findMinDifference(list)
		#expect(diff == 1)
	}

	@Test("Already equal partitions: [1,1,1,1] => 0")
	func alreadyEqual() async throws {
		let solver = KnapsackProblems()
		let list = [1, 1, 1, 1]
		let diff = solver.findMinDifference(list)
		#expect(diff == 0)
	}

	@Test("Empty list => 0")
	func emptyList() async throws {
		let solver = KnapsackProblems()
		let list: [Int] = []
		let diff = solver.findMinDifference(list)
		#expect(diff == 0)
	}

	@Test("Single element => element value")
	func singleElement() async throws {
		let solver = KnapsackProblems()
		#expect(solver.findMinDifference([7]) == 7)
		#expect(solver.findMinDifference([0]) == 0)
	}

	@Test("Larger case: [3,1,4,2,2,1] => 1")
	func largerCase() async throws {
		let solver = KnapsackProblems()
		let list = [3, 1, 4, 2, 2, 1]
		let diff = solver.findMinDifference(list)
		#expect(diff == 1)
	}
}
