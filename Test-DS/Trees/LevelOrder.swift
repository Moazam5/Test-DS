//
//  LevelOrder.swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 1/20/26.
//

import Foundation

extension TreesProblemsImpl {
	func levelOrder(_ root: TreeNode?) -> [[Int]] {
		var levels: [[Int]] = []

		var q = [TreeNode?]()
		q.append(root)
		while !q.isEmpty {
			let qLen = q.count
			var currentLevel = [Int]()
			for i in 0..<qLen {
				if let node = q.removeFirst() {
					currentLevel.append(node.value)
					q.append(node.left)
					q.append(node.right)
				}
			}
			if !levels.isEmpty {
				levels.append(currentLevel)
			}
		}
		return levels
	}
}
