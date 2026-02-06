//
//  Trees.swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 7/29/25.
//

import Foundation

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

