//
//  GraphsQuestions.swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 1/21/26.
//

import Foundation

protocol GraphsQuestions {
	func numIslands(_ grid: [[Character]]) -> Int
	func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool
	/// https://leetcode.com/problems/clone-graph/
	func cloneGraph(_ node: Node?) -> Node?
	/// https://leetcode.com/problems/word-search/
	func exist(_ board: [[Character]], _ word: String) -> Bool
	/// https://leetcode.com/problems/rotting-oranges/
	func orangesRotting(_ grid: [[Int]]) -> Int
	/// https://leetcode.com/problems/surrounded-regions/
	func solve(_ board: inout [[Character]])
	/// https://leetcode.com/problems/course-schedule/
	func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool
	/// https://leetcode.com/problems/minimum-depth-of-binary-tree/?envType=problem-list-v2&envId=depth-first-search
	func minDepth(_ root: TreeNode?) -> Int
	/// https://leetcode.com/problems/flood-fill/
	func floodFill(_ image: [[Int]], _ sr: Int, _ sc: Int, _ color: Int) -> [[Int]]
	/// https://neetcode.io/problems/count-connected-components
	func countComponents(_ n: Int, _ edges: [[Int]]) -> Int

	// MARK: Bipartite Graph Problems
	/// https://www.youtube.com/watch?v=-vu34sct1g8&list=PLgUwDviBIf0rGEWe64KWas0Nryn7SCRWw&index=10
	func isBipartiteBFS(adjacencyList: [Int: [Int]], vertices: Int) -> Bool
	/// https://www.youtube.com/watch?v=KG5YFfR0j8A&list=PLgUwDviBIf0rGEWe64KWas0Nryn7SCRWw&index=11
	func isBipartiteDFS(adjacencyList: [Int : [Int]], vertices: Int) -> Bool
	/// https://leetcode.com/problems/possible-bipartition/
	func possibleBipartition(_ n: Int, _ dislikes: [[Int]]) -> Bool

	// MARK: Graph Cycle Detection
	func hasCycleDFSWithStateEnum(adjacencyList: [Int: [Int]]) -> Bool
	/// https://www.youtube.com/watch?v=9twcmtQj4DU&list=PLgUwDviBIf0rGEWe64KWas0Nryn7SCRWw&index=12
	func hasCycleDFS(adjacencyList: [Int: [Int]]) -> Bool
	func hasCycleBFS(adjacencyList: [Int: [Int]], vertices: Int) -> Bool
	/// https://www.youtube.com/watch?v=zQ3zgFypzX4&list=PLgUwDviBIf0rGEWe64KWas0Nryn7SCRWw&index=9
	func hasCycleDFS(adjacencyList: [Int: [Int]], vertices: Int) -> Bool
	/// https://www.youtube.com/watch?v=iTBaI90lpDQ&list=PLgUwDviBIf0rGEWe64KWas0Nryn7SCRWw&index=15
	func hasCycleKahns(adjacencyList: [Int : [Int]]) -> Bool
	/// Detailed version
	func hasCycleKahnsDetailed(adjacencyList: [Int : [Int]], vertices: Int) -> Bool

	// MARK: Topological Sort
	/// https://www.youtube.com/watch?v=5lZ0iJMrUMk&list=PLgUwDviBIf0rGEWe64KWas0Nryn7SCRWw&index=13
	func topologicalSort(adjacencyList: [Int : [Int]], vertices: Int) -> [Int]
	/// Also known as Kahn's Algorithm ~ https://www.youtube.com/watch?v=73sneFXuTEg&list=PLgUwDviBIf0rGEWe64KWas0Nryn7SCRWw&index=14
	func topologicalSortBFS(adjacencyList: [Int : [Int]], vertices: Int) -> [Int]
}
