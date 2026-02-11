//
//  Playground.swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 4/9/25.
//

import Foundation
import Playgrounds

func playground() {
	func knapsackTopDown(weights: [Int], values: [Int], capacity: Int) -> Int {
		let numRows = 1 + values.count
		let numCols = 1 + capacity
		var dp: [[Int]] = (0..<numRows).map { i in
			(0..<numCols).map { j in
				if i == 0 || j == 0 {
					// Set first row or first column to the base value
					return 0 // This might seem redundant for now but can be replaced later with a different base case.
				} else {
					return 0 // All other cells are 0
				}
			}
		}

		for i in 1...values.count {
			for j in 0...capacity {
				if weights[i - 1] <= j {
					let includeItem = values[i - 1] + dp[i - 1][j - weights[i - 1]]
					let excludeItem = dp[i - 1][j]
					dp[i][j] = max(includeItem, excludeItem)
				} else {
					dp[i][j] = dp[i - 1][j]
				}
			}
		}

		print(dp)
		return dp[numRows - 1][numCols - 1]

	}
	let maxVal = knapsackTopDown(weights: [1,2,6], values: [1,2,2], capacity: 7)
	print(maxVal)
}

#Playground {
	let x = 2
	print(x / 2)
	let res = ["a"]
	res.joined(separator: "").reversed()
	

}
