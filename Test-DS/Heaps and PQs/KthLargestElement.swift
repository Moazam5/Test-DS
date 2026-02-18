//
//  KthLargestElement.swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 2/18/26.
//

import Foundation

extension HeapSolutions {
	func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
		var minHeap = MyHeap<Int>()
		
		for num in nums {
			minHeap.insert(num)
			if minHeap.count > k {
				_ = minHeap.pop()
			}
		}
		
		return minHeap.pop()!
	}
}
