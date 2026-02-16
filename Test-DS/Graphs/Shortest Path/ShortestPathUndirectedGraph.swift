//
//  ShortestPathUndirectedGraph.swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 2/14/26.
//

import Foundation

extension GraphsImpl {
	func shortestPathUndirected(_ v: Int, edges: [[Int]], src: Int) -> [Int] {
		let adjacencyList = self.createUndirectedAdjacencyList(from: edges)
		var q: [(value: Int, weight: Int)] = []
		var distances = Array(repeating: Int.max, count: v)
		distances[src] = 0
		q.append((src, 0))

		while !q.isEmpty {
			let node = q.removeFirst()
			for neighbor in adjacencyList[node.value, default: []] {
				let currentDistance = distances[neighbor]
				let distanceFromCurrentNode = distances[node.value] + 1
				if distanceFromCurrentNode < currentDistance  {
					distances[neighbor] = distanceFromCurrentNode
					q.append((value: neighbor, weight: distances[neighbor]))
				}
			}
		}

		return distances.map { $0 == Int.max ? -1 : $0 }
	}

	// Doesn't store the weight in the queue
	func shortestPathUndirectedChatGPT(_ v: Int, edges: [[Int]], src: Int) -> [Int] {
		let adjacencyList = createUndirectedAdjacencyList(from: edges)

		var dist = Array(repeating: Int.max, count: v)
		dist[src] = 0

		var q: [Int] = [src]
		var head = 0

		while head < q.count {
			let node = q[head]
			head += 1

			for neighbor in adjacencyList[node, default: []] {
				if dist[node] + 1 < dist[neighbor] {
					dist[neighbor] = dist[node] + 1
					q.append(neighbor)
				}
			}
		}

		return dist.map { $0 == Int.max ? -1 : $0 }
	}
}
