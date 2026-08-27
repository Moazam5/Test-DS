//
//  RodCutting.swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 5/31/26.
//

import Foundation
import Playgrounds

extension UnboundedKnapsackProblems {
	/// DescriptionRod Cutting Problem
	/// Given a rod of length n inches and an array of prices that contains prices of all pieces of size smaller than n. Determine the  maximum value obtainable by cutting up the rod and selling the pieces
	/// Example:
	/// if length of the rod is 8 and the values of different pieces are given as following, then the maximum obtainable value is 22 (by cutting in two pieces of lengths 2 and 6)
	@discardableResult
	func rodCutting(_ prices: [Int]) -> Int {
		let n = prices.count
		let rowCount = n + 1
		let colCount = n + 1
		var dp = Array(repeating: Array(repeating: 0, count: colCount), count: rowCount)

		for i in 1..<rowCount {
			for j in 0..<colCount {
				let excluded =  dp[i - 1][j]
				if i <= j {
					dp[i][j] = max(dp[i][j - i] + prices[i - 1], excluded)
				} else {
					dp[i][j] =  excluded
				}
			}
		}
		return dp[rowCount - 1][colCount - 1]
	}
}

#Playground {
	UnboundedKnapsackProblems.shared.rodCutting([1, 5, 8, 9, 10, 17, 17, 20])
}
