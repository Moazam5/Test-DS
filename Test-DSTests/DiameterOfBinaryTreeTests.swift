import Testing
@testable import Test_DS

@Suite("Diameter Of Binary Tree Tests")
struct DiameterOfBinaryTreeTests {
    // MARK: - Helpers
    private func makeNode(_ val: Int, left: TreeNode? = nil, right: TreeNode? = nil) -> TreeNode {
		let node = TreeNode(value: val)
        node.left = left
        node.right = right
        return node
    }

    // Empty tree
    @Test("Empty tree has diameter 0")
    func emptyTree() async throws {
        let solver = TreesProblemsImpl()
        let root: TreeNode? = nil
        let result = solver.diameterOfBinaryTree(root)
        #expect(result == 0)
    }

    // Single node
    @Test("Single node has diameter 0")
    func singleNode() async throws {
        let solver = TreesProblemsImpl()
        let root = makeNode(1)
        let result = solver.diameterOfBinaryTree(root)
        #expect(result == 0)
    }

    // Two nodes: root -> left
    @Test("Two nodes linear has diameter 1")
    func twoNodesLinear() async throws {
        let solver = TreesProblemsImpl()
        let child = makeNode(2)
        let root = makeNode(1, left: child)
        let result = solver.diameterOfBinaryTree(root)
        #expect(result == 1)
    }

    // Balanced tree of height 2
    //      1
    //     / \
    //    2   3
    //   / \
    //  4   5
    // Longest path could be 4-2-1-3; diameter counts edges: 3 edges
    @Test("Balanced tree height 2 has diameter 3")
    func balancedHeight2() async throws {
        let solver = TreesProblemsImpl()
        let n4 = makeNode(4)
        let n5 = makeNode(5)
        let n2 = makeNode(2, left: n4, right: n5)
        let n3 = makeNode(3)
        let root = makeNode(1, left: n2, right: n3)
        let result = solver.diameterOfBinaryTree(root)
        #expect(result == 3)
    }

    // Skewed left chain length 4 (nodes 1-2-3-4)
    @Test("Skewed left chain length 4 has diameter 3")
    func skewedLeftChain() async throws {
        let solver = TreesProblemsImpl()
        let n4 = makeNode(4)
        let n3 = makeNode(3, left: n4)
        let n2 = makeNode(2, left: n3)
        let root = makeNode(1, left: n2)
        let result = solver.diameterOfBinaryTree(root)
        #expect(result == 3)
    }

    // Unbalanced tree where longest path passes through a non-root node
    //      1
    //     /
    //    2
    //   / \
    //  3   4
    //     / \
    //    5   6
    // Longest path: 3-2-4-5 (or 3-2-4-6) has 4 edges
    @Test("Unbalanced tree diameter through non-root is 4")
    func unbalancedThroughNonRoot() async throws {
        let solver = TreesProblemsImpl()
        let n5 = makeNode(5)
        let n6 = makeNode(6)
        let n4 = makeNode(4, left: n5, right: n6)
        let n3 = makeNode(3)
        let n2 = makeNode(2, left: n3, right: n4)
        let root = makeNode(1, left: n2)
        let result = solver.diameterOfBinaryTree(root)
        #expect(result == 3)
    }
}
