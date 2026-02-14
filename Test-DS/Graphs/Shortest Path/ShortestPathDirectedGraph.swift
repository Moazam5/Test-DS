//
//  ShortestPathDirectedGraph.swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 2/14/26.
//

import Foundation
import Playgrounds

extension GraphsImpl {
	/// edge[i][0] to edge[i][1] with a distance of edge[i][2] for all i.
	func shortestPath(_ n: Int, _ m: Int, edges: [[Int]]) -> [Int] {
		var adjacencyList: [Int: [(node: Int, weight: Int)]] = [:]
		for edge in edges {
			let node = edge[0]
			let neighbor = edge[1]
			let weight = edge[2]
			adjacencyList[node, default: []].append((node: neighbor, weight: weight))
		}

		// Step 1: Create stack using topo sort
		
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

		// Step 2a: Initialize an array with n value to infinity
		var distances = Array(repeating: Int.max, count: n)
		// Source node, if not given set to 0
		distances[0] = 0

		// Step 2b: Update distances array
		while !stack.isEmpty {
			let node = stack.removeLast()
			if distances[node] == Int.max { continue } // This is important to avoid overflowing.
			for neighbor in adjacencyList[node, default: []] {
				let val = neighbor.node
				let weight = neighbor.weight
				let nextPossibleWeight = distances[node] + weight
				if (nextPossibleWeight < distances[val]) {
					distances[val] = nextPossibleWeight
				}
			}
		}
		return distances.map { $0 == Int.max ? -1: $0 }
	}
}


#Playground {
	let graph = GraphsImpl()
	let edges = [
		[0,1,2],
		[1,3,1],
		[2,3,3],
		[4,0,3],
		[4,2,1],
		[5,4,1],
		[6,4,2],
		[6,5,3]
	]
	_ = graph.shortestPath(7, 8, edges: edges)
}
