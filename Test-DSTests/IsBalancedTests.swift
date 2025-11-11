import Testing

@Suite("Is Balanced Binary Tree Tests")
struct IsBalancedTests {
	// MARK: - Helpers
	private func makeNode(_ val: Int, left: TreeNode? = nil, right: TreeNode? = nil) -> TreeNode {
		let node = TreeNode(value: val)
		node.left = left
		node.right = right
		return node
	}

	@Test("Empty tree is balanced")
	func emptyTree() async throws {
		let solver = TreesProblemsImpl()
		let root: TreeNode? = nil
		#expect(solver.isBalanced(root) == true)
	}

	@Test("Single node is balanced")
	func singleNode() async throws {
		let solver = TreesProblemsImpl()
		let root = makeNode(1)
		#expect(solver.isBalanced(root) == true)
	}

	// Height 2 balanced
	//      1
	//     / \
	//    2   3
	@Test("Perfectly balanced height 2 is balanced")
	func balancedHeight2() async throws {
		let solver = TreesProblemsImpl()
		let left = makeNode(2)
		let right = makeNode(3)
		let root = makeNode(1, left: left, right: right)
		#expect(solver.isBalanced(root) == true)
	}

	// Slightly unbalanced: difference > 1 at root
	//      1
	//     /
	//    2
	//   /
	//  3
	@Test("Height difference > 1 is not balanced")
	func heightDifferenceGreaterThanOne() async throws {
		let solver = TreesProblemsImpl()
		let n3 = makeNode(3)
		let n2 = makeNode(2, left: n3)
		let root = makeNode(1, left: n2)
		#expect(solver.isBalanced(root) == false)
	}

	// Deeply unbalanced chain of length 4
	// 1-2-3-4
	@Test("Deeply unbalanced chain is not balanced")
	func deeplyUnbalancedChain() async throws {
		let solver = TreesProblemsImpl()
		let n4 = makeNode(4)
		let n3 = makeNode(3, left: n4)
		let n2 = makeNode(2, left: n3)
		let root = makeNode(1, left: n2)
		#expect(solver.isBalanced(root) == false)
	}

	// Balanced but not complete
	//      1
	//     / \
	//    2   3
	//   /
	//  4
	@Test("Balanced but not complete is balanced")
	func balancedButNotComplete() async throws {
		let solver = TreesProblemsImpl()
		let n4 = makeNode(4)
		let n2 = makeNode(2, left: n4)
		let n3 = makeNode(3)
		let root = makeNode(1, left: n2, right: n3)
		#expect(solver.isBalanced(root) == true)
	}
}
