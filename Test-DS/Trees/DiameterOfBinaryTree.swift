//
//  DiameterOfBinaryTree.swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 10/12/25.
//

import Foundation

extension TreesProblemsImpl {
	func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
		var res = 0

		func dfs(_ root: TreeNode?) -> Int {
			if root == nil {
				return 0
			}
			let leftHeight = dfs(root?.left)
			let rightHeight = dfs(root?.right)
			res = max(res, leftHeight + rightHeight)
			return 1 + max(leftHeight, rightHeight)
		}

		_ = dfs(root)
		return res
	}
}
