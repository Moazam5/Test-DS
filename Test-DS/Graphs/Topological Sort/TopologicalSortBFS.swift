//
//  TopologicalSortBFS.swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 2/13/26.
//

import Foundation

extension GraphsImpl {
	func topologicalSortBFS(adjacencyList: [Int : [Int]], vertices: Int) -> [Int] {
		var indegree = Array(repeating: 0, count: vertices)
		var q = Array<Int>()
		var topoResult = Array<Int>()
		q.reserveCapacity(vertices)
		topoResult.reserveCapacity(vertices)
		for vertex in 0..<vertices {
			for neighbor in adjacencyList[vertex, default: []] {
				indegree[neighbor] += 1
			}
		}
		for (index, ind) in indegree.enumerated() where ind == 0 {
			q.append(index)
		}

		while !q.isEmpty {
			let node = q.removeFirst()
			topoResult.append(node)

			for neighbor in adjacencyList[node, default: []] {
				indegree[neighbor] -= 1
				if indegree[neighbor] == 0 {
					q.append(neighbor)
				}
			}
		}
		// Cycle check
		return topoResult.count == vertices ? topoResult : []
	}
}
