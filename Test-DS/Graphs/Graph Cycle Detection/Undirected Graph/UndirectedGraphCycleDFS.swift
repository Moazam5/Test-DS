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
			for neighbor in adjacencyList[node, default: []] {
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

	func hasCycleDFSIteration(adjacencyList: [Int: [Int]], vertices: Int) -> Bool {
		var visited = Set<Int>()
		func dfs(node: Int, parent: Int) -> Bool {
			var stack: [(node: Int, parent: Int)] = [(node, parent)]
			visited.insert(node)
			while !stack.isEmpty {
				let (node, parent) = stack.removeLast()
				for neighbor in adjacencyList[node, default: []] {
					if !visited.contains(neighbor) {
						stack.append((neighbor, node))
						visited.insert(neighbor)
					} else if neighbor != parent {
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
	_ = GraphsImpl.shared.hasCycleDFSIteration(adjacencyList: CodeTemplatesImpl.undirectedGraphWithCycleAL, vertices: 7)
}
