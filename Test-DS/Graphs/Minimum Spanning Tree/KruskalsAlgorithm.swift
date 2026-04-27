//
//  KruskalsAlgorithm.swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 4/25/26.
//

import Foundation
import Playgrounds

extension GraphsImpl {
	@discardableResult
	func spanningTree(_ V: Int, _ adj: [[(node: Int, wt: Int)]]) -> Int {
		var edges: [(wt: Int, u: Int, v: Int)] = []
		var ds = DisjointSet(n: V)
		var mstWeight = 0
		// Create list of edges
		// O(N + E)
		for i in 0..<V {
			for it in adj[i] {
				edges.append((it.wt, i, it.node))
			}
		}
		// O(M Log M)
		edges.sort { $0.wt < $1.wt }
		// Update disjoint set
		// O(M * 4 * alpha * 2)
		for edge in edges {
			let (wt, u, v) = edge

			if ds.findUltimateParent(node: u) != ds.findUltimateParent(node: v) {
				mstWeight += wt
				ds.unionBySize(u: u, v: v)
			}

		}
		return mstWeight
	}
}

#Playground {
	let V = 5
	let adj: [[(node: Int, wt: Int)]] = [
		[(node: 1, wt: 2), (node: 3, wt: 6)],           // 0
		[(node: 0, wt: 2), (node: 2, wt: 3), (node: 3, wt: 8), (node: 4, wt: 5)], // 1
		[(node: 1, wt: 3), (node: 4, wt: 7)],            // 2
		[(node: 0, wt: 6), (node: 1, wt: 8), (node: 4, wt: 9)], // 3
		[(node: 1, wt: 5), (node: 2, wt: 7), (node: 3, wt: 9)]  // 4
	]

	let V2 = 6
	let adj2: [[(node: Int, wt: Int)]] = [
		[],
		[(node: 2, wt: 2), (node: 4, wt: 1), (node: 5, wt: 4)],           // 1
		[(node: 4, wt: 3), (node: 3, wt: 3), (node: 6, wt: 7), (node: 1, wt: 2)], // 2
		[(node: 4, wt: 5), (node: 6, wt: 8), (node: 2, wt: 3)],            // 3
		[(node: 5, wt: 9), (node: 1, wt: 1), (node: 2, wt: 3), (node: 3, wt: 5)], // 4
		[(node: 4, wt: 9), (node: 1, wt: 4)],  // 5
		[(node: 3, wt: 8), (node: 2, wt: 7)]  // 6
	]

	GraphsImpl.shared.spanningTree(V, adj)
	GraphsImpl.shared.spanningTree(V2, adj2)
}
