//
//  IsBalanced.swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 10/12/25.
//

import Foundation

extension TreesProblemsImpl {
	func isBalanced(_ root: TreeNode?) -> Bool {
		var res = true

		func dfs(_ root: TreeNode?) -> Int {
			guard let root else { return 0 }
			let left = dfs(root.left)
			let right = dfs(root.right)
			if abs(left - right) > 1 {
				res = false
			}
			return max(left, right) + 1
		}
		_ = dfs(root)
		return res
	}
}
