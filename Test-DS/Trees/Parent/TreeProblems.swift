//
//  TreeProblems.swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 1/18/26.
//

import Foundation

/// Protocol to define all the methods that are supported.
protocol TreesProblems {
	func invertTree(root: TreeNode?) -> TreeNode?
	/// Returns the height of the tree.
	func maxDepth(_ root: TreeNode?) -> Int

	/// The diameter of a binary tree is defined as the length of the longest path between any two nodes within the tree. The path does not necessarily have to pass through the root.
	/// The length of a path between two nodes in a binary tree is the number of edges between the nodes. Note that the path can not include the same node twice.
	///
	/// Given the root of a binary tree root, return the diameter of the tree.
	func diameterOfBinaryTree(_ root: TreeNode?) -> Int

	/// Given a binary tree, return true if it is height-balanced and false otherwise.
	///
	/// A height-balanced binary tree is defined as a binary tree in which the left and right subtrees of every node differ in height by no more than 1.
	func isBalanced(_ root: TreeNode?) -> Bool

	/// Given the roots of two binary trees p and q, write a function to check if they are the same or not.
	/// Two binary trees are considered the same if they are structurally identical, and the nodes have the same value.
	/// https://leetcode.com/problems/same-tree/description/
	func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool

	func levelOrder(_ root: TreeNode?) -> [[Int]]

	func bfs(_ root: TreeNode?) -> [Int]

	func rightSideView(_ root: TreeNode?) -> [Int]

	/// Within a binary tree, a node x is considered good if the path from the root of the tree to the node x contains no nodes with a value greater than the value of node x
	/// Given the root of a binary tree root, return the number of good nodes within the tree.
	func goodNodes(_ root: TreeNode?) -> Int

	/// Given the root of a binary tree, return true if it is a valid binary search tree, otherwise return false.
	///	A valid binary search tree satisfies the following constraints:
	///
	/// The left subtree of every node contains only nodes with keys less than the node's key.
	/// The right subtree of every node contains only nodes with keys greater than the node's key.
	/// Both the left and right subtrees are also binary search trees.
	func isValidBST(_ root: TreeNode?) -> Bool

	/// Given the root of a binary search tree, and an integer k, return the kth smallest value (1-indexed) in the tree.
	func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int

	/// https://leetcode.com/problems/insert-into-a-binary-search-tree/
	func insertIntoBST(_ root: TreeNode?, _ val: Int) -> TreeNode?

	/// https://leetcode.com/problems/delete-node-in-a-bst/
	func deleteNode(_ root: TreeNode?, _ key: Int) -> TreeNode?

	func findMinimum(_ node: TreeNode?) -> TreeNode?

	func findSuccessor(root: TreeNode?, targetNode: TreeNode?) -> TreeNode?

}
