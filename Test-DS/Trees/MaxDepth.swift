//
//  MaxDepth.swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 10/12/25.
//

import Foundation

extension TreesProblemsImpl {
	func maxDepth(_ root: TreeNode?) -> Int {
		guard let root = root else { return 0 }
		return 1 + max(maxDepth(root.left), maxDepth(root.right))
	}
}
