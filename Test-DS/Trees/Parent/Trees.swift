//
//  Trees.swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 7/29/25.
//

import Foundation

enum Trees {}

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
}


