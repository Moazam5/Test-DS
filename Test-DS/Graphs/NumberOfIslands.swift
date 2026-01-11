//
//  NumberOfIslands.swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 1/11/26.
//

import Foundation
class Solution2 {
	func numIslands(_ grid: [[Character]]) -> Int {
		let m = grid.count
		let n = grid.first!.count
		var numIslands = 0
		var grid = grid

		func dfs(_ index: (Int, Int)) {
			let (i, j) = index
			let directions = [(0, 1), (1, 0), (-1, 0), (0, -1)]
			for dir in directions {
				let (r, c) = (i + dir.0, j + dir.1)
				if r >= 0, r < m, c >= 0, c < n, grid[r][c] == "1" {
					grid[r][c] = "2"
					dfs((r,c))
				}
			}

		}

		for i in 0..<m {
			for j in 0..<n {
				if grid[i][j] == "1" {
					numIslands += 1
					grid[i][j] = "2"
					dfs((i, j))
				}
			}
		}
		return numIslands
	}
}
