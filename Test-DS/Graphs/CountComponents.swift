//
//  CountComponents.swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 2/11/26.
//

import Foundation

extension GraphsImpl {
	func countComponents(_ n: Int, _ edges: [[Int]]) -> Int {
		let adjacencyList = self.createUndirectedAdjacencyList(from: edges)
		var count = 0
		var visited = Set<Int>()

		func dfs(_ i: Int) {
			if visited.contains(i) {
				return
			}
			visited.insert(i)
			if let neighbors = adjacencyList[i] {
				for neighbor in neighbors {
					dfs(neighbor)
				}
			}
		}

		for i in 0..<n {
			if !visited.contains(i) {
				dfs(i)
				count += 1
			}
		}
		return count
	}
}
