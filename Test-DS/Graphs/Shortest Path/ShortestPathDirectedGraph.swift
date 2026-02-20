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
	func shortestPath(_ n: Int, edges: [[Int]]) -> [Int] {
		var adjacencyList: [Int: [(node: Int, weight: Int)]] = [:]
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
		var distances = Array(repeating: Int.max / 2, count: n)
		// Source node, if not given set to 0
		distances[0] = 0

		// Step 2b: Update distances array
		while !stack.isEmpty {
			let node = stack.removeLast()
			// This is important to avoid overflowing.
			if distances[node] == Int.max / 2 { continue }

			for neighbor in adjacencyList[node, default: []] {
				let val = neighbor.node
				let weight = neighbor.weight
				let nextPossibleWeight = distances[node] + weight
				if (nextPossibleWeight < distances[val]) {
					distances[val] = nextPossibleWeight
				}
			}
		}

		return distances.map { $0 == Int.max / 2 ? -1: $0 }
	}
}


#Playground {
	let graph = GraphsImpl()
	
	_ = graph.shortestPath(7, edges: CodeTemplatesImpl.directedShortestPathEdges)
}
