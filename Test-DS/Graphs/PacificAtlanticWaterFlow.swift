//
//  PacificAtlanticWaterFlow.swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 2/19/26.
//

import Foundation

extension GraphsImpl {
	func pacificAtlantic(_ heights: [[Int]]) -> [[Int]] {
		let ROWS = heights.count
		let COLS = heights[0].count
		var atl = Set<[Int]>()
		var pac = Set<[Int]>()
		let dirs = [(0, 1), (0, -1), (1, 0), (-1, 0)]
		
		func dfs(_ i: Int, _ j: Int, _ visit: inout Set<[Int]>, _ prevHeight: Int) {
			guard i >= 0, i < ROWS, j >= 0, j < COLS,
				  heights[i][j] >= prevHeight,
				  !visit.contains([i,j]) else {
				return
			}
			visit.insert([i, j])
			for dir in dirs {
				let x = dir.0 + i
				let y = dir.1 + j
				dfs(x, y, &visit, heights[i][j])
			}
		}
		
		for r in 0..<ROWS {
			dfs(r, 0, &pac, heights[r][0])
			dfs(r, COLS - 1, &atl, heights[r][COLS - 1])
		}
		
		for c in 0..<COLS {
			dfs(0, c, &pac, heights[0][c])
			dfs(ROWS - 1, c, &atl, heights[ROWS - 1][c])
		}
		
		return Array(pac.intersection(atl))
	}
}
