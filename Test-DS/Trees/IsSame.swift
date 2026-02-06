//
//  IsSame.swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 1/19/26.
//

import Foundation

extension TreesProblemsImpl {
	func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
		guard let p, let q else {
			return true 
		}
		if p.value == q.value, isSameTree(p.left, q.left), isSameTree(p.right, q.right) {
			return true
		}
		return false
	}
}
