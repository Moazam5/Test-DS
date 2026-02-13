//
//  CycleDetectionKahnsAlgorithm.swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 2/13/26.
//

import Foundation

extension GraphsImpl {
	func hasCycleKahns(adjacencyList: [Int : [Int]]) -> Bool {
		// Built on top of topo sort.
		let topoResult = self.topologicalSortBFS(adjacencyList: adjacencyList, vertices: adjacencyList.keys.count)
		return topoResult.count != adjacencyList.keys.count
	}

	// Detailed version
	func hasCycleKahnsDetailed(adjacencyList: [Int : [Int]], vertices: Int) -> Bool {
		var indegree = Array(repeating: 0, count: vertices)
		var q = Array<Int>()
		q.reserveCapacity(vertices)
		for vertex in 0..<vertices {
			for neighbor in adjacencyList[vertex, default: []] {
				indegree[neighbor] += 1
			}
		}

		for i in 0..<vertices where indegree[i] == 0 {
			q.append(i)
		}

		var index = 0
		var total = 0
		while index < q.count {
			let node = q[index]
			total += 1
			index += 1
			for neighbor in adjacencyList[node, default: []] {
				indegree[neighbor] -= 1
				if indegree[neighbor] == 0 {
					q.append(neighbor)
				}
			}
		}
		return total != vertices
	}
}
