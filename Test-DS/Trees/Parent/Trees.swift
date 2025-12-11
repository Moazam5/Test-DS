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

	/// Given the root of a binary search tree, and an integer k, return the kth smallest value (1-indexed) in the tree.
	func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int
}

extension TreesProblemsImpl {
	/*

			4
		2		6
	 1		3		7
	 1 2 3 4 6 7

	 */
	func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
		var index = 0  // Start at 0, increment when visiting
		
		func inorder(_ root: TreeNode?, index: inout Int) -> Int? {
			guard let root else {
				return nil
			}

			// Check left subtree
			if let result = inorder(root.left, index: &index) {
				return result  // Found it in left subtree!
			}

			// Visit current node
			index += 1
			if index == k {
				return root.value  // Found it!
			}

			// Check right subtree
			if let result = inorder(root.right, index: &index) {
				return result  // Found it in right subtree!
			}

			return nil
		}

		return inorder(root, index: &index) ?? -1
	}

	func kthSmallestLessOptimal(_ root: TreeNode?, _ k: Int) -> Int {
		var sortedValues: [Int] = []

		func inorder(_ root: TreeNode?, values: inout [Int]) {
			guard let root else {
				return
			}

			inorder(root.left, values: &values)
			values.append(root.value)
			inorder(root.right, values: &values)
		}
		inorder(root, values: &sortedValues)
		if sortedValues.count >= k {
			return sortedValues[k - 1]
		}
		return -1
	}
}

