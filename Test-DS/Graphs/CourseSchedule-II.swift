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



	func findOrderDetailed(_ numCourses: Int, _ prerequisites: [[Int]]) -> [Int] {
		var indegree = Array(repeating: 0, count: numCourses)
		var adjacencyList: [Int: [Int]] = [:]
		var q = Array<Int>()
		q.reserveCapacity(numCourses)
		var results = Array<Int>()
		results.reserveCapacity(numCourses)

		for pair in prerequisites {
			let course = pair[0]
			let prereq = pair[1]
			adjacencyList[prereq, default: []].append(course)
			indegree[course] += 1
		}

		for i in 0..<numCourses where indegree[i] == 0 {
			q.append(i)
		}

		while !q.isEmpty {
			let node = q.removeFirst()
			results.append(node)

			for neighbor in adjacencyList[node, default: []] {
				indegree[neighbor] -= 1
				if indegree[neighbor] == 0 {
					q.append(neighbor)
				}
			}
		}

		return results.count == numCourses ? results : []
	}
}
