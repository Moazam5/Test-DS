//
//  MergeSort.swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 4/12/26.
//

import Foundation
import Playgrounds


extension SortingSolutions {
	func mergeSort(_ array: [Int]) -> [Int] {
		guard array.count > 1 else { return array }

		// Recursively splits and re-merges in sorted order
		let mid  = array.count / 2
		let left = mergeSort(Array(array[..<mid]))
		let right = mergeSort(Array(array[mid...]))

		return merge(left, right)
	}

	// Zips two sorted arrays into one sorted array
	func merge(_ left: [Int], _ right: [Int]) -> [Int] {
		var result = [Int]()
		result.reserveCapacity(left.count + right.count)
		var i = 0, j = 0

		while i < left.count && j < right.count {
			if left[i] <= right[j] {
				result.append(left[i]);  i += 1
			} else {
				result.append(right[j]); j += 1
			}
		}

		result += left[i...]   // append any remaining left elements
		result += right[j...]  // append any remaining right elements
		return result
	}
}


#Playground {
	let nums = [38, 27, 43, 3, 9, 82, 10]
	let sorted = SortingSolutions.shared.mergeSort(nums)
}
