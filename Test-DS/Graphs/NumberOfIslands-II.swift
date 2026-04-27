//
//  NumberOfIslands-II.swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 4/27/26.
//

import Foundation

extension GraphsImpl {
	func numOfIslands(_ n: Int, _ m: Int, _ A: [[Int]]) -> [Int] {
		var visited = Set<Int>()
		var count = 0
		var ds = DisjointSet(n: n * m)
		let dirs = [(0,1), (1,0), (-1,0), (0,-1)]
		var matrix = Array(repeating: Array(repeating: 0, count: m), count: n)
		var res: [Int] = []

		for i in 0..<A.count {
			let ni = A[i][0]
			let nj = A[i][1]
			let id = ni * m + nj

			guard !visited.contains(id) else {
				res.append(count)
				continue
			}

			matrix[ni][nj] = 1
			visited.insert(id)
			count += 1

			for dir in dirs {
				let ri = dir.0 + ni
				let rj = dir.1 + nj

				guard ri >= 0, ri < n, rj >= 0, rj < m, matrix[ri][rj] == 1 else {
					continue
				}
				let neighborID = ri * m + rj
				if ds.findUltimateParent(node: id) != ds.findUltimateParent(node: neighborID) {
					count -= 1
					ds.unionBySize(u: id, v: neighborID)
				}
			}

			res.append(count)
		}
		return res
	}
}
