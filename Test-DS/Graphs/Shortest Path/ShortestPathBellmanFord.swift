//
//  ShortestPathBellmanFord.swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 2/22/26.
//

import Foundation

extension GraphsImpl {

	/// Given an weighted graph with V vertices numbered from 0 to V-1 and E edges, represented by a 2d array edges[][],
	/// where edges[i] = [u, v, w] represents a direct edge from node u to v having w edge weight. You are also given a source vertex src.
	/// Your task is to compute the shortest distances from the source to all other vertices.
	/// If a vertex is unreachable from the source, its distance should be marked as 108.
	/// Additionally, if the graph contains a negative weight cycle, return [-1] to indicate that shortest paths cannot be reliably computed.
	@discardableResult
	func bellmanFord(_ vertices: Int, _ edges: [[Int]], _ src: Int) -> [Int] {
		let INF = Int.max / 4
		var distances = Array(repeating: INF, count: vertices)
		distances[src] = 0

		for _ in 0..<vertices - 1 {
			for edge in edges {
				let u = edge[0]
				let v = edge[1]
				let w = edge[2]

				if distances[u] == INF {
					continue
				}
				let uToV = distances[u] + w
				if uToV < distances[v] {
					distances[v] = uToV
				}
			}
		}
		// Nth relaxation for cycle detection.
		for edge in edges {
			let u = edge[0]
			let v = edge[1]
			let w = edge[2]
			if distances[u] == INF {
				continue
			}
			let uToV = distances[u] + w
			if uToV < distances[v] {
				return [-1]
			}
		}
		return distances
	}
}

// TODO: Add playground with an example.
import Playgrounds
#Playground {
	let d = GraphsImpl.shared.bellmanFord(5, [[2,1,1],[2,3,1],[3,4,1]], 2)
	let r = d.max() ?? -1
}
