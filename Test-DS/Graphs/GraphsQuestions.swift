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

	func hasCycleBFS(adjacencyList: [Int: [Int]], vertices: Int) -> Bool
	/// https://www.youtube.com/watch?v=zQ3zgFypzX4&list=PLgUwDviBIf0rGEWe64KWas0Nryn7SCRWw&index=9
	func hasCycleDFS(adjacencyList: [Int: [Int]], vertices: Int) -> Bool

	/// https://www.youtube.com/watch?v=-vu34sct1g8&list=PLgUwDviBIf0rGEWe64KWas0Nryn7SCRWw&index=10
	func isBipartiteBFS(adjacencyList: [Int: [Int]], vertices: Int) -> Bool
	/// https://www.youtube.com/watch?v=KG5YFfR0j8A&list=PLgUwDviBIf0rGEWe64KWas0Nryn7SCRWw&index=11
	func isBipartiteDFS(adjacencyList: [Int : [Int]], vertices: Int) -> Bool

	/// https://leetcode.com/problems/possible-bipartition/
	func possibleBipartition(_ n: Int, _ dislikes: [[Int]]) -> Bool

	func hasCycleDFSWithStateEnum(adjacencyList: [Int: [Int]]) -> Bool
	/// https://www.youtube.com/watch?v=9twcmtQj4DU&list=PLgUwDviBIf0rGEWe64KWas0Nryn7SCRWw&index=12
	func hasCycleDFS(adjacencyList: [Int: [Int]]) -> Bool
}
