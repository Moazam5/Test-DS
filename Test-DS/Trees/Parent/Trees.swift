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
}




