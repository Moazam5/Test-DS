//
//  Exist.swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 1/21/26.
//

import Foundation
import Playgrounds

extension GraphsImpl {
	func exist(_ board: [[Character]], _ word: String) -> Bool {
		let (m,n) = (board.count, board[0].count)
		let directions = [(0,1), (1,0), (-1,0), (0,-1)]
		let wordChars = Array(word)

		// Visited array to track cells used in the current path
		var visited = Array(repeating: Array(repeating: false, count: n), count: m)
		func dfs(_ i: Int, _ j: Int, _ k: Int) -> Bool {
			if k == wordChars.count {
				return true
			}

			// Base Case 2: Out of bounds
			if i < 0 || i >= m || j < 0 || j >= n {
				return false
			}

			// Base Case 3: Cell already visited in current path
			if visited[i][j] {
				return false
			}

			// Base Case 4: Character mismatch
			if board[i][j] != wordChars[k] {
				return false
			}
			visited[i][j] = true


			for dir in directions {
				let (r, c) = (i + dir.0, j + dir.1)

				if dfs(r, c, k + 1) {
					return true
				}
			}
			visited[i][j] = false
			return false

		}
		for i in 0..<m {
			for j in 0..<n {
				if board[i][j] == wordChars[0] {
					if dfs(i, j, 0) {
						return true
					}
				}
			}
		}
		return false
	}

	func word(_ word: String, at index: Int) -> Character {
		let startIndex = word.startIndex
		let currentIndex = word.index(startIndex, offsetBy: index)
		return word[currentIndex]
	}
}

#Playground {
	func word(_ word: String, at index: Int = 0) -> Character? {
		guard index < word.count else {
			return nil
		}
		let startIndex = word.startIndex
		let currentIndex = word.index(startIndex, offsetBy: index)
		return word[currentIndex]
	}
	word("word", at: 3)
}
