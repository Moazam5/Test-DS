//
//  DFS.swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 9/2/25.
//

import Foundation

extension TreesProblemsImpl {
	func dfs(_ root: TreeNode?) -> [Int] {
		guard let root = root else {
			return []
		}

		var stack = [TreeNode]()
		var result = [Int]()
		stack.append(root)

		while !stack.isEmpty {
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

		return result
	}
}

#if canImport(Testing)
import Testing

@Suite("DFS tests")
struct DFSTests {
    // Helper to build a simple binary tree
    //    1
    //   / \
    //  2   3
    // / \
    //4   5
    private func makeSampleTree() -> TreeNode {
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

    @Test("dfs on empty tree returns empty array")
    func testEmptyTree() async throws {
        let impl = TreesProblemsImpl()
        let result = impl.dfs(nil)
        #expect(result.isEmpty)
    }

    @Test("dfs on single node returns that node")
    func testSingleNode() async throws {
        let root = TreeNode(value: 42)
        let impl = TreesProblemsImpl()
        let result = impl.dfs(root)
        #expect(result == [42])
    }

    @Test("dfs pre-order on balanced sample tree")
    func testPreorderSampleTree() async throws {
        let root = makeSampleTree()
        let impl = TreesProblemsImpl()
        let result = impl.dfs(root)
        // Expected pre-order: root, left subtree, right subtree
        #expect(result == [1, 2, 4, 5, 3])
    }

    @Test("dfs on right-skewed tree is root-to-leaf in order pushed")
    func testRightSkewed() async throws {
        let a = TreeNode(value: 1)
        let b = TreeNode(value: 2)
        let c = TreeNode(value: 3)
        a.right = b
        b.right = c
        let impl = TreesProblemsImpl()
        let result = impl.dfs(a)
        #expect(result == [1, 2, 3])
    }
}
#endif
