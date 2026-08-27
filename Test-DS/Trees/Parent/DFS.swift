//
//  DFS.swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 9/2/25.
//

import Foundation
import Playgrounds

extension TreesProblemsImpl {
	/// This is depth first traversal not depth first search, what are we searching? 
	func dfs(_ root: TreeNode?) -> [Int] {
		guard let root = root else {
			return []
		}

		var stack = [TreeNode]()
		var result = [Int]()
		stack.append(root)
		var depth = 0
		while !stack.isEmpty {
			depth += 1
			let node = stack.removeLast()
			result.append(node.value)

			// Add right first so left is processed first
			if let rightNode = node.right {
				stack.append(rightNode)
			}
			if let leftNode = node.left {
				stack.append(leftNode)
			}
		}
		print("Depth is \(depth) Result is \(result)")
		return result
	}

	func dfsRecursive(_ node: TreeNode?, depth: Int = 0, output: inout [(value: Int, depth: Int)]) {
		guard let node = node else { return }
		output.append((node.value, depth))
		dfsRecursive(node.right, depth: depth + 1, output: &output)
		dfsRecursive(node.left, depth: depth + 1, output: &output)
	}
}

#Playground {
	func makeSampleTree() -> TreeNode {
		let n1 = TreeNode(value: 1)
		let n2 = TreeNode(value: 2)
		let n3 = TreeNode(value: 3)
		let n4 = TreeNode(value: 4)
		let n5 = TreeNode(value: 5)
		n1.left = n2
		n1.right = n3
		n2.left = n4
		n2.right = n5
		return n1
	}

	let root = makeSampleTree()
	let impl = TreesProblemsImpl()
	let result = impl.dfs(root) // [1, 2, 4, 5, 3]

	let a = TreeNode(value: 1)
	let b = TreeNode(value: 2)
	let c = TreeNode(value: 3)
	a.right = b
	b.right = c
	let impl2 = TreesProblemsImpl()
	let result2 = impl.dfs(a) // [1, 2, 3])
}
