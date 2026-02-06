//
//  IsBipartiteDFS.swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 1/23/26.
//

import Foundation

extension GraphsImpl {
	func isBipartiteDFS(adjacencyList: [Int : [Int]], vertices: Int) -> Bool {
		var colors = Array(repeating: -1, count: vertices)

		func dfsCheck(_ node: Int, _ color: Int) -> Bool {
			colors[node] = color

			if let neighbors = adjacencyList[node] {
				for neighbor in neighbors {
					if colors[neighbor] == -1 {
						// Color with opposite color and recurse
						if !dfsCheck(neighbor, 1 - color) {
							return false
						}
					} else if colors[neighbor] == color {
						// Same color as current node - not bipartite
						return false
					}
				}
			}

			return true
		}

		// Handle disconnected components
		for vertex in 0..<vertices {
			if colors[vertex] == -1 {
				if !dfsCheck(vertex, 0) {
					return false
				}
			}
		}

		return true
	}

}
