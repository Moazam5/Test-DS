// TreesProblemsTests.swift
// Tests for TreesProblemsImpl.invertTree using Swift Testing framework

import Foundation
import Testing

// Helper function to compare two trees for equality
func treesEqual(_ a: TreeNode?, _ b: TreeNode?) -> Bool {
	switch (a, b) {
		case (nil, nil): return true
		case let (a?, b?):
			return a.value == b.value &&
			treesEqual(a.left, b.left) &&
			treesEqual(a.right, b.right)
		default:
			return false
	}
}

@Suite("TreesProblemsImpl.invertTree tests")
struct InvertTreeTests {
    let impl = TreesProblemsImpl()

    @Test("invertTree returns nil for nil input")
    func testNilInput() async throws {
        let result = impl.invertTree(root: nil)
        #expect(result == nil)
    }

    @Test("invertTree inverts a single node tree")
    func testSingleNode() async throws {
        let node = TreeNode(value: 1)
        let result = impl.invertTree(root: node)
        #expect(result?.value == 1)
        #expect(result?.left == nil)
        #expect(result?.right == nil)
    }

    @Test("invertTree inverts a simple binary tree")
    func testSimpleTree() async throws {
        // Original Tree:
        //   1
        //  / \
        // 2   3
        let left = TreeNode(value: 2)
        let right = TreeNode(value: 3)
        let root = TreeNode(value: 1, left: left, right: right)
        let result = impl.invertTree(root: root)
        // The inverted tree should have left=3, right=2
        #expect(result?.value == 1)
        #expect(result?.left?.value == 3)
        #expect(result?.right?.value == 2)
        #expect(result?.left?.left == nil && result?.left?.right == nil)
        #expect(result?.right?.left == nil && result?.right?.right == nil)
    }
}
