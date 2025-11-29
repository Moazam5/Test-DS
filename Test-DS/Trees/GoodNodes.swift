//
//  GoodNodes.swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 11/25/25.
//

import Foundation

extension TreesProblemsImpl {
	func goodNodes(_ root: TreeNode?) -> Int {
		guard let root else {
			return 0
		}

		var goodNodesCount = 0
		func dfs(_ node: TreeNode?, _ maxSoFar: Int)  {
			guard let node else {
				return
			}

			if node.value >= maxSoFar {
				goodNodesCount += 1
			}

			dfs(node.left, max(node.value, maxSoFar))
			dfs(node.right, max(node.value, maxSoFar))
		}

		dfs(root, root.value)
		return goodNodesCount
	}
}
