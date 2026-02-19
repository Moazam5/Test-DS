//
//  FindMedian.swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 2/18/26.
//

import Foundation

class MedianFinder {
	// For storing larger elements
	var minHeap = MyHeap<Int>(isMinHeap: true)
	// For storing smaller elements
	var maxHeap = MyHeap<Int>(isMinHeap: false)

	func addNum(_ num: Int) {
		if let top = minHeap.peek(), num > top {
			minHeap.insert(num)
		} else {
			maxHeap.insert(num)
		}
		if minHeap.count > maxHeap.count + 1 {
			let node = minHeap.pop()!
			maxHeap.insert(node)
		} else if maxHeap.count > minHeap.count + 1 {
			let node = maxHeap.pop()!
			minHeap.insert(node)
		}
	}

	func findMedian() -> Double {
		if minHeap.count > maxHeap.count {
			return Double(minHeap.peek()!)
		} else if maxHeap.count > minHeap.count {
			return Double(maxHeap.peek()!)
		} else {
			let minE = minHeap.peek()!
			let maxE = maxHeap.peek()!
			return Double((minE + maxE)) / 2.0
		}
	}
}
