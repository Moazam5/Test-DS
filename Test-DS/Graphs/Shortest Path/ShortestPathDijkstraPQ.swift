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
			// I keep falling for this one, its a 2d array when you get a value for it and when you do for, its 1d for the value, ie, edge
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
	let result = GraphsImpl.shared.shortestPathUndirectedDijkstraPQ(6, adjacency: CodeTemplatesImpl.shortestPathDijkstra, src: 0)
}
