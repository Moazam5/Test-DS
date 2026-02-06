//
//  CanFinish.swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 1/24/26.
//

import Foundation

extension GraphsImpl {
	func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
		var visited = Set<Int>()
		var visiting = Set<Int>()
		var adjacencyList: [Int: [Int]] = [:]
		for i in 0..<numCourses {
			adjacencyList[i] = []
		}

		for prerequisite in prerequisites {
			let key = prerequisite[0]
			let val = prerequisite[1]
			adjacencyList[key]?.append(val)
		}

		// Returns true if cycle is detected.
		func dfs(_ node: Int) -> Bool {
			if visited.contains(node) {
				return false
			}
			if visiting.contains(node) {
				return true 
			}
			visiting.insert(node)
			if let neighbors = adjacencyList[node] {
				for neighbor in neighbors {
					if dfs(neighbor) {
						return true
					}
				}
			}
			visited.insert(node)
			visiting.remove(node)
			return false
		}

		for vertex in 0..<numCourses {
			if !visited.contains(vertex) {
				if dfs(vertex) {
					return false
				}
			}
		}
		return true
	}
}
