//
//  PathWithMinEffort.swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 4/21/26.
//

import Foundation

extension GraphsImpl {
	func minimumEffortPath(_ heights: [[Int]]) -> Int {
			let MAX = Int.max / 4
			let n = heights.count
			let m = heights[0].count
			var dist = Array(repeating: Array(repeating: MAX, count: m), count: n)
			dist[0][0] = 0
			let dirs = [(0,1), (1,0), (-1, 0), (0, -1)]
			var pq = MyHeap(contentsOf: [Item(0, 0, 0)], isMinHeap: true)

			while !pq.isEmpty {
				let item = pq.pop()!
				let diff = item.diff
				let row = item.row
				let col = item.col
				if row == n - 1, col == m - 1 {
					 return diff
				}

				for dir in dirs {
					let newr = dir.0 + row
					let newc = dir.1 + col
					if newr >= 0, newr < n, newc >= 0, newc < m {
						let newEffort = max(abs(heights[newr][newc] - heights[row][col]), diff)
						if newEffort < dist[newr][newc] {
							dist[newr][newc] = newEffort
							pq.insert(Item(newEffort, newr, newc))
						}
					}
				}

			}
			return 0 // unreachable
		}

	private struct Item: Comparable {
		let diff: Int
		let row: Int
		let col: Int

		init(_ diff: Int, _ row: Int, _ col: Int) {
			self.diff = diff
			self.row = row
			self.col = col
		}

		static func < (lhs: Item, rhs: Item) -> Bool {

			return lhs.diff < rhs.diff
		}
	}
}
