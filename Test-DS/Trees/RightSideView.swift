//
//  RightSideView.swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 11/19/25.
//

import Foundation

//You are given the root of a binary tree. Return only the values of the nodes that are visible from the right side of the tree, ordered from top to bottom.

extension TreesProblemsImpl {

	// DFS
	func rightSideView(_ root: TreeNode?) -> [Int] {
		guard let root = root else {
			return []
		}
		var result: [Int] = []

		func dfsHelper(_ root: TreeNode?, depth: Int = 0) {
			guard let root = root else {
				return
			}

			if result.count == depth {
				result.append(root.value)
			}
			dfsHelper(root.right, depth: depth + 1)
			dfsHelper(root.left, depth: depth + 1)
		}

		dfsHelper(root)
		return result
	}

	// My BFS Approach
	func rightSideView2(_ root: TreeNode?) -> [Int] {
		 var res = [Int]()
		 var q = Array<TreeNode?>()
		 q.append(root)

		 while !q.isEmpty {
			 let len = q.count
			 var rightNode: TreeNode?
			 for _ in 0..<len {
				 if let node = q.removeFirst() {
					 rightNode = node
					 q.append(node.left)
					 q.append(node.right)
				 }
			 }
			 if let right = rightNode {
				 res.append(right.value)
			 }
		 }
		 return res
	 }

}
