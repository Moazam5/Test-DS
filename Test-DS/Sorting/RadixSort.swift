//
//  RadixSort.swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 7/13/26.
//

import Foundation
import Playgrounds

extension SortingSolutions {
	func radixSort(_ array: [Int]) -> [Int] {
		guard array.count > 1 else {
			return array
		}
		var array = array
		var exp = 1
		let maxVal = array.max() ?? 0

		while maxVal / exp > 0 {
			array = countingSortByDigit(array, exp)
			exp *= 10
		}
		return array
	}

	// Stable counting sort keyed on the digit at position `exp`.
	private func countingSortByDigit(_ array: [Int], _ exp: Int) -> [Int] {
		let n = array.count
		var output = [Int](repeating: 0, count: n)
		var count = [Int](repeating: 0, count: 10)  // one bucket per digit 0...9

		// Tally how many values have each digit at this position
		for num in array {
			let digit = (num / exp) % 10
			count[digit] += 1
		}

		// Turn counts into starting positions (prefix sums)
		for i in 1..<10 {
			count[i] += count[i - 1]
		}

		// Place elements right-to-left to keep the sort stable
		for i in stride(from: n - 1, through: 0, by: -1) {
			let digit = (array[i] / exp) % 10
			count[digit] -= 1
			output[count[digit]] = array[i]
		}

		return output
	}
}

#Playground {
	let arr = [29,10,14,37,14]
	_ = SortingSolutions.shared.radixSort(arr)
	_ = SortingSolutions.shared.radixSort([3,15,27,481, 50])
}
