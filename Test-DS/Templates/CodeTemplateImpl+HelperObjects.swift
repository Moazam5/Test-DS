//
//  CodeTemplateImpl+HelperObjects.swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 2/20/26.
//

import Foundation

extension CodeTemplatesImpl {
	static let undirectedGraphWithCycleAL: [Int: [Int]] = [
		1: [2, 3],
		2: [1, 5],
		3: [1, 4, 6],
		4: [3],
		5: [2, 7],
		6: [3, 7],
		7: [5, 6]
	]

	static let topologicalSortAL: [Int: [Int]] = [
		0: [1],
		1: [3],
		2: [3],
		3: [],
		4: [0,2],
		5: [4],
		6: [4,5]
	]

	static let directedShortestPathEdges = [
		[0,1,2],
		[1,3,1],
		[2,3,3],
		[4,0,3],
		[4,2,1],
		[5,4,1],
		[6,4,2],
		[6,5,3]
	]

	static let directedGraphWithCycle: [Int: [Int]] = [
		0: [1],
		1: [2],
		2: [0]  // ← cycle back to 0
	]

	static let directedGraphWithoutCycle: [Int: [Int]] = [
		0: [1, 2],
		1: [3],
		2: [3],
		3: []
	]

	static let letters: [Character] = {
		(97...122).map { Character(UnicodeScalar($0)!) }
	}()
}
