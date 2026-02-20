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
}
