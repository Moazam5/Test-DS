//
//  CloneGraph.swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 1/21/26.
//

import Foundation

extension GraphsImpl {
	func cloneGraph(_ node: Node?) -> Node? {
		var oldToNew: [Int: Node] = [:]

		func dfs(_ node: Node?) -> Node? {
			guard let node else {
				return nil
			}
			if let newNode = oldToNew[node.val] {
				return newNode
			}

			let newNode = Node(node.val)
			oldToNew[node.val] = newNode
			for neighbor in node.neighbors {
				newNode.neighbors.append(dfs(neighbor))
			}
			return newNode
		}
		return dfs(node)
	}
}
