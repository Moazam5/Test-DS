//
//  SortingProblems.swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 4/12/26.
//

import Foundation

protocol SortingProblems {
	func mergeSort(_ array: [Int]) -> [Int]
	func bubbleSort(_ array: [Int]) -> [Int]
	func selectionSort(_ array: [Int]) -> [Int]
}

struct SortingSolutions: SortingProblems {
	static let shared = SortingSolutions()
}
