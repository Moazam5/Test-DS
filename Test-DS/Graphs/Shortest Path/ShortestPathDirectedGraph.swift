//
//  ShortestPathDirectedGraph.swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 2/14/26.
//

import Foundation
import Playgrounds

extension GraphsImpl {
	/// - Parameters:
	///   - n: Number of nodes.
	///   - edges: The edge array, `edge[i, j, w]` represents an edge from`i -> j` with a weight of `w`.
	/// - Returns: Returns an array of shortest distances.
	@discardableResult
	func shortestPath(_ n: Int, edges: [[Int]]) -> [Int] {
		var adjacencyList: [Int: [(node: Int, weight: Int)]] = [:]
		let MAX = Int.max / 2
		for edge in edges {
			let node = edge[0]
			let neighbor = edge[1]
			let weight = edge[2]
			adjacencyList[node, default: []].append((node: neighbor, weight: weight))
		}

		// Step 1: Create stack using topological sort

		var stack = [Int]()
		var visited = Array(repeating: 0, count: n)

		for i in 0..<n {
			if visited[i] == 0 {
				dfs(i)
			}
		}

		func dfs(_ node: Int) {
			guard visited[node] == 0 else {
				return
			}
			visited[node] = 1
			for neighbor in adjacencyList[node, default: []] {
				if visited[neighbor.node] == 0 {
					dfs(neighbor.node)
				}
			}
			stack.append(node)
		}

		// Step 2a: Initialize a distances array with n values, initially set to infinity
		var distances = Array(repeating: MAX, count: n)
		// Source node, if not given set to 0. I have chosen n - 1 for now.
		distances[n - 1] = 0

		// Step 2b: Update distances array
		while !stack.isEmpty {
			let node = stack.removeLast()
			// Check if distance of this node is int max, then no need to continue. This is important to avoid overflowing.
			if distances[node] == MAX { continue }

			for neighbor in adjacencyList[node, default: []] {
				let val = neighbor.node
				let weight = neighbor.weight
				let nextPossibleWeight = distances[node] + weight
				if (nextPossibleWeight < distances[val]) {
					distances[val] = nextPossibleWeight
				}
			}
		}

		return distances.map { $0 == MAX / 2 ? -1: $0 }
	}
}


#Playground {
	GraphsImpl.shared.shortestPath(7, edges: CodeTemplatesImpl.directedShortestPathEdges)

	GraphsImpl.shared.shortestPath(4, edges:
	[[0,1,200], [1,2,100], [1,3, 300], [2,3,100]])
}
