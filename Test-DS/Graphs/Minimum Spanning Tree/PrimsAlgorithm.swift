//
//  PrimsAlgorithm.swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 2/22/26.
//

import Foundation
import HeapModule
import Playgrounds

extension GraphsImpl {
	/// Function to find the sum of edges of the Minimum Spanning Tree.
	/// - Parameters:
	///   - vertices: Number of vertices
	///   - adj: Adjacency List
	/// - Returns: sum of edges in the MST.
	@discardableResult
	func spanningTreeMST(_ vertices: Int, adj: [[[Int]]], src: Int = 0) -> [(Int, Int)] {
		var pq = Heap<HeapItem>()
		var visited = Array(repeating: false, count: vertices)
		var mst = [(Int, Int)]()
		pq.insert(HeapItem(weight: 0, node: src, parent: -1))

		while !pq.isEmpty {
			guard let item = pq.popMin(), !visited[item.node] else { continue }

			visited[item.node] = true
			if item.parent != -1 {
				mst.append((item.node, item.parent))
			}

			for neighbor in adj[item.node] {
				let adjNode = neighbor[0]
				let adjWeight = neighbor[1]
				if !visited[adjNode] {
					pq.insert(HeapItem(weight: adjWeight, node: adjNode, parent: item.node))
				}
			}
		}
		return mst
	}


	/// Function to find the sum of edges of the Minimum Spanning Tree.
	/// - Parameters:
	///   - vertices: Number of vertices
	///   - adj: Adjacency List
	/// - Returns: sum of edges in the MST.
	@discardableResult
	func spanningTreeSum(_ vertices: Int, adj: [[[Int]]], src: Int = 0) -> Int {
		var pq = Heap<HeapItem>()
		var visited = Array(repeating: false, count: vertices)
		var sum = 0
		pq.insert(HeapItem(weight: 0, node: src, parent: -1))

		while !pq.isEmpty {
			guard let item = pq.popMin(), !visited[item.node] else { continue }

			visited[item.node] = true
			sum += item.weight

			for neighbor in adj[item.node] {
				let adjNode = neighbor[0]
				let adjWeight = neighbor[1]
				if !visited[adjNode] {
					pq.insert(HeapItem(weight: adjWeight, node: adjNode, parent: item.node))
				}
			}
		}
		return sum
	}

	private struct HeapItem: Comparable {
		let weight: Int
		let node: Int
		let parent: Int

		static func < (lhs: GraphsImpl.HeapItem, rhs: GraphsImpl.HeapItem) -> Bool {
			return lhs.weight < rhs.weight
		}
	}

}

#Playground {
	let adj: [[[Int]]] = [
		[[1,2], [2,1]],                // 0
		[[0,2], [2,1], [4,2]],         // 1
		[[0,1], [1,1], [4,2], [3,2]],  // 2
		[[2,2], [4,1]],                // 3
		[[1,2], [2,2], [3,1]]          // 4
	]

	GraphsImpl.shared.spanningTreeSum(5, adj: adj)
	GraphsImpl.shared.spanningTreeMST(5, adj: adj)
}
