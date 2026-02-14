//
//  AlienDictionary.swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 2/13/26.
//

import Foundation
import Playgrounds

extension GraphsImpl {
	func foreignDictionary(_ words: [String]) -> String {
		var adjacencyList: [Character: Set<Character>] = [:]
		var indegree: [Character: Int] = [:]
		var res = Array<Character>()

		// create all nodes
		for word in words {
			for ch in word {
				adjacencyList[ch] = []
			}
		}

		// build edges from adjacent words
		for i in 0..<words.count - 1 {
			let s1 = Array(words[i])
			let s2 = Array(words[i + 1])
			let m = min(s1.count, s2.count)

			var foundDiff = false

			for j in 0..<m {
				if s1[j] != s2[j] {
					if adjacencyList[s1[j], default: []].insert(s2[j]).inserted {
						indegree[s2[j], default: 0] += 1
					}
					foundDiff = true
					break
				}
			}

			// invalid: longer word comes before its prefix
			if !foundDiff && s1.count > s2.count {
				return ""
			}
		}

		// kahn's topo sort
		let nodes = adjacencyList.keys.count
		var q = Array<Character>()
		q.reserveCapacity(nodes)

		for key in adjacencyList.keys {
			if indegree[key, default: 0] == 0 {
				q.append(key)
			}
		}

		var index = 0
		while index < q.count {
			let node = q[index]
			index += 1
			res.append(node)

			for neighbor in adjacencyList[node, default: []] {
				indegree[neighbor, default: 0] -= 1
				if indegree[neighbor] == 0 {
					q.append(neighbor)
				}
			}
		}

		return res.count == nodes ? String(res) : ""
	}
}


#Playground {
	let graph = GraphsImpl()
	graph.foreignDictionary(["hrn","hrf","er","enn","rfnn"])
}

