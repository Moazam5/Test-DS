//
//  BFS.swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 11/11/25.
//

import Foundation
import Testing
import Playgrounds

extension TreesProblemsImpl {
	func bfs(_ root: TreeNode?) -> [Int] {
		if root == nil { return [] }
		var q = [TreeNode]()
		var res = [Int]()
		q.append(root!)
		while !q.isEmpty {
			let node = q.removeFirst()
			res.append(node.value)
			if let left = node.left { q.append(left) }
			if let right = node.right { q.append(right) }
		}
		return res
	}
}

#Playground {
	let root1 = TreeNode(value: 1,
						left: TreeNode(value: 2,
									   left: TreeNode(value: 4),
									   right: TreeNode(value: 5)),
						right: TreeNode(value: 3,
										left: TreeNode(value: 6),
										right: TreeNode(value: 7)))
	let result1 = TreesProblemsImpl().bfs(root1) // [1,2,3,4,5,6,7]

	let root2 = TreeNode(value: 10,
						left: TreeNode(value: 20,
									   left: nil,
									   right: TreeNode(value: 30,
													   left: nil,
													   right: TreeNode(value: 40))),
						right: nil)
	let result2 = TreesProblemsImpl().bfs(root2) // [10,20,30,40]
}
