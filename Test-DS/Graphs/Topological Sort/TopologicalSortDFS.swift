//
//  TopologicalSortDFS.swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 2/13/26.
//

import Foundation

extension GraphsImpl {
	func topologicalSort(adjacencyList: [Int : [Int]], vertices: Int) -> [Int] {
		var stack = [Int]()
		var visited = Array(repeating: 0, count: vertices)

		func dfs(_ node: Int) {
			guard visited[node] == 0 else {
				return
			}
			visited[node] = 1
			if let neighbors = adjacencyList[node] {
				for neighbor in neighbors {
					dfs(neighbor)
				}
			}
			// Add to stack after visiting all neighbors.
			stack.append(node)
		}

		for vertex in 0..<vertices {
			if visited[vertex] == 0 {
				dfs(vertex)
			}
		}

		return stack.reversed()
	}

	func topologicalSortChatGPT(adjacencyList: [Int : [Int]], vertices: Int) -> [Int] {
		var stack = [Int]()
		var visited = Array(repeating: false, count: vertices) // Uses bool

		func dfs(_ node: Int) {
			if visited[node] { return }
			visited[node] = true

			for neighbor in adjacencyList[node, default: []] { // This is cleaner
				dfs(neighbor)
		}
			stack.append(node)  // postorder
		}

		for v in 0..<vertices {
			if !visited[v] {
				dfs(v)
			}
		}

		return stack.reversed()
	}

}
