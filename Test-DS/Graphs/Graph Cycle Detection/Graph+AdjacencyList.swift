//
//  Graph+AdjacencyList.swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 2/11/26.
//

import Foundation

extension GraphsImpl {
	// Helper method to create adjacency list from the given list of edges.
	func createAdjacencyList(from edges: [[Int]]) -> [Int: [Int]] {
		var adjacencyList: [Int: [Int]] = [:]

		for edge in edges {
			let u = edge[0]
			let v = edge[1]

			adjacencyList[u, default: []].append(v)
			adjacencyList[v, default: []].append(u)
		}
		return adjacencyList
	}
}
