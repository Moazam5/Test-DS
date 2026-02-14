//
//  CourseSchedule-II.swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 2/13/26.
//

import Foundation

extension GraphsImpl {
	func findOrder(_ numCourses: Int, _ prerequisites: [[Int]]) -> [Int] {
		let adjacencyList = self.createDirectedAdjacencyList(from: prerequisites, vertices: numCourses)
		return self.topologicalSortBFS(adjacencyList: adjacencyList, vertices: numCourses)
	}
}
