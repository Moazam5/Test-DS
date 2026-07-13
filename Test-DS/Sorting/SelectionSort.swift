//
//  SelectionSort.swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 7/12/26.
//

import Foundation
import Playgrounds

extension SortingSolutions {
	func selectionSort(_ array: [Int]) -> [Int] {
		var array = array
		let n = array.count

		for i in 0..<n  {
			var currMinIndex = i

			for j in (i + 1)..<n {
				if array[j] < array[currMinIndex] {
					currMinIndex = j
				}
			}

			if currMinIndex != i {
				array.swapAt(i, currMinIndex)
			}
		}
		return array
	}
}

#Playground {
	let arr = [29,10,14,37,14]
	_ = SortingSolutions.shared.selectionSort(arr)
}
