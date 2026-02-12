//
//  CycleDetectionDFSWithState.swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 1/24/26.
//

import Foundation

extension GraphsImpl {
	func hasCycleDFSWithStateEnum(adjacencyList: [Int: [Int]]) -> Bool {
		enum NodeState {
			case white
			case gray
			case black
		}
		// Initialize empty state dict
		var state: [Int: NodeState] = [:]
		// Fill the dictionary white keys set to white
		adjacencyList.keys.forEach { key in
			state[key] = .white
		}

		// returns true if a cycle is detected
		func dfs(_ node: Int) -> Bool {
			if state[node] == .black { // already visited
				return false
			}
			if state[node] == .gray { // cycle detected
				return true
			}
			state[node] = .gray // mark as visiting the current node
			
			// visit the neighbors for the current node
			if let neighbors = adjacencyList[node] {
				for neighbor in neighbors {
					if dfs(neighbor) {
						return true
					}
				}
			}
			state[node] = .black  // ✅ Mark as fully processed
			return false
		}

		for node in adjacencyList.keys {
			if state[node] == .white {
				if dfs(node) {
					return true
				}
			}
		}
		return false
	}
}
