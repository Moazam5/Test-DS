//
//  Heap.swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 2/15/26.
//

import Foundation
import Playgrounds

/// Heap is a complete binary tree.
/// Heap exists in two flavors, min heap and max heap.
/// FIXME :- Make this a generic implementation. 
struct MyHeap {
	var elements = [Int]()
	let priority: (Int, Int) -> Bool
	
	var isEmpty: Bool {
		self.elements.isEmpty
	}

	var count: Int {
		self.elements.count
	}

	func peek() -> Int? {
		self.elements.first
	}

	init(sort: @escaping (Int, Int) -> Bool) {
		self.priority = sort
	}

	/// Inserts the element at the right position in the heap.
	///
	/// - Complexity: O(log(`count`)) element comparisons

	mutating func insert(_ element: Int) {
		self.elements.append(element)
		self.bubbleUp(from: self.elements.count - 1)
	}

	/// Removes and returns the element at the root.
	///
	/// - Complexity: O(log(`count`)) element comparisons
	mutating func pop() -> Int? {
		guard !self.elements.isEmpty else { return nil }
		if self.elements.count == 1 { return self.elements.popLast() }
		let top = self.elements[0]
		self.elements[0] = self.elements.removeLast()
		self.trickleDown(from: 0)
		return top
	}

	private mutating func trickleDown(from index: Int) {
		var parent = index

		while true {
			let left = 2 * parent + 1
			let right = left + 1
			var candidate = parent

			if left < elements.count, priority(elements[left], elements[candidate]) {
				candidate = left
			}
			if right < elements.count, priority(elements[right], elements[candidate]) {
				candidate = right
			}

			if candidate == parent { return }
			self.elements.swapAt(parent, candidate)
			parent = candidate
		}
	}

	mutating private func bubbleUp(from index: Int) {
		var child = index
		var parent = (child - 1) / 2
		while child > 0 && priority(self.elements[child], self.elements[parent]) {
			self.elements.swapAt(child, parent)
			child = parent
			parent = (child - 1) / 2
		}
	}
}
