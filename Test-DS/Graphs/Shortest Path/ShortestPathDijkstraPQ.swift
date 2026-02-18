//
//  ShortestPathDijkstra.swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 2/16/26.
//

import Foundation
import HeapModule
import Playgrounds

extension GraphsImpl {
	func shortestPathUndirectedDijkstraPQ(_ v: Int, adjacency: [[[Int]]], src: Int) -> [Int] {
		var pq = Heap<Item>()
		var distance = Array(repeating: Int.max / 2, count: v)
		distance[src] = 0
		pq.insert(Item(0, src))

		while !pq.isEmpty {
			guard let item = pq.popMin() else {
				break
			}
			// ignore stale entries
			if item.weight != distance[item.value] { continue }

			// adjacency[item.value] is the edge list for this node
			for edge in adjacency[item.value] {
				let edgeValue = edge[0]
				let edgeWeight = edge[1]

				let newDist = item.weight + edgeWeight
				if newDist < distance[edgeValue] {
					distance[edgeValue] = newDist
					pq.insert(Item(newDist, edgeValue))
				}
			}
		}
		return distance
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
	let graph: [[[Int]]] = [
		[[1, 1], [3, 4]],      // edges from node 0
		[[0, 1], [2, 2], [3, 3]], // node 1
		[[1, 2]],              // node 2
		[[0, 4], [1, 3]]       // node 3
	]

	let graphImpl = GraphsImpl()
	let result = graphImpl.shortestPathUndirectedDijkstraPQ(4, adjacency: graph, src: 0	)
}
