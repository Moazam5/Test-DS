//
//  ValidateSuduko.swift
//  Test-DSTests
//
//  Created by Moazam Abass Mir on 4/7/25.
//

import Foundation

func isValidSudoku(_ board: [[Character]]) -> Bool {
	// Initialize dictionaries to keep track of numbers in rows, columns, and sub-boxes.
	var rows: [Int: Set<Character>] = [:]
	var columns: [Int: Set<Character>] = [:]
	var squares: [Pair<Int, Int>: Set<Character>] = [:]

	// Define a helper struct for the key of the squares dictionary.
	struct Pair<T: Hashable, U: Hashable>: Hashable {
		let first: T
		let second: U
	}

	// Iterate through each cell of the 9x9 board. [1]
	for i in 0..<9 {
		for j in 0..<9 {
			let num = board[i][j]

			// If the cell is empty (represented by '.'), continue to the next iteration. [1]
			if num == "." {
				continue
			}

			// Check for duplicates in the current row. [1]
			if let row = rows[i], row.contains(num) {
				return false
			}

			// Check for duplicates in the current column. [1]
			if let column = columns[j], column.contains(num) {
				return false
			}

			// Calculate the 3x3 sub-box index. [2, 3]
			let boxRow = i / 3
			let boxCol = j / 3
			let boxKey = Pair(first: boxRow, second: boxCol)

			// Check for duplicates in the current 3x3 sub-box. [1]
			if squares[boxKey, default: []].contains(num) {
				return false
			}

			// If no duplicates are found, add the number to the sets for the current row, column, and sub-box. [4]
			rows[i, default: []].insert(num)
			columns[j, default: []].insert(num)
			squares[boxKey, default: []].insert(num)
		}
	}

	// If the entire board is checked without finding duplicates, it is a valid Sudoku board. [4]
	return true
}
