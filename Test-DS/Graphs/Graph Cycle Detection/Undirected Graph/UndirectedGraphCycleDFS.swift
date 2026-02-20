//
//  UndirectedGraphCycleDFS.swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 1/23/26.
//

import Foundation
import Playgrounds

extension GraphsImpl {
	func hasCycleDFS(adjacencyList: [Int: [Int]], vertices: Int) -> Bool {
		var visited = Set<Int>()
		func dfs(node: Int, parent: Int) -> Bool {
			visited.insert(node)

			// Check all neighbors
			if let neighbors = adjacencyList[node] {
				for neighbor in neighbors {
					// If neighbor is not visited, recursively check
					if !visited.contains(neighbor) {
						if dfs(node: neighbor, parent: node) {
							return true
						}
					}
					// If neighbor is visited and NOT the parent, cycle found
					else if neighbor != parent {
						return true
					}
				}
			}

			return false
		}

		// Check all components (handles disconnected graphs)
		for vertex in 0..<vertices {
			if !visited.contains(vertex) {
				if dfs(node: vertex, parent: -1) { // This is important for checking all components. Only returns true if a cycle is found.
					return true
				}
			}
		}

		return false
	}
}


#Playground {

	let graph = GraphsImpl.shared.hasCycleDFS(adjacencyList: CodeTemplatesImpl.undirectedGraphWithCycleAL)
}
