//
//  TreeProblemsImpl.swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 10/12/25.
//

import Foundation

/// Implementation class to implement the functionality.
class TreesProblemsImpl: TreesProblems {
	func deleteNode(_ root: TreeNode?, _ key: Int) -> TreeNode? {
		guard let root = root else {
			return nil
		}

		if root.value > key {
			root.left = deleteNode(root.left, key)
		} else if root.value < key {
			root.right = deleteNode(root.right, key)
		} else {
			// Case 1: leaf node
			if root.left == nil && root.right == nil {
				return nil
			} else if root.left == nil { // Node has only right child
				return root.right
			} else if root.right == nil { // node has only left child
				return root.left
			} else { // has both children
				let successor = findMinimum(root.right)
				root.value = successor!.value
				root.right = deleteNode(root.right, successor!.value) // remove sucessor
			}
		}
		return root
	}

	func findMinimum(_ node: TreeNode?) -> TreeNode? {
		guard let node else {
			return nil
		}
		var current = node
		while let leftNode = current.left {
			current = leftNode
		}
		return current
	}

	func findSuccessor(root: TreeNode?, targetNode: TreeNode?) -> TreeNode? {
		guard let root, let targetNode else {
			return nil
		}
		if let rightNode = targetNode.right {
			return self.findMinimum(rightNode)
		}
		// Case 2: Target node does NOT have a right child
		// We must traverse from the root to find the successor.
		// The successor will be the lowest ancestor of 'targetNode'
		// whose left child is also an ancestor of 'targetNode'.
		var successor: TreeNode?
		var current: TreeNode? = root

		while let trav = current {
			if trav.value > targetNode.value {
				successor = trav
				current = trav.left
			} else if trav.value < targetNode.value {
				current = trav.right
			} else {
				break
			}
		}

		return successor
	}
}
