//
//  PossibleBipartition.swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 1/23/26.
//

import Foundation

extension GraphsImpl {
	func possibleBipartition(_ n: Int, _ dislikes: [[Int]]) -> Bool {
		var adjacencyList: [[Int]] = Array(repeating: [], count: n)
		for dislike in dislikes {
			let a = dislike[0]
			let b = dislike[1]
			adjacencyList[a].append(b)
			adjacencyList[b].append(a)
		}

		return isBipartite(adjacencyList)
	}

	/// Faster
	func possibleBipartitionDFS(_ n: Int, _ dislikes: [[Int]]) -> Bool {
		var adjacencyList: [[Int]] = Array(repeating: [], count: n + 1)
		for dislike in dislikes {
			let a = dislike[0]
			let b = dislike[1]
			adjacencyList[a].append(b)
			adjacencyList[b].append(a)
		}

		var colors = Array(repeating: -1, count: n + 1)

		for vertex in 1...n {
			if colors[vertex] == -1 {
				if !dfs(vertex, 0) {
					return false
				}
			}
		}
		return true

		func dfs(_ node: Int, _ color: Int) -> Bool {
			colors[node] = color

			let neighbors = adjacencyList[node]
			for neighbor in neighbors {
				if colors[neighbor] == -1 {
					if !dfs(neighbor, 1 - color) {
						return false
					}
				} else if colors[neighbor] == color {
					return false
				}
			}
			return true
		}
	}
}
