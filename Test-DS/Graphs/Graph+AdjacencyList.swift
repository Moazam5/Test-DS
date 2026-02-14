//
//  Graph+AdjacencyList.swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 2/11/26.
//

import Foundation

extension GraphsImpl {
	// Helper method to create undirected adjacency list from the given list of edges.
	func createUndirectedAdjacencyList(from edges: [[Int]]) -> [Int: [Int]] {
		var adjacencyList: [Int: [Int]] = [:]

		for edge in edges {
			let u = edge[0]
			let v = edge[1]

			adjacencyList[u, default: []].append(v)
			adjacencyList[v, default: []].append(u)
		}
		return adjacencyList
	}

	// Helper method to create directed adjacency list from the given list of edges.
	func createDirectedAdjacencyList(from edges: [[Int]], vertices: Int) -> [Int: [Int]] {
		var adjacencyList: [Int: [Int]] = [:]
		for i in 0..<vertices {
			adjacencyList[i] = []
		}

		for edge in edges {
			let key = edge[0]
			let val = edge[1]
			adjacencyList[key, default: []].append(val)
		}
		return adjacencyList
	}
}
