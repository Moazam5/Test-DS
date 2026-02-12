//
//  IsBipartiteBFS.swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 1/23/26.
//

import Foundation

extension GraphsImpl {
	func isBipartiteBFS(adjacencyList: [Int : [Int]], vertices: Int) -> Bool {
		var colors = Array(repeating: -1, count: vertices)

		// Returns false is the graph is not bipartite
		func bfsCheck(_ node: Int, _ parent: Int) -> Bool {
			var q = [node]
			colors[node] = 0
			
			while !q.isEmpty {
				let curr = q.removeFirst()
				if let neighbors = adjacencyList[curr] {
					for neighbor in neighbors {
						if colors[neighbor] == -1 { // Not in the list so color it
							colors[neighbor] = 1 - colors[curr]
							q.append(neighbor)
						} else if colors[neighbor] == colors[curr] { // Check neighbor, if neighbor has same color, NOT bipartite
							return false
						}
					}
				}
			}
			return true

		}

		for vertex in 0..<vertices {
			if colors[vertex] == -1 {
				if !bfsCheck(vertex, -1) {
					return false
				}
			}
		}

		return true
	}

	/// Leetcode problem
	func isBipartite(_ graph: [[Int]]) -> Bool {
		let vertices = graph.count
		var colors = Array(repeating: -1, count: vertices)

		// Returns false is the graph is not bipartite
		func bfsCheck(_ node: Int, _ parent: Int) -> Bool {
			var q = [node]
			colors[node] = 0

			while !q.isEmpty {
				let curr = q.removeFirst()
				let neighbors = graph[curr]
				for neighbor in neighbors {
					if colors[neighbor] == -1 { // Not in the list so color it
						colors[neighbor] = 1 - colors[curr]
						q.append(neighbor)
					} else if colors[neighbor] == colors[curr] { // If neighbor has same color, NOT bipartite
						return false
					}
				}
			}
			return true

		}
		for vertex in 0..<vertices {
			if colors[vertex] == -1 {
				if !bfsCheck(vertex, -1) {
					return false
				}
			}
		}
		return true
	}
}
