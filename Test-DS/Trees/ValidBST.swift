//
//  ValidBST.swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 11/29/25.
//

import Foundation

extension TreesProblemsImpl {
	func isValidBSTMinMax(_ root: TreeNode?) -> Bool {
		func validate(_ node: TreeNode?, min: Int?, max: Int?) -> Bool {
			guard let node else { return true }

			if let min, node.value <= min { return false }
			if let max, node.value >= max { return false }

			return validate(node.left, min: min, max: node.value) &&
				   validate(node.right, min: node.value, max: max)
		}

		return validate(root, min: nil, max: nil)
	}


	func isValidBST(_ root: TreeNode?) -> Bool {
		var prevValue: Int?
		func inOrder(_ root: TreeNode?, prevValue: inout Int?) -> Bool {
			guard let root else {
				return true
			}

			if !inOrder(root.left, prevValue: &prevValue) {
				return false
			}
			if let prevValue, root.value <= prevValue {
				return false
			}
			prevValue = root.value

			if !inOrder(root.right, prevValue: &prevValue) {
				return false
			}

			return true
		}

		return inOrder(root, prevValue: &prevValue)
	}

	func isValidBSTLessOptimal(_ root: TreeNode?) -> Bool {
		var values: [Int] = []
		func inOrder(_ root: TreeNode?, values: inout [Int]) {
			guard let root else {
				return
			}
			inOrder(root.left, values: &values)
			values.append(root.value)
			inOrder(root.right, values: &values)
		}

		inOrder(root, values: &values)

		return zip(values, values.dropFirst()).allSatisfy { $0 < $1 }
	}
}
