//
//  SurroundedRegions.swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 1/22/26.
//

import Foundation

extension GraphsImpl {
	/// You are given an m x n matrix board containing letters 'X' and 'O', capture regions that are surrounded:
	///	Connect: A cell is connected to adjacent cells horizontally or vertically.
	/// Region: To form a region connect every 'O' cell.
	/// Surround: The region is surrounded with 'X' cells if you can connect the region with 'X' cells and none of the region cells are on the edge of the board.
	/// To capture a surrounded region, replace all 'O's with 'X's in-place within the original board. You do not need to return anything.
	func solve(_ board: inout [[Character]]) {
		let (ROWS, COLS) = (board.count, board[0].count)
		let directions = [(0,1), (1,0), (-1,0), (0,-1)]

		for i in 0..<ROWS {
			if board[i][0] == "O" {
				dfs(i, 0)
			}
			if board[i][COLS - 1] == "O" {
				dfs(i, COLS - 1)
			}
		}

		for j in 0..<COLS {
			if board[0][j] == "O" {
				dfs(0, j)
			}
			if board[ROWS - 1][j] == "O" {
				dfs(ROWS - 1, j)
			}
		}


		for i in 0..<ROWS {
			for j in 0..<COLS {
				if board[i][j] == "T" {
					board[i][j] = "O"
				} else if board[i][j] == "O" {
					board[i][j] = "X"
				}
			}
		}

		func dfs(_ i: Int, _ j: Int) {
			if i < 0 || i >= ROWS || j < 0 || j >= COLS || board[i][j] != "O" {
				return
			}
			board[i][j] = "T"
			for dir in directions {
				let (r, c) = (i + dir.0, j + dir.1)
				dfs(r, c)
			}
		}
	}
}
