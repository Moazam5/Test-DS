//
//  KthLargest.swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 2/15/26.
//

import Foundation

class KthLargest {
	private var minHeap: MyHeap
	private let k: Int

	init(_ k: Int, _ nums: [Int]) {
		self.k = k
		self.minHeap = MyHeap(sort: <)
		for num in nums {
			self.minHeap.insert(num)
			if self.minHeap.count > k {
				self.minHeap.pop()
			}
		}


	}

	func add(_ val: Int) -> Int {
		self.minHeap.insert(val)
		if minHeap.count > k {
			minHeap.pop()
		}
		return minHeap.peek()!
	}
}
