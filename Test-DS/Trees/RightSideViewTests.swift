import Testing

// Helper to build trees
private func makeBalancedTree() -> TreeNode {
	//      1
	//     / \
	//    2   3
	//   / \   \
	//  4   5   6
	let n1 = TreeNode(value: 1)
	let n2 = TreeNode(value: 2)
	let n3 = TreeNode(value: 3)
	let n4 = TreeNode(value: 4)
	let n5 = TreeNode(value: 5)
	let n6 = TreeNode(value: 6)
	n1.left = n2; n1.right = n3
	n2.left = n4; n2.right = n5
	n3.right = n6
	return n1
}

private func makeRightSkewedTree() -> TreeNode {
	let n1 = TreeNode(value: 10)
	let n2 = TreeNode(value: 20)
	let n3 = TreeNode(value: 30)
	n1.right = n2; n2.right = n3
	return n1
}

private func makeLeftSkewedTree() -> TreeNode {
	let n1 = TreeNode(value: 11)
	let n2 = TreeNode(value: 22)
	let n3 = TreeNode(value: 33)
	n1.left = n2; n2.left = n3
	return n1
}

@Suite("TreesProblemsImpl.rightSideView tests")
struct RightSideViewTests {
	let impl = TreesProblemsImpl()

	@Test("rightSideView on empty tree returns empty array")
	func testEmptyTree() async throws {
		let result = impl.rightSideView(nil)
		#expect(result.isEmpty)
	}

	@Test("rightSideView on single node returns [value]")
	func testSingleNode() async throws {
		let node = TreeNode(value: 42)
		let result = impl.rightSideView(node)
		#expect(result == [42])
	}

	@Test("rightSideView on balanced tree returns right view")
	func testBalancedTree() async throws {
		let root = makeBalancedTree()
		let result = impl.rightSideView(root)
		// The visible nodes from right side: 1, 3, 6
		#expect(result == [1,3,6])
	}

	@Test("rightSideView on right-skewed tree returns all nodes top-down")
	func testRightSkewedTree() async throws {
		let root = makeRightSkewedTree()
		let result = impl.rightSideView(root)
		#expect(result == [10,20,30])
	}

	@Test("rightSideView on left-skewed tree returns topmost in each level")
	func testLeftSkewedTree() async throws {
		let root = makeLeftSkewedTree()
		let result = impl.rightSideView(root)
		#expect(result == [11,22,33])
	}
}
