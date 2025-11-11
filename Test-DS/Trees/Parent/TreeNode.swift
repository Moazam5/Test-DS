//
//  TreeNode.swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 7/29/25.
//

import Foundation

/// Main tree node.
class TreeNode {
	var value: Int
	var left: TreeNode?
	var right: TreeNode?

	init(value: Int, left: TreeNode? = nil, right: TreeNode? = nil) {
		self.value = value
		self.left = left
		self.right = right
	}
}
