//
//  Graphs+SearchMatrix.swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 1/13/26.
//

import Foundation
import Playgrounds

extension GraphsImpl {
	func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
		let firstCol = matrix.map { $0.first }
		let index = search(firstCol as! [Int], target)
		let targetRow = matrix[index]
		let final = search(targetRow, target)
		if matrix[index][final] == target {
			return true
		} else {
			return false
		}
	}

	func search(_ nums: [Int], _ target: Int) -> Int {
			var low = 0
			var high = nums.count - 1
			var midIndex = -1

			while low <= high {
				midIndex = low + (high - low) / 2
				let mid = nums[midIndex]
				if  mid == target{
					return midIndex
				} else if mid > target {
					high = midIndex - 1
				} else {
					low = midIndex + 1
				}
			}
			return midIndex
		}
}

#Playground {
	let graphImpl = GraphsImpl()
	graphImpl.searchMatrix([[1,3,5,7],[10,11,16,20],[23,30,34,60]], 10)
}
