//
//  MinDepth.swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 2/6/26.
//

import Foundation

extension GraphsImpl {
	func minDepth(_ root: TreeNode?) -> Int {
		guard let root else { return 0 }

		let left = minDepth(root.left)
		let right = minDepth(root.right)

		if left == 0 || right == 0 {
			return 1 + max(left, right)
		}

		return 1 + min(left, right)
	}
}
