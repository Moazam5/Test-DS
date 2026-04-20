//
//  ShortestPathInUndirectedGraph.swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 4/20/26.
//

import Foundation
import HeapModule
import Playgrounds

extension GraphsImpl {
	@discardableResult
	func printShortestPath(_ n: Int, _ m: Int, edges: [[Int]]) -> [Int] {
		var adjacencyList: [Int: [(node: Int, distance: Int)]] = [:]
			for edge in edges {
				let a = edge[0], b = edge[1], w = edge[2]
				adjacencyList[a, default: []].append((b, w))
				adjacencyList[b, default: []].append((a, w))  // Bug 1 fix: undirected
			}

			let MAX = Int.max / 2
			var distances = Array(repeating: MAX, count: n + 1)
			var parents = Array(0...n)
			distances[1] = 0

			var pq = Heap<Item>()
			pq.insert(Item(0, 1))

			while !pq.isEmpty {
				guard let item = pq.popMin() else { break }

				// Skip stale entries
				if item.weight > distances[item.value] { continue }

				for edge in adjacencyList[item.value, default: []] {
					let newDistance = edge.distance + item.weight
					if distances[edge.node] > newDistance {
						distances[edge.node] = newDistance
						parents[edge.node] = item.value
						pq.insert(Item(newDistance, edge.node))
					}
				}
			}

			// No path found
			if distances[n] == MAX { return [-1] }

			// Bug 2 fix: reconstruct path including node n
			var path = [Int]()
			var node = n
			while parents[node] != node {
				path.append(node)
				node = parents[node]
			}
			path.append(1)

			// Bug 3 fix: prepend total weight
			return [distances[n]] + path.reversed()
	}

	private struct Item: Comparable {
		let weight: Int
		let value: Int

		init(_ weight: Int, _ value: Int) {
			self.weight = weight
			self.value = value
		}
		static func < (lhs: Item, rhs: Item) -> Bool {
			if lhs.weight == rhs.weight {
				return lhs.value < rhs.value
			}
			return lhs.weight < rhs.weight
		}
	}
}

#Playground {
	let n = 5, m = 6, edges = [[1, 2, 2], [2, 5, 5], [2, 3, 4], [1, 4, 1], [4, 3, 3], [3, 5, 1]]
	GraphsImpl.shared.printShortestPath(n, m, edges: edges)
}
