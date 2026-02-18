//
//  LastStoneWeight.swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 2/18/26.
//

import Foundation

extension HeapSolutions {
	func lastStoneWeight(_ stones: [Int]) -> Int {
		var heap = MyHeap(contentsOf: stones, isMinHeap: false)

		while heap.count > 1 {
			let y = heap.pop()!
			let x = heap.pop()!
			if y > x {
				let z = y - x
				heap.insert(z)
			}
		}
		return heap.isEmpty ? 0 : heap.pop()!
	}
}
