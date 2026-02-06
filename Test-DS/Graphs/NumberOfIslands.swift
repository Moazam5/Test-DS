//
//  NumberOfIslands.swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 1/11/26.
//

import Foundation

class GraphsImpl: GraphsQuestions {
	/// DFS
	func numIslands(_ grid: [[Character]]) -> Int {
		let m = grid.count
		let n = grid.first!.count
		var numIslands = 0
		var grid = grid // make a copy of the grid

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

	/// BFS
	func numIslandsBFS(_ grid: [[Character]]) -> Int {
		let rows = grid.count
		let cols = grid[0].count
		var grid = grid
		var count = 0
		let directions = [(0,1), (1,0), (-1,0), (0,-1)]

		func bfs(_ i: Int, _ j: Int) {
			var q = [(i, j)]
			grid[i][j] = "0"

			while !q.isEmpty {
				let (r, c) = q.removeFirst()
				for (dr, dc) in directions {
					let nr = r + dr
					let nc = c + dc

					if nr >= 0, nr < rows, nc >= 0, nc < cols, grid[nr][nc] == "1" {
						grid[nr][nc] = "0"
						q.append((nr, nc))
					}
				}
			}
		}

		for i in 0..<rows {
			for j in 0..<cols {
				if grid[i][j] == "1" {
					count += 1
					bfs(i, j)
				}
			}
		}
		return count
	}

	func numIslands2(_ grid: [[Character]]) -> Int {
		let m = grid.count
		let n = grid.first!.count
		var grid = grid
		let directions = [(0,1), (1,0), (-1,0), (0,-1)]
		var count = 0


		for i in 0..<m {
			for j in 0..<n {
				if grid[i][j] == "1" {
					count += 1
					dfs(i, j)
				}
			}
		}

		func dfs(_ i: Int, _ j: Int) {
			guard i >= 0 && i < m && j >= 0 && j < n && grid[i][j] == "1" else {
				return
			}
			grid[i][j] = "0"

			for dir in directions {
				dfs(dir.0 + i, dir.1 + j)
			}
		}
		return count
	}

}
