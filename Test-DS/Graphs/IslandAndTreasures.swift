//
//  IslandAndTreasures.swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 3/11/26.
//

import Foundation
import Playgrounds

extension GraphsImpl {
	func islandsAndTreasure(_ grid: inout [[Int]]) {
		let m = grid.count
		let n = grid[0].count
		var q: [(row: Int, col: Int)] = []
		var dist = 1
		let dirs = [(0,1), (1,0), (-1,0), (0,-1)]

		for i in 0..<m {
			for j in 0..<n {
				if grid[i][j] == 0 {
					q.append((i, j))
				}
			}
		}

		while !q.isEmpty {
			let qLen = q.count
			for _ in 0..<qLen {
				let node = q.removeFirst()

				for dir in dirs {
					let row = node.row + dir.0
					let col = node.col + dir.1
					if row >= 0 && row < m && col >= 0 && col < n && grid[row][col] == 2147483647 {
						grid[row][col] = dist
						q.append((row, col))
					}
				}
			}
			dist += 1
		}
	}
}

#Playground {
	var grid = [[2147483647,-1,0,2147483647],[2147483647,2147483647,2147483647,-1],[2147483647,-1,2147483647,-1],[0,-1,2147483647,2147483647]]
	GraphsImpl.shared.islandsAndTreasure(&grid)
}
