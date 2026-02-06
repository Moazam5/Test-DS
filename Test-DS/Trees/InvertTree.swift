//
//  InvertTree.swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 11/10/25.
//

import Foundation

// MARK: - Invert Tree

extension TreesProblemsImpl {
	/// Inverts a binary tree in-place by swapping the left and right subtrees of every node.
	/// - Parameter root: The root of the tree to invert.
	/// - Returns: The same root node after inversion.
	/// - Complexity: O(n) time, O(h) space due to recursion.
	func invertTree(root: TreeNode?) -> TreeNode? {
		guard let root = root else { return nil }
		// Invert left sub-tree
		let left = invertTree(root: root.left)
		// Invert right sub-tree
		let right = invertTree(root: root.right)
		// Assign the new sub-trees
		root.left = right
		root.right = left
		return root
	}

	func invertTree2(_ root: TreeNode?) -> TreeNode? {
		guard let root else {
			return nil
		}
		let left = invertTree2(root.left)
		let right = invertTree2(root.right)
		root.left = right
		root.right = left
		return root
	}
	func maxPathSum(_ root: TreeNode?) -> Int {
		var res = 0

		func dfs(_ root: TreeNode?) -> Int {
			guard let root else {
				return 0
			}
			let left = max(0, dfs(root.left))
			let right = max(0, dfs(root.right))
			res = max(res, root.value + left + right)
			return root.value + max(left, right)

		}
		dfs(root)
		return res
	}
}
