//
//  QuickSort.swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 7/13/26.
//

import Foundation
import Playgrounds

extension SortingSolutions {

	func quickSort(_ array: [Int]) -> [Int] {
		guard array.count > 1, let pivot = array.last else {
			return array
		}
		let rest = array.dropLast()
		let left = rest.filter { $0 <= pivot }
		let right = rest.filter { $0 > pivot}
		return quickSort(left) + [pivot] + quickSort(right)
	}
}

#Playground {
	let arr = [29,10,14,37,14]
	_ = SortingSolutions.shared.quickSort(arr)
}
