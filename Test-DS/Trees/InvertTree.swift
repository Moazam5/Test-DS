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
}
