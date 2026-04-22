//
//  MinMultiplicationsToReachEnd.swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 4/21/26.
//

import Foundation

extension GraphsImpl {
	// Given start, end and an array arr[] of n numbers.
	// At each step, start is multiplied with any number in the array and then mod operation with m = 100000 is done to get the new start.
	// Find the minimum steps in which end can be achieved starting from start. If it is not possible to reach end, then return -1.
	func minimumMultiplications(_ arr: [Int], _ start: Int, _ end: Int) -> Int {
		let MOD = 100000
		var distances = Array(repeating: Int.max, count: MOD)  // ✅ size MOD, init to max
		distances[start] = 0

		var q = [(distance: Int, node: Int)]()
		q.append((0, start))

		while !q.isEmpty {
			let currNode = q.removeFirst()

			if currNode.node == end {
				return currNode.distance
			}

			for val in arr {
				let neighbor = currNode.node * val % MOD
				let newDist = currNode.distance + 1

				if distances[neighbor] > newDist {
					distances[neighbor] = newDist  // ✅ correct value
					q.append((newDist, neighbor))  // ✅ only enqueue if shorter path found
				}
			}
		}

		return -1
	}
}
