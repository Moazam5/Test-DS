//
//  DirectedGraphCycleDFS.swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 1/24/26.
//

import Foundation

extension GraphsImpl {
	func hasCycleDFS(adjacencyList: [Int : [Int]]) -> Bool {
		var visited = Set<Int>()
		var visiting = Set<Int>()

		func dfs(_ node: Int) -> Bool {
			if visited.contains(node) {
				return false
			}
			if visiting.contains(node) {
				return true
			}

			visiting.insert(node)

			if let neighbors = adjacencyList[node] {
				for neighbor in neighbors {
					if dfs(neighbor) {
						return true
					}
				}
			}
			visiting.remove(node)
			visited.insert(node)
			return false
		}

		for node in adjacencyList.keys {
			if !visited.contains(node) {
				if dfs(node) {
					return true
				}
			}
		}
		return false
	}
}
