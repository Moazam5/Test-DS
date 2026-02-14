//
//  CodeTemplateProtocol.swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 12/17/25.
//

import Foundation

protocol CodeTemplates {
	/// Two pointers: one input, opposite ends
	func twoPointers(_ arr: [Int], condition: () -> Bool) -> Int
	///	Two pointers: two inputs, exhaust both
	func twoPointersTwoInputs(_ arr1: [Int], _ arr2: [Int], condition: () -> Bool) -> Int

	func matrixVisualization(rows: Int, columns: Int)
}


