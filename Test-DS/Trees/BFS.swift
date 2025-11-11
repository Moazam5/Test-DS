//
//  BFS.swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 11/11/25.
//

import Foundation
import Testing

extension TreesProblemsImpl {
	func bfs(_ root: TreeNode?) -> [Int] {
		if root == nil { return [] }
		var q = [TreeNode]()
		var res = [Int]()
		q.append(root!)
		while !q.isEmpty {
			let node = q.removeFirst()
			res.append(node.value)
			if let left = node.left { q.append(left) }
			if let right = node.right { q.append(right) }
		}
		return res
	}
}

@Suite("TreesProblemsImpl.bfs tests")
struct BFSTests {
	let treesProblems = TreesProblemsImpl()
	
	@Test("nil root returns empty array")
	func testNilRoot() {
		let result = treesProblems.bfs(nil)
		#expect(result == [])
	}
	
	@Test("single node returns [value]")
	func testSingleNode() {
		let root = TreeNode(value: 42)
		let result = treesProblems.bfs(root)
		#expect(result == [42])
	}
	
	@Test("balanced tree returns level-order")
	func testBalancedTree() {
		//        1
		//       / \
		//      2   3
		//     / \ / \
		//    4  5 6  7
		let root = TreeNode(value: 1,
							left: TreeNode(value: 2,
										   left: TreeNode(value: 4),
										   right: TreeNode(value: 5)),
							right: TreeNode(value: 3,
											left: TreeNode(value: 6),
											right: TreeNode(value: 7)))
		let result = treesProblems.bfs(root)
		#expect(result == [1,2,3,4,5,6,7])
	}
	
	@Test("unbalanced tree returns correct BFS order")
	func testUnbalancedTree() {
		//        10
		//       /
		//      20
		//       \
		//       30
		//         \
		//         40
		let root = TreeNode(value: 10,
							left: TreeNode(value: 20,
										   left: nil,
										   right: TreeNode(value: 30,
														   left: nil,
														   right: TreeNode(value: 40))),
							right: nil)
		let result = treesProblems.bfs(root)
		#expect(result == [10,20,30,40])
	}
}
