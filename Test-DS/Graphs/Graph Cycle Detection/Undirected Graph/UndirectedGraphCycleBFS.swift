//
//  UndirectedGraphCycleBFS.swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 1/23/26.
//

import Foundation
import Playgrounds

extension GraphsImpl {
	// More efficient with array instead of Set
	func hasCycleOptimized(adjacencyList: [Int: [Int]], vertices: Int) -> Bool {
		var visited = Array(repeating: false, count: vertices)

		func bfs(start: Int) -> Bool {
			var queue: [(node: Int, parent: Int)] = []
			var front = 0

			queue.append((start, -1))
			visited[start] = true

			while front < queue.count {
				let (node, parent) = queue[front]
				front += 1

				for neighbor in adjacencyList[node, default: []] {
					if !visited[neighbor] {
						visited[neighbor] = true
						queue.append((neighbor, node))
					} else if neighbor != parent {
						return true
					}

				}
			}

			return false
		}

		for vertex in 0..<vertices {
			if !visited[vertex] {
				if bfs(start: vertex) {
					return true
				}
			}
		}

		return false
	}

	// Simple BFS approach - adjacency list as parameter
	func hasCycleBFS(adjacencyList: [Int: [Int]], vertices: Int) -> Bool {
		var visited = Set<Int>()

		func bfs(start: Int) -> Bool {
			var queue: [(node: Int, parent: Int)] = [(start, -1)]
			visited.insert(start) // mark as visited

			while !queue.isEmpty {
				let (node, parent) = queue.removeFirst()
				visited.insert(node)
				if let neighbors = adjacencyList[node] {
					for neighbor in neighbors {
						if !visited.contains(neighbor) {
//							visited.insert(neighbor)
							queue.append((neighbor, node))
						} else if neighbor != parent {
							return true // Cycle found
						}
					}
				}
			}

			return false
		}

		// Check all components (handles disconnected graphs)
		for vertex in 0..<vertices {
			if !visited.contains(vertex) {
				if bfs(start: vertex) {
					return true
				}
			}
		}

		return false
	}
}


#Playground {
	_ = GraphsImpl.shared.hasCycleBFS(adjacencyList: CodeTemplatesImpl.undirectedGraphWithCycleAL, vertices: 7)
}
