//
//  BubbleSort.swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 7/12/26.
//

import Foundation
import Playgrounds

extension SortingSolutions {
	func bubbleSort(_ array: [Int]) -> [Int] {
		let n = array.count
		var array = array

		for i in 0..<n-1 {
			var swapped = false
			for j in 0..<(n - i - 1) {
				if array[j] > array[j + 1] {
					array.swapAt(j, j + 1)
					swapped = true
				}
			}
			if !swapped {
				break
			}
		}
		return array
	}
}

#Playground {
	let arr = [29,10,14,37,14]
	_ = SortingSolutions.shared.bubbleSort(arr)
}
