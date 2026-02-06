//
//  InsertIntoTree.swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 1/18/26.
//

import Foundation

extension TreesProblemsImpl {
	func insertIntoBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
		let newNode = TreeNode(value: val)

		var currentNode = root
		var parentNode: TreeNode?

		while let node = currentNode {
			parentNode = node
			if node.value < val {
				currentNode = node.right
			} else {
				currentNode = node.left
			}
		}

		guard let parentNode else {
			return newNode
		}

		if parentNode.value > val {
			parentNode.left = newNode
		} else {
			parentNode.right = newNode
		}
		return root
	}
}
