//
//  DFS.swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 9/2/25.
//

import Foundation

// TODO: To be implemented properly.
extension TreesProblemsImpl {
	func dfs(_ root: TreeNode?) -> [Int] {
		if root == nil {
			return []
		}
		var stack = Array<TreeNode>()
		var visited = Set<Int>()
		stack.append(root!)
		while !stack.isEmpty {
			if let leftNode = root?.left {
				stack.append(leftNode)
			}
			if let rightNode = root?.right {
				stack.append(rightNode)
			}
			

		}
		return []
	}
}
